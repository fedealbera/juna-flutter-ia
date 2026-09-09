import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../../about/presentation/bloc/about_bloc.dart';
import '../../../about/presentation/bloc/about_event.dart';
import '../../../about/presentation/bloc/about_state.dart';
import '../../../settings/domain/entities/event_settings.dart';
import '../../../settings/domain/repositories/settings_repository.dart';
import '../../../content/presentation/screens/content_list_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> with TickerProviderStateMixin {
  final TenantManager _tenantManager = getIt<TenantManager>();
  late final AboutBloc _aboutBloc;
  EventSettings? _settings;

  final ScrollController _scrollController = ScrollController();
  bool _showScrollIndicator = true;
  late final AnimationController _bounceController;
  late final Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _aboutBloc = getIt<AboutBloc>();
    _settings = getIt<SettingsRepository>().getCachedSettings();

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollController.offset > 30 && _showScrollIndicator) {
          setState(() {
            _showScrollIndicator = false;
          });
        } else if (_scrollController.offset <= 30 && !_showScrollIndicator) {
          setState(() {
            _showScrollIndicator = true;
          });
        }
      }
    });

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: 0.0, end: 6.0).animate(
      CurvedAnimation(
        parent: _bounceController,
        curve: Curves.easeInOut,
      ),
    );

    _loadData();
    _tenantManager.addListener(_onTenantChanged);
  }

  void _loadData() {
    _aboutBloc.add(const AboutEvent.loadAboutInfo());
  }

  void _onTenantChanged() {
    _loadData();
    setState(() {
      _settings = getIt<SettingsRepository>().getCachedSettings();
    });
  }

  @override
  void dispose() {
    _tenantManager.removeListener(_onTenantChanged);
    _scrollController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  Future<void> _openWhatsapp(String rawPhone) async {
    final phone = rawPhone.replaceAll(RegExp(r'\D'), '');
    if (phone.isEmpty) return;
    final nativeUri = Uri.parse('whatsapp://send?phone=$phone');
    final webUri = Uri.parse('https://wa.me/$phone');
    try {
      if (await canLaunchUrl(nativeUri)) {
        await launchUrl(nativeUri);
      } else {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      try {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No se pudo abrir WhatsApp.'),
            ),
          );
        }
      }
    }
  }

  Future<void> _launchURL(String urlString) async {
    if (urlString.isEmpty) return;
    final uri = Uri.parse(urlString);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No se pudo abrir la aplicación de contacto.'),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;

    return BlocProvider<AboutBloc>.value(
      value: _aboutBloc,
      child: Scaffold(
        backgroundColor: activeTenant.backgroundColorRef,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // WhatsApp Support Card
                  _buildContactCard(
                    title: 'WhatsApp',
                    subtitle:
                        _settings?.isEnabledWhatsapp == true
                            ? Text(
                                _formatWhatsappPhone(_settings?.whatsappPhone ?? ""),
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            : Text(
                                'Canal no Habilitado',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                    icon: FontAwesomeIcons.whatsapp,
                    badgeColor: const Color(0xFF25D366),
                    isEnabled: _settings?.isEnabledWhatsapp == true,
                    onTap:
                        _settings?.isEnabledWhatsapp == true
                            ? () => _openWhatsapp(_settings?.whatsappPhone ?? '')
                            : null,
                  ),
                  const SizedBox(height: 12),

                  // Email Support Card
                  _buildContactCard(
                    title: 'Mail',
                    subtitle: Text(
                      _settings?.emailConsulta ?? '',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    icon: Icons.mail_outline_rounded,
                    badgeColor: const Color(0xFF2196F3),
                    isEnabled: true,
                    onTap: () {
                      final email = _settings?.emailConsulta ?? '';
                      _launchURL('mailto:$email');
                    },
                  ),
                  const SizedBox(height: 12),

                  // Info Importante Card
                  _buildContactCard(
                    title: 'Info Importante',
                    subtitle: Text(
                      'Documentación obligatoria',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    icon: Icons.info_outline_rounded,
                    badgeColor: const Color(0xFF9C27B0), // Purple
                    isEnabled: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContentListScreen(
                            title: 'Info Importante',
                            tipoContenido: 3,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildContactCard(
                    title: 'Compartir la App',
                    subtitle: Text(
                      _settings?.appTitle.isNotEmpty == true
                          ? _settings!.appTitle
                          : activeTenant.name,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    icon: Icons.share_rounded,
                    badgeColor: const Color(0xFF9C27B0), // Purple share badge color
                    isEnabled: true,
                    onTap: () {
                      final appTitle =
                          _settings?.appTitle.isNotEmpty == true
                              ? _settings!.appTitle
                              : activeTenant.name;

                      final String shareText;
                      final stores = _settings?.urlStoresMap ?? const {};
                      if (stores.isNotEmpty) {
                        final iosLink = stores['IOS']?.toString() ?? '';
                        final androidLink = stores['ANDROID']?.toString() ?? '';
                        final buffer = StringBuffer();
                        buffer.writeln('Descargar la APP de $appTitle');
                        buffer.writeln(); // Enter
                        buffer.writeln('iOS: $iosLink');
                        buffer.write('Android: $androidLink');
                        shareText = buffer.toString();
                      } else {
                        final rawStores = _settings?.urlStores ?? '';
                        shareText = 'Descargar la APP de $appTitle\n\n$rawStores';
                      }

                      final box = context.findRenderObject() as RenderBox?;
                      final rect =
                          box != null
                              ? box.localToGlobal(Offset.zero) & box.size
                              : null;
                      SharePlus.instance.share(
                        ShareParams(text: shareText, sharePositionOrigin: rect),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<AboutBloc, AboutState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                        loaded: (info) {
                          final fullVersion = info.buildNumber.isNotEmpty
                              ? '${info.appVersion}+${info.buildNumber}'
                              : info.appVersion;
                          final typeVersion = _settings?.typeVersion ?? '';
                          final versionDisplay =
                              typeVersion.isNotEmpty
                                  ? '$fullVersion ($typeVersion)'
                                  : fullVersion;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AppCard(
                                style: AppCardStyle.glassmorphic,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 24,
                                  horizontal: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 5),

                                    // 1) PNG image adapted so it doesn't expand too much
                                    Image.asset(
                                      'assets/images/juna_app_logo.png',
                                      height: 80,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(height: 16),

                                    // 2) App description text
                                    Text(
                                      'Apps de alto rendimiento\nAndroid & iOS',
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.6),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),

                                    // 3) Email address
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Email: ',
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.6),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap:
                                              () => _launchURL(
                                                'mailto:churomobile@gmail.com',
                                              ),
                                          child: const Text(
                                            'churomobile@gmail.com',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),

                                    // 4) Actualizar la App Button using AppButton design system style
                                    AppButton(
                                      text: 'Actualizar la App',
                                      icon: Icons.file_download_rounded,
                                      textColor: Colors.white,
                                      type: AppButtonType.primary,
                                      onPressed: () {
                                        final stores =
                                            _settings?.urlStoresMap ?? const {};
                                        final iosLink = stores['IOS']?.toString() ?? '';
                                        final androidLink =
                                            stores['ANDROID']?.toString() ?? '';

                                        final platform = Theme.of(context).platform;
                                        if (platform == TargetPlatform.iOS) {
                                          if (iosLink.isNotEmpty) {
                                            _launchURL(iosLink);
                                          }
                                        } else if (platform == TargetPlatform.android) {
                                          if (androidLink.isNotEmpty) {
                                            _launchURL(androidLink);
                                          }
                                        } else {
                                          // Fallback for other environments
                                          if (androidLink.isNotEmpty) {
                                            _launchURL(androidLink);
                                          } else if (iosLink.isNotEmpty) {
                                            _launchURL(iosLink);
                                          }
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    Center(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withValues(alpha: 0.05),
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Colors.white.withValues(alpha: 0.1),
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          'VERSIÓN $versionDisplay',
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.5),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: IgnorePointer(
                ignoring: !_showScrollIndicator,
                child: AnimatedOpacity(
                  opacity: _showScrollIndicator ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (_scrollController.hasClients) {
                          final maxScroll = _scrollController.position.maxScrollExtent;
                          _scrollController.animateTo(
                            maxScroll,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: activeTenant.accentColorRef.withValues(alpha: 0.5),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: activeTenant.accentColorRef.withValues(alpha: 0.25),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'DESLIZA PARA VER MÁS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            ),
                            const SizedBox(width: 6),
                            AnimatedBuilder(
                              animation: _bounceAnimation,
                              builder: (context, child) {
                                return Transform.translate(
                                  offset: Offset(0.0, _bounceAnimation.value),
                                  child: child,
                                );
                              },
                              child: Icon(
                                Icons.keyboard_double_arrow_down_rounded,
                                color: activeTenant.accentColorRef,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatWhatsappPhone(String phone) {
    if (phone.isEmpty) return '';
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    final hasPlus = phone.startsWith('+');

    if (digits.startsWith('549') && digits.length == 13) {
      final country = digits.substring(0, 2);
      final prefix = digits.substring(2, 3);
      final area = digits.substring(3, 6);
      final localPart1 = digits.substring(6, 9);
      final localPart2 = digits.substring(9, 13);
      return '${hasPlus ? "+" : ""}$country $prefix $area $localPart1-$localPart2';
    } else if (digits.startsWith('54') && digits.length == 12) {
      final country = digits.substring(0, 2);
      final area = digits.substring(2, 5);
      final localPart1 = digits.substring(5, 8);
      final localPart2 = digits.substring(8, 12);
      return '${hasPlus ? "+" : ""}$country $area $localPart1-$localPart2';
    }

    if (digits.length > 10) {
      final countryLen = digits.length - 10;
      final country = digits.substring(0, countryLen);
      final area = digits.substring(countryLen, countryLen + 3);
      final part1 = digits.substring(countryLen + 3, countryLen + 6);
      final part2 = digits.substring(countryLen + 6);
      return '${hasPlus ? "+" : ""}$country $area $part1-$part2';
    }

    return phone;
  }

  Widget _buildContactCard({
    required String title,
    required Widget subtitle,
    required IconData icon,
    required Color badgeColor,
    required bool isEnabled,
    required VoidCallback? onTap,
  }) {
    final card = AppCard(
      style: AppCardStyle.glassmorphic,
      padding: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Badge Icon Circle
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color:
                      isEnabled
                          ? badgeColor.withValues(alpha: 0.1)
                          : Colors.white.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isEnabled ? badgeColor : Colors.white24,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            isEnabled
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    subtitle,
                  ],
                ),
              ),

              // Right Chevron indicator (only if enabled)
              if (isEnabled) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white.withValues(alpha: 0.4),
                  size: 16,
                ),
              ],
            ],
          ),
        ),
      ),
    );

    return isEnabled ? card : Opacity(opacity: 0.4, child: card);
  }
}

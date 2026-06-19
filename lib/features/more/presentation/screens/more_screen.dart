import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  late final AboutBloc _aboutBloc;
  EventSettings? _settings;

  @override
  void initState() {
    super.initState();
    _aboutBloc = getIt<AboutBloc>();
    _settings = getIt<SettingsRepository>().getCachedSettings();

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
    super.dispose();
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
            const SnackBar(content: Text('No se pudo abrir la aplicación de contacto.')),
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 2. Contact form section redesigned matching screenshot
              const Text(
                  'Estamos para ayudarte',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  'Escribinos por el canal que prefieras y te respondemos lo antes posible.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),

                // WhatsApp Support Card
                _buildContactCard(
                  title: 'Escribinos por WhatsApp',
                  subtitle: _settings?.isEnabledWhatsapp == true
                      ? Text(
                          'WhatsApp: ${_settings?.whatsappPhone ?? ""}',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Text(
                          'Canal no Habilitado',
                          style: TextStyle(color: Colors.white24, fontSize: 13),
                        ),
                  icon: Icons.chat_bubble_outline_rounded,
                  badgeColor: const Color(0xFF25D366),
                  isEnabled: _settings?.isEnabledWhatsapp == true,
                  onTap: _settings?.isEnabledWhatsapp == true
                      ? () {
                          final phone = _settings?.whatsappPhone ?? '';
                          final msg = _settings?.contactoMensajeWhatsapp ?? '';
                          final url = 'https://wa.me/$phone?text=${Uri.encodeComponent(msg)}';
                          _launchURL(url);
                        }
                      : null,
                ),
                const SizedBox(height: 12),

                // Email Support Card
                _buildContactCard(
                  title: 'Escribir por mail',
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Correo: ',
                            style: TextStyle(color: Colors.white.withValues(alpha: 0.4), fontSize: 13),
                          ),
                          Expanded(
                            child: Text(
                              _settings?.emailConsulta ?? '',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.8),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Te responderemos en un plazo máximo de 48 hs.',
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.4), fontSize: 11),
                      ),
                    ],
                  ),
                  icon: Icons.mail_outline_rounded,
                  badgeColor: const Color(0xFF2196F3),
                  isEnabled: true,
                  onTap: () {
                    final email = _settings?.emailConsulta ?? '';
                    _launchURL('mailto:$email');
                  },
                ),
                const SizedBox(height: 24),

                // 3. Social actions (Share) redesigned matching screenshot
                Text(
                  'GENERAL',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.4),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
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
                    final appTitle = _settings?.appTitle.isNotEmpty == true
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
                    final rect = box != null ? box.localToGlobal(Offset.zero) & box.size : null;
                    SharePlus.instance.share(
                      ShareParams(
                        text: shareText,
                        sharePositionOrigin: rect,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // 4. Platform Specifications (using AboutBloc)
                Text(
                  'ACERCA DE',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.4),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                BlocBuilder<AboutBloc, AboutState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
                      loaded: (info) {
                        final appTitle = _settings?.appTitle.isNotEmpty == true
                            ? _settings!.appTitle
                            : activeTenant.name;
                        final firstLetter = (appTitle.isNotEmpty ? appTitle[0] : 'J').toUpperCase();
                        
                        final typeVersion = _settings?.typeVersion ?? '';
                        final versionDisplay = typeVersion.isNotEmpty
                            ? '${info.appVersion} ($typeVersion)'
                            : info.appVersion;

                        final email = _settings?.emailConsulta ?? 'churomobile@gmail.com';

                        return AppCard(
                          style: AppCardStyle.glassmorphic,
                          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Logo Badge
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.08),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.15),
                                    width: 1.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    firstLetter,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Title & Subtitle
                              Text(
                                appTitle,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Apps de alto rendimiento Android & iOS',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.6),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 6),
                              
                              // Email Link
                              GestureDetector(
                                onTap: () => _launchURL('mailto:$email'),
                                child: Text(
                                  email,
                                  style: TextStyle(
                                    color: activeTenant.primaryColorRef,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Divider Line
                              Divider(color: Colors.white.withValues(alpha: 0.1)),
                              const SizedBox(height: 12),

                              // Version text
                              Text(
                                'Versión $versionDisplay',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.4),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),

                              // Actualizar la App Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0F172A),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    final stores = _settings?.urlStoresMap ?? const {};
                                    final iosLink = stores['IOS']?.toString() ?? '';
                                    final androidLink = stores['ANDROID']?.toString() ?? '';
                                    
                                    if (Theme.of(context).platform == TargetPlatform.iOS && iosLink.isNotEmpty) {
                                      _launchURL(iosLink);
                                    } else if (androidLink.isNotEmpty) {
                                      _launchURL(androidLink);
                                    } else if (iosLink.isNotEmpty) {
                                      _launchURL(iosLink);
                                    }
                                  },
                                  icon: const Icon(Icons.file_download_rounded, size: 20),
                                  label: const Text(
                                    'Actualizar la App',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // 5. Logout Action
                AppButton(
                  text: 'Salir / Cerrar Sesión',
                  icon: Icons.logout_rounded,
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  type: AppButtonType.outlined,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
  }



  Widget _buildContactCard({
    required String title,
    required Widget subtitle,
    required IconData icon,
    required Color badgeColor,
    required bool isEnabled,
    required VoidCallback? onTap,
  }) {
    return AppCard(
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
                  color: isEnabled
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
                        color: isEnabled ? Colors.white : Colors.white.withValues(alpha: 0.4),
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
  }


}

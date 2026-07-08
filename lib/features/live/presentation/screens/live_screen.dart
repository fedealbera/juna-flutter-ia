import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../core/theme/branding_manager.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../../content/presentation/screens/content_list_screen.dart';
import '../../../maps/presentation/screens/maps_screen.dart';
import '../../../settings/domain/entities/event_settings.dart';
import '../../../settings/domain/repositories/settings_repository.dart';
import '../../../social/presentation/bloc/social_bloc.dart';
import '../../../social/presentation/bloc/social_event.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  late final SocialBloc _socialBloc;
  EventSettings? _settings;

  @override
  void initState() {
    super.initState();
    _socialBloc = getIt<SocialBloc>();
    _loadSocial();
    _settings = getIt<SettingsRepository>().getCachedSettings();

    _tenantManager.addListener(_onTenantChanged);
  }

  void _loadSocial() {
    _socialBloc.add(const SocialEvent.loadSocialLinks());
  }

  void _onTenantChanged() {
    _loadSocial();
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
            const SnackBar(content: Text('No se pudo abrir el enlace.')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;

    return BlocProvider<SocialBloc>.value(
      value: _socialBloc,
      child: Scaffold(
        backgroundColor: activeTenant.backgroundColorRef,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Header Section
                const Text(
                  'En Vivo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Sigue la carrera minuto a minuto',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),

                // 2. En Vivo Section Cards (COBERTURA)
                Text(
                  'COBERTURA',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.4),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                if (_settings?.isEnabledTiempos == true) ...[
                  _buildMenuItem(
                    title: 'Tiempos',
                    subtitle: 'Clasificaciones en tiempo real',
                    icon: Icons.emoji_events_outlined,
                    badgeColor: const Color(0xFFFFB300), // Gold/Yellow
                    isFeatured: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CircuitWebViewScreen(
                            title: 'Tiempos',
                            url: _settings?.urlTimes ?? '',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                ],
                _buildMenuItem(
                  title: 'Novedades',
                  subtitle: 'Noticias y actualizaciones',
                  icon: Icons.feed_outlined,
                  badgeColor: const Color(0xFF2196F3), // Blue
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContentListScreen(
                          title: 'Novedades',
                          tipoContenido: 2,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                _buildMenuItem(
                  title: 'Info Importante',
                  subtitle: 'Cronogramas, Reglamentos y más',
                  icon: Icons.info_outline_rounded,
                  badgeColor: const Color(0xFF9C27B0), // Purple
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
                const SizedBox(height: 32),

                // 3. Social & Web Section Header
                if ((_settings?.isEnabledInstagram == true) ||
                    (_settings?.isEnabledFacebook == true) ||
                    (_settings?.isEnabledWeb == true)) ...[
                  Text(
                    'SOCIAL & WEB',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.4),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // 4. Social & Web Options
                if (_settings?.isEnabledInstagram == true) ...[
                  _buildMenuItem(
                    title: 'Instagram',
                    subtitle: 'Sigue el feed oficial en Instagram',
                    icon: Icons.camera_alt_outlined,
                    badgeColor: const Color(0xFFE91E63), // Pink
                    isExternal: true,
                    onTap: () => _launchURL(_settings?.urlInstagram ?? ''),
                  ),
                  const SizedBox(height: 12),
                ],
                if (_settings?.isEnabledFacebook == true) ...[
                  _buildMenuItem(
                    title: 'Facebook',
                    subtitle: 'Únete a nuestra comunidad en Facebook',
                    icon: Icons.facebook_outlined,
                    badgeColor: const Color(0xFF1877F2), // Facebook Blue
                    isExternal: true,
                    onTap: () => _launchURL(_settings?.urlFacebook ?? ''),
                  ),
                  const SizedBox(height: 12),
                ],
                if (_settings?.isEnabledWeb == true) ...[
                  _buildMenuItem(
                    title: 'Sitio Web',
                    subtitle: 'Visita nuestra plataforma web oficial',
                    icon: Icons.language_rounded,
                    badgeColor: const Color(0xFF607D8B), // Slate/Grey
                    isExternal: true,
                    onTap: () => _launchURL(_settings?.urlWeb ?? ''),
                  ),
                  const SizedBox(height: 12),
                ],
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLiveBadge({bool isFeatured = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isFeatured 
            ? Colors.black.withValues(alpha: 0.4) 
            : Colors.redAccent.shade700,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isFeatured 
              ? Colors.white.withValues(alpha: 0.15) 
              : Colors.white.withValues(alpha: 0.3), 
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: isFeatured ? Colors.redAccent : Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          const Text(
            'VIVO',
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color badgeColor,
    required VoidCallback onTap,
    bool isFeatured = false,
    bool isExternal = false,
  }) {
    final activeTenant = _tenantManager.value;

    return AppCard(
      style: isFeatured ? AppCardStyle.gradient : AppCardStyle.glassmorphic,
      customGradient: isFeatured
          ? getIt<BrandingManager>().getPrimaryGradient(activeTenant)
          : null,
      padding: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(isFeatured ? 20.0 : 16.0),
          child: Row(
            children: [
              // Badge Icon Circle
              Container(
                width: isFeatured ? 52 : 44,
                height: isFeatured ? 52 : 44,
                decoration: BoxDecoration(
                  color: isFeatured 
                      ? Colors.white.withValues(alpha: 0.2) 
                      : badgeColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isFeatured ? Colors.white : badgeColor,
                  size: isFeatured ? 26 : 22,
                ),
              ),
              const SizedBox(width: 14),
              
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: isFeatured ? 18 : 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        if (isFeatured) ...[
                          const SizedBox(width: 8),
                          _buildLiveBadge(isFeatured: true),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: isFeatured ? 14 : 13,
                        color: isFeatured 
                            ? Colors.white.withValues(alpha: 0.9) 
                            : Colors.white.withValues(alpha: 0.6),
                        fontWeight: isFeatured ? FontWeight.w500 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),
              // Trailing indicator (Chevron or External link icon)
              Icon(
                isExternal ? Icons.open_in_new_rounded : Icons.arrow_forward_ios_rounded,
                color: isFeatured 
                    ? Colors.white.withValues(alpha: 0.8) 
                    : Colors.white.withValues(alpha: 0.4),
                size: isFeatured ? 18 : 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

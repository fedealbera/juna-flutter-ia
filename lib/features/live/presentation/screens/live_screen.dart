import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
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

                // 2. En Vivo Section Cards
                if (_settings?.isEnabledTiempos == true) ...[
                  _buildMenuItem(
                    title: 'Tiempos',
                    subtitle: 'Clasificaciones en tiempo real',
                    icon: Icons.emoji_events_outlined,
                    badgeColor: const Color(0xFFFFB300), // Gold/Yellow
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

  Widget _buildMenuItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color badgeColor,
    required VoidCallback onTap,
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
            children: [
              // Badge Icon Circle
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: badgeColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: badgeColor,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              // Right Chevron indicator
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white.withValues(alpha: 0.4),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

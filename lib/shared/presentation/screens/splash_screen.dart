import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../core/di/injection.dart';
import '../../../core/theme/tenant_manager.dart';
import '../../../core/firebase/firebase_configuration_repository.dart';
import '../../../core/firebase/initialize_firebase_use_case.dart';
import '../../../core/firebase/firebase_manager.dart';
import '../../../core/firebase/notification_service.dart';
import '../../../features/settings/domain/entities/event_settings.dart';
import '../../../features/settings/domain/repositories/settings_repository.dart';
import '../../design_system/dialogs/app_dialog.dart';
import '../../utils/store_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  final FirebaseConfigurationRepository _configRepository =
      getIt<FirebaseConfigurationRepository>();
  final InitializeFirebaseUseCase _initializeFirebaseUseCase =
      getIt<InitializeFirebaseUseCase>();
  final FirebaseManager _firebaseManager = getIt<FirebaseManager>();

  @override
  void initState() {
    super.initState();
    _bootstrapApp();
  }

  Future<void> _bootstrapApp() async {
    bool needsMandatoryUpdate = false;
    try {
      // 1. Obtener active tenant ID (default to 1 - DDLN)
      final currentTenant = _tenantManager.value;
      final int activeTenantId = int.tryParse(currentTenant.id) ?? 1;

      // 2. Obtener TenantConfig desde backend (o fallback local si falla)
      final tenantConfig = await _configRepository.getConfiguration(
        activeTenantId,
      );

      // 3. Aplicar Branding (actualizar TenantManager)
      await _tenantManager.changeTenant(tenantConfig);

      // 4. Inicializar Firebase dinámicamente
      await _initializeFirebaseUseCase(
        tenantConfig.tenantId,
        tenantConfig.firebase,
      );

      // 5. Inicializar NotificationService
      try {
        await getIt<NotificationService>().init();
      } catch (e) {
        debugPrint('Error initializing NotificationService: $e');
      }

      // 6. Obtener FCM Token
      if (tenantConfig.featureFlags.enableRemoteConfig) {
        await _firebaseManager.getFcmToken();
      }

      // 7. Obtener y cachear settings del evento 1 de la organización 1
      EventSettings? eventSettings;
      try {
        eventSettings = await getIt<SettingsRepository>().getEventSettings('1', '1');
      } catch (e) {
        debugPrint('Error loading event settings during bootstrap: $e');
      }

      // 8. Control de versión obligatorio (CHECK_VERSION y APP_VERSION)
      if (eventSettings != null && eventSettings.isEnabledCheckVersion) {
        final requiredVersion = eventSettings.appVersion.trim();
        if (requiredVersion.isNotEmpty) {
          try {
            final packageInfo = await PackageInfo.fromPlatform();
            final currentVersion = packageInfo.version.trim();

            if (currentVersion != requiredVersion) {
              needsMandatoryUpdate = true;
              if (mounted) {
                final tenant = _tenantManager.value;
                AppAlertDialog.show(
                  context: context,
                  barrierDismissible: false,
                  canPop: false,
                  type: AppDialogType.info,
                  customIcon: Icons.system_update_rounded,
                  customAccentColor: tenant.primaryColorRef,
                  primaryButtonColor: tenant.primaryColorRef,
                  title: 'Actualización requerida',
                  message:
                      'Hay una nueva versión disponible de la aplicación ($requiredVersion). Por favor, actualizala para continuar.',
                  primaryButtonText: 'Actualizar',
                  onPrimaryPressed: () => launchStoreUrl(context, eventSettings),
                );
              }
              return;
            }
          } catch (e) {
            debugPrint('Error checking app version: $e');
          }
        }
      }
    } catch (e) {
      debugPrint(
        'Error during application bootstrap: $e. Falling back to default.',
      );
    } finally {
      // 9. Continuar aplicación (ir a /home) solo si no requiere actualización obligatoria
      if (!needsMandatoryUpdate && mounted) {
        context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF090C15), // Deep premium dark background
      body: Stack(
        children: [
          // 1. Ambient Glow Spheres matching tenant brand
          Positioned(
            top: screenHeight * 0.15,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activeTenant.primaryColorRef.withValues(alpha: 0.12),
                boxShadow: [
                  BoxShadow(
                    color: activeTenant.primaryColorRef.withValues(alpha: 0.12),
                    blurRadius: 150,
                    spreadRadius: 40,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.15,
            right: -50,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activeTenant.secondaryColorRef.withValues(alpha: 0.08),
                boxShadow: [
                  BoxShadow(
                    color: activeTenant.secondaryColorRef.withValues(alpha: 0.08),
                    blurRadius: 180,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),

          // 2. Foreground Content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),

                  // Floating Glassmorphic card for the logo
                  Container(
                    width: 230,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.02),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                        BoxShadow(
                          color: activeTenant.primaryColorRef.withValues(alpha: 0.15),
                          blurRadius: 45,
                          spreadRadius: -8,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22.5),
                      child: Image.asset(
                        'assets/images/juna_app_logo.png',
                        fit: BoxFit.cover, // Transforms checkered background into a clean, premium textured background
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Loading presentation at the bottom
                  Text(
                    'Cargando tu experiencia...',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.4),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: activeTenant.primaryColorRef,
                      strokeWidth: 2.5,
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

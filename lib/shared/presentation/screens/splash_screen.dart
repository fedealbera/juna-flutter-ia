import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/di/injection.dart';
import '../../../core/theme/tenant_manager.dart';
import '../../../core/firebase/firebase_configuration_repository.dart';
import '../../../core/firebase/initialize_firebase_use_case.dart';
import '../../../core/firebase/firebase_manager.dart';
import '../../../features/settings/domain/repositories/settings_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  final FirebaseConfigurationRepository _configRepository = getIt<FirebaseConfigurationRepository>();
  final InitializeFirebaseUseCase _initializeFirebaseUseCase = getIt<InitializeFirebaseUseCase>();
  final FirebaseManager _firebaseManager = getIt<FirebaseManager>();

  @override
  void initState() {
    super.initState();
    _bootstrapApp();
  }

  Future<void> _bootstrapApp() async {
    try {
      // 1. Obtener active tenant ID (default to 1 - DDLN)
      final currentTenant = _tenantManager.value;
      final int activeTenantId = int.tryParse(currentTenant.id) ?? 1;

      // 2. Obtener TenantConfig desde backend (o fallback local si falla)
      final tenantConfig = await _configRepository.getConfiguration(activeTenantId);

      // 3. Aplicar Branding (actualizar TenantManager)
      await _tenantManager.changeTenant(tenantConfig);

      // 4. Inicializar Firebase dinámicamente
      await _initializeFirebaseUseCase(tenantConfig.tenantId, tenantConfig.firebase);

      // 5. Obtener FCM Token
      if (tenantConfig.featureFlags.enableRemoteConfig) {
        await _firebaseManager.getFcmToken();
      }

      // 6. Obtener y cachear settings del evento 1 de la organización 1
      try {
        await getIt<SettingsRepository>().getEventSettings('1', '1');
      } catch (e) {
        debugPrint('Error loading event settings during bootstrap: $e');
      }
    } catch (e) {
      debugPrint('Error during application bootstrap: $e. Falling back to default.');
    } finally {
      // 6. Continuar aplicación (ir a /home)
      if (mounted) {
        context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;

    return Scaffold(
      backgroundColor: activeTenant.backgroundColorRef,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              activeTenant.primaryColorRef.withValues(alpha: 0.15),
              activeTenant.secondaryColorRef.withValues(alpha: 0.05),
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Premium White Label loading display
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.03),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: activeTenant.primaryColorRef.withValues(alpha: 0.2),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: activeTenant.primaryColorRef.withValues(alpha: 0.1),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Image.network(
                    activeTenant.logoUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.electric_bolt_rounded,
                      color: activeTenant.primaryColorRef,
                      size: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                activeTenant.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Cargando tu experiencia...',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  color: activeTenant.primaryColorRef,
                  strokeWidth: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

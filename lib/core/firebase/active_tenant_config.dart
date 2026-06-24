import '../theme/tenant_config.dart';
import 'tenant_firebase_config.dart';
import '../env/env_config.dart';

class ActiveTenantConfig {
  static TenantConfig get() {
    return TenantConfig(
      tenantId: 1,
      tenantName: 'DDLN',
      logoUrl: 'https://images.unsplash.com/photo-1551632879-6dfc301c3490?w=150&q=80',
      primaryColor: '#E58D00',
      secondaryColor: '#212121',
      accentColor: '#FFC107',
      firebase: const FirebaseConfig(
        apiKey: 'AIzaSyBPpSvNQQlyJMCwI37bIXEepXJv3DpSKII',
        appId: '1:344966674512:android:e5ce8563caa25f40c1f955',
        messagingSenderId: '344966674512',
        projectId: 'ddln-mb',
        storageBucket: 'ddln-mb.firebasestorage.app',
        iosBundleId: 'com.churo.desafiomobile',
      ),
      featureFlags: const FeatureFlags(
        enableRegistration: true,
        enableLiveTracking: true,
        enableAnalytics: true,
        enableCrashlytics: true,
        enableRemoteConfig: true,
      ),
      baseUrl: 'https://juna.net.ar/desafio2026_testtt/api',
      environments: const {
        AppEnvironment.development: TenantEnvConfig(
          baseUrl: 'https://juna.net.ar/desafio2026_testtt/api',
          apiKey: 'juna_api_f7b9c3x2_secure_key_2026',
        ),
        AppEnvironment.qa: TenantEnvConfig(
          baseUrl: 'https://juna.net.ar/desafio2026_testtt/api',
          apiKey: 'juna_api_f7b9c3x2_secure_key_2026',
        ),
        AppEnvironment.production: TenantEnvConfig(
          baseUrl: 'https://juna.net.ar/desafio2026/api',
          apiKey: 'juna_api_f7b9c3x2_secure_key_2026',
        ),
      },
    );
  }
}

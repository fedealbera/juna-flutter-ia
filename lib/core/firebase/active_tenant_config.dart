import '../theme/tenant_config.dart';
import 'tenant_firebase_config.dart';
import '../env/env_config.dart';

class ActiveTenantConfig {
  static TenantConfig get() {
    return TenantConfig(
      tenantId: 2,
      tenantName: '21kLG',
      logoUrl: 'assets/21klg/app_logo_android.png',
      primaryColor: '#0D47A1',
      secondaryColor: '#1976D2',
      accentColor: '#FF5722',
      firebase: const FirebaseConfig(
        apiKey: 'AIzaSyAQUQ79V_h9wKTA1NUlTDPi5Fy0NXIFJQI',
        appId: '1:968260717587:android:7daa5be43f60d7c56b03e6',
        messagingSenderId: '968260717587',
        projectId: 'lagaceta21k',
        storageBucket: 'lagaceta21k.firebasestorage.app',
        iosBundleId: 'com.churomobile.lagaceta21k',
      ),
      featureFlags: const FeatureFlags(
        enableRegistration: true,
        enableLiveTracking: true,
        enableAnalytics: true,
        enableCrashlytics: true,
        enableRemoteConfig: true,
      ),
      baseUrl: 'https://juna.net.ar/lagaceta2026_test/api',
      environments: const {
        AppEnvironment.development: TenantEnvConfig(
          baseUrl: 'https://juna.net.ar/lagaceta2026_test/api',
          apiKey: 'juna_api_f7b9c3x2_secure_key_2026',
        ),
        AppEnvironment.qa: TenantEnvConfig(
          baseUrl: 'https://juna.net.ar/lagaceta2026_test/api',
          apiKey: 'juna_api_f7b9c3x2_secure_key_2026',
        ),
        AppEnvironment.production: TenantEnvConfig(
          baseUrl: 'https://juna.net.ar/lagaceta2026/api',
          apiKey: 'juna_api_7a1e4c9b_secure_key_2026',
        ),
      },
    );
  }
}

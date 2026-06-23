import '../theme/tenant_config.dart';
import '../env/env_config.dart';

class FirebaseConfig {
  final String apiKey;
  final String appId;
  final String messagingSenderId;
  final String projectId;
  final String storageBucket;
  final String? iosBundleId;
  final String? androidClientId;
  final String? iosClientId;

  const FirebaseConfig({
    required this.apiKey,
    required this.appId,
    required this.messagingSenderId,
    required this.projectId,
    required this.storageBucket,
    this.iosBundleId,
    this.androidClientId,
    this.iosClientId,
  });

  factory FirebaseConfig.fromJson(Map<String, dynamic> json) {
    return FirebaseConfig(
      apiKey: json['apiKey'] as String? ?? '',
      appId: json['appId'] as String? ?? '',
      messagingSenderId: json['messagingSenderId'] as String? ?? '',
      projectId: json['projectId'] as String? ?? '',
      storageBucket: json['storageBucket'] as String? ?? '',
      iosBundleId: json['iosBundleId'] as String?,
      androidClientId: json['androidClientId'] as String?,
      iosClientId: json['iosClientId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'apiKey': apiKey,
        'appId': appId,
        'messagingSenderId': messagingSenderId,
        'projectId': projectId,
        'storageBucket': storageBucket,
        'iosBundleId': iosBundleId,
        'androidClientId': androidClientId,
        'iosClientId': iosClientId,
      };
}

typedef TenantFirebaseConfig = FirebaseConfig;

class FeatureFlags {
  final bool enableRegistration;
  final bool enableLiveTracking;
  final bool enableAnalytics;
  final bool enableCrashlytics;
  final bool enableRemoteConfig;

  const FeatureFlags({
    required this.enableRegistration,
    required this.enableLiveTracking,
    this.enableAnalytics = true,
    this.enableCrashlytics = true,
    this.enableRemoteConfig = true,
  });

  factory FeatureFlags.fromJson(Map<String, dynamic> json) {
    return FeatureFlags(
      enableRegistration: json['enableRegistration'] as bool? ?? true,
      enableLiveTracking: json['enableLiveTracking'] as bool? ?? false,
      enableAnalytics: json['enableAnalytics'] as bool? ?? true,
      enableCrashlytics: json['enableCrashlytics'] as bool? ?? true,
      enableRemoteConfig: json['enableRemoteConfig'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
        'enableRegistration': enableRegistration,
        'enableLiveTracking': enableLiveTracking,
        'enableAnalytics': enableAnalytics,
        'enableCrashlytics': enableCrashlytics,
        'enableRemoteConfig': enableRemoteConfig,
      };
}

class DefaultFirebaseConfig {
  static FirebaseConfig ddln() {
    return const FirebaseConfig(
      apiKey: 'AIzaSyBPpSvNQQlyJMCwI37bIXEepXJv3DpSKII',
      appId: '1:344966674512:android:e5ce8563caa25f40c1f955',
      messagingSenderId: '344966674512',
      projectId: 'ddln-mb',
      storageBucket: 'ddln-mb.firebasestorage.app',
      iosBundleId: 'com.churo.desafiomobile',
    );
  }
}

class DefaultTenantConfig {
  static TenantConfig ddln() {
    return TenantConfig(
      tenantId: 1,
      tenantName: 'DDLN',
      logoUrl: 'https://images.unsplash.com/photo-1551632879-6dfc301c3490?w=150&q=80',
      primaryColor: '#E58D00',
      secondaryColor: '#212121',
      accentColor: '#FFC107',
      firebase: DefaultFirebaseConfig.ddln(),
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

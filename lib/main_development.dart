import 'bootstrap.dart';
import 'core/env/env_config.dart';

void main() {
  final devConfig = EnvConfig(
    environment: AppEnvironment.development,
    baseUrl: 'https://juna.net.ar/lagaceta2026_test/api',
    apiKey: 'juna_api_f7b9c3x2_secure_key_2026',
    enableAnalytics: false,
  );

  bootstrap(devConfig);
}

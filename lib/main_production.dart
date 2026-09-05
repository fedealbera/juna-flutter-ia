import 'bootstrap.dart';
import 'core/env/env_config.dart';

void main() {
  final prodConfig = EnvConfig(
    environment: AppEnvironment.production,
    baseUrl: 'https://juna.net.ar/lagaceta2026/api',
    apiKey: 'juna_api_7a1e4c9b_secure_key_2026',
    enableAnalytics: true,
  );

  bootstrap(prodConfig);
}

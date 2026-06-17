import 'bootstrap.dart';
import 'core/env/env_config.dart';

void main() {
  final prodConfig = EnvConfig(
    environment: AppEnvironment.production,
    baseUrl: 'https://juna.net.ar/desafio2026_testtt/api',
    apiKey: 'juna_api_f7b9c3x2_secure_key_2026',
    enableAnalytics: true,
  );

  bootstrap(prodConfig);
}

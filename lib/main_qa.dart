import 'bootstrap.dart';
import 'core/env/env_config.dart';

void main() {
  final qaConfig = EnvConfig(
    environment: AppEnvironment.qa,
    baseUrl: 'https://juna.net.ar/desafio2026_testtt/api',
    apiKey: 'juna_api_f7b9c3x2_secure_key_2026',
    enableAnalytics: true,
  );

  bootstrap(qaConfig);
}

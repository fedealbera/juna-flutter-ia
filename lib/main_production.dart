import 'bootstrap.dart';
import 'core/env/env_config.dart';

void main() {
  final prodConfig = EnvConfig(
    environment: AppEnvironment.production,
    baseUrl: 'https://api.sportevents.com/v3',
    apiKey: 'prod-key-sports-v3-abcde',
    enableAnalytics: true,
  );

  bootstrap(prodConfig);
}

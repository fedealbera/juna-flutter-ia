import 'bootstrap.dart';
import 'core/env/env_config.dart';

void main() {
  final devConfig = EnvConfig(
    environment: AppEnvironment.development,
    baseUrl: 'https://dev-api.sportevents.com/v3',
    apiKey: 'dev-key-sports-v3-12345',
    enableAnalytics: false,
  );

  bootstrap(devConfig);
}

import 'bootstrap.dart';
import 'core/env/env_config.dart';

void main() {
  final qaConfig = EnvConfig(
    environment: AppEnvironment.qa,
    baseUrl: 'https://qa-api.sportevents.com/v3',
    apiKey: 'qa-key-sports-v3-67890',
    enableAnalytics: true,
  );

  bootstrap(qaConfig);
}

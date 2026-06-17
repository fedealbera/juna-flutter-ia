import 'package:flutter_test/flutter_test.dart';
import 'package:event_platform_v3/core/env/env_config.dart';

void main() {
  test('EnvConfig fields map correctly', () {
    final devConfig = EnvConfig(
      environment: AppEnvironment.development,
      baseUrl: 'https://dev-api.sportevents.com/v3',
      apiKey: 'dev-key-sports-v3-12345',
      enableAnalytics: false,
    );

    expect(devConfig.environment, AppEnvironment.development);
    expect(devConfig.baseUrl, 'https://dev-api.sportevents.com/v3');
    expect(devConfig.apiKey, 'dev-key-sports-v3-12345');
    expect(devConfig.enableAnalytics, isFalse);
  });
}

enum AppEnvironment {
  development,
  qa,
  production;

  String get name => toString().split('.').last;
}

class EnvConfig {
  final AppEnvironment environment;
  final String baseUrl;
  final String apiKey;
  final bool enableAnalytics;

  const EnvConfig({
    required this.environment,
    required this.baseUrl,
    required this.apiKey,
    this.enableAnalytics = false,
  });
}

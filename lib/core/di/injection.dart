import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../env/env_config.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true, 
  asExtension: true,
)
Future<void> configureDependencies(EnvConfig envConfig) async {
  // Register env config directly so network clients/services can resolve it
  getIt.registerSingleton<EnvConfig>(envConfig);
  
  getIt.init(environment: envConfig.environment.name);
}

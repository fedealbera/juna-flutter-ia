import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'core/env/env_config.dart';
import 'core/di/injection.dart';
import 'core/storage/hive_service.dart';
import 'core/firebase/firebase_service.dart';
import 'core/firebase/notification_service.dart';
import 'core/theme/tenant_manager.dart';
import 'core/theme/theme_manager.dart';
import 'core/routing/app_router.dart';

Future<void> bootstrap(EnvConfig envConfig) async {
  final Logger logger = Logger();

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 1. Setup DI container
    await configureDependencies(envConfig);

    // 2. Initialize Storage (Hive)
    final hiveService = getIt<HiveService>();
    await hiveService.init();

    // 3. Initialize Firebase Services
    final firebaseService = getIt<FirebaseService>();
    await firebaseService.init(enableAnalytics: envConfig.enableAnalytics);

    // 4. Initialize Push Notifications
    final notificationService = getIt<NotificationService>();
    await notificationService.init();

    // 5. Initialize White Label Configurations
    final tenantManager = getIt<TenantManager>();
    await tenantManager.init();

    // 6. Launch Flutter root
    runApp(const App());
  }, (error, stackTrace) {
    logger.e('Uncaught asynchronous root error: $error', error: error, stackTrace: stackTrace);
  });
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  final ThemeManager _themeManager = getIt<ThemeManager>();
  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  void initState() {
    super.initState();
    // Dynamically rebuild app when tenant layout preferences change
    _tenantManager.addListener(_onTenantChanged);
  }

  @override
  void dispose() {
    _tenantManager.removeListener(_onTenantChanged);
    super.dispose();
  }

  void _onTenantChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;
    
    return MaterialApp.router(
      title: activeTenant.name,
      debugShowCheckedModeBanner: false,
      theme: _themeManager.getTheme(activeTenant),
      darkTheme: _themeManager.getDarkTheme(activeTenant),
      themeMode: ThemeMode.dark, // Default to Dark Mode for premium sports styling
      routerConfig: _appRouter.router,
    );
  }
}

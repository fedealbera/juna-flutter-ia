import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/registration/presentation/screens/registration_screen.dart';
import '../../features/participant/domain/entities/participant_detail.dart';
import '../../features/participant/presentation/screens/participant_documentation_screen.dart';
import '../../features/maps/presentation/screens/maps_screen.dart';
import '../../features/live/presentation/screens/live_screen.dart';
import '../../features/more/presentation/screens/more_screen.dart';
import '../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../shared/presentation/screens/main_shell_screen.dart';
import '../../shared/presentation/screens/splash_screen.dart';

@lazySingleton
class AppRouter {
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (BuildContext context, GoRouterState state) => const SplashScreen(),
      ),
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MainShellScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/inscripciones',
            name: 'inscripciones',
            builder: (BuildContext context, GoRouterState state) => const RegistrationScreen(),
            routes: [
              GoRoute(
                path: 'documentacion',
                name: 'documentacion',
                builder: (BuildContext context, GoRouterState state) {
                  final participant = state.extra as ParticipantDetail;
                  return ParticipantDocumentationScreen(participant: participant);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/mapas',
            name: 'mapas',
            builder: (BuildContext context, GoRouterState state) => const MapsScreen(),
          ),
          GoRoute(
            path: '/vivo',
            name: 'vivo',
            builder: (BuildContext context, GoRouterState state) => const LiveScreen(),
          ),
          GoRoute(
            path: '/mas',
            name: 'mas',
            builder: (BuildContext context, GoRouterState state) => const MoreScreen(),
          ),
          GoRoute(
            path: '/notificaciones',
            name: 'notificaciones',
            builder: (BuildContext context, GoRouterState state) => const NotificationsScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) => Scaffold(
      body: Center(
        child: Text('Error: Ruta no encontrada - ${state.uri}'),
      ),
    ),
  );
}

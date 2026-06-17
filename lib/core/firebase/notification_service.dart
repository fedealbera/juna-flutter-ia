import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class NotificationService {
  final Logger _logger = Logger();
  FirebaseMessaging? _messaging;

  Future<void> init() async {
    try {
      _messaging = FirebaseMessaging.instance;
      
      // Request permission
      final settings = await _messaging!.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      _logger.i('User notification permission status: ${settings.authorizationStatus}');

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        // Get token
        final token = await _messaging!.getToken();
        _logger.i('FCM Registration Token: $token');

        // Handle foreground notifications
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          _logger.i('Notification received in foreground: ${message.notification?.title}');
          _handleForegroundMessage(message);
        });

        // Handle app opened from notification
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          _logger.i('App opened via notification: ${message.data}');
          _handleNotificationNavigation(message);
        });
      }
    } catch (e) {
      _logger.w('Firebase Messaging setup skipped/failed: $e');
    }
  }

  void _handleForegroundMessage(RemoteMessage message) {
    // Custom foreground message handling UI trigger (e.g. dynamic alert, banner)
  }

  void _handleNotificationNavigation(RemoteMessage message) {
    // Routing redirect trigger matching payload parameter
  }

  Future<String?> getFcmToken() async {
    if (_messaging != null) {
      return await _messaging!.getToken();
    }
    return null;
  }
}

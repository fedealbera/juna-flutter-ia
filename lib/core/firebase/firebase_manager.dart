import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../env/env_config.dart';
import 'tenant_firebase_config.dart';
import '../../features/notifications/domain/repositories/notifications_repository.dart';

@lazySingleton
class FirebaseManager {
  final Logger _logger = Logger();
  final EnvConfig _envConfig;
  final NotificationsRepository _notificationsRepository;

  FirebaseAnalytics? _analytics;
  FirebaseMessaging? _messaging;
  String? _lastInitializedTenantId;

  FirebaseManager(this._envConfig, this._notificationsRepository);

  FirebaseAnalytics? get analytics => _analytics;
  FirebaseMessaging? get messaging => _messaging;

  Future<void> initializeFirebase(int tenantId, FirebaseConfig config) async {
    final tenantKey = tenantId.toString();
    if (_lastInitializedTenantId == tenantKey) return;
    _lastInitializedTenantId = tenantKey;

    try {
      if (kIsWeb ||
          defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS) {
        // Delete current default app if initialized
        try {
          final currentApp = Firebase.app();
          await currentApp.delete();
        } catch (_) {}

        final options = FirebaseOptions(
          apiKey: config.apiKey,
          appId: config.appId,
          messagingSenderId: config.messagingSenderId,
          projectId: config.projectId,
          storageBucket: config.storageBucket,
          iosBundleId: config.iosBundleId,
          androidClientId: config.androidClientId,
          iosClientId: config.iosClientId,
        );

        await Firebase.initializeApp(options: options);
        _logger.i('Firebase initialized dynamically for tenant ID: $tenantId');

        // Analytics
        if (_envConfig.enableAnalytics) {
          _analytics = FirebaseAnalytics.instance;
          await _analytics!.setAnalyticsCollectionEnabled(true);
        } else {
          _analytics = null;
        }

        // Messaging
        _messaging = FirebaseMessaging.instance;
      }
    } catch (e) {
      _logger.w('Dynamic Firebase initialization failed: $e');
    }
  }

  Future<String?> getFcmToken() async {
    try {
      if (_messaging != null) {
        // Request permission if not already authorized
        final settings = await _messaging!.getNotificationSettings();
        if (settings.authorizationStatus == AuthorizationStatus.notDetermined) {
          await _messaging!.requestPermission(
            alert: true,
            badge: true,
            sound: true,
          );
        }
        return await _messaging!.getToken();
      }
    } catch (e) {
      _logger.w('Failed to get FCM token: $e');
    }
    return null;
  }

  Future<void> registerFcmToken(int tenantId, String token, {String? dni}) async {
    try {
      await _notificationsRepository.registerFirebaseToken(
        documento: dni ?? '',
        idEvento: '1',
        idOrg: tenantId.toString(),
        token: token,
      );
      _logger.i('Registered FCM token dynamically for tenant ID: $tenantId');
    } catch (e) {
      _logger.w('Failed to register FCM token dynamically: $e');
    }
  }

  Future<void> logEvent({required String name, Map<String, Object>? parameters}) async {
    if (_analytics != null) {
      await _analytics!.logEvent(name: name, parameters: parameters);
    } else {
      _logger.d('Analytics Log [Manager]: $name ($parameters)');
    }
  }

  Future<void> setUserId(String? id) async {
    if (_analytics != null) {
      await _analytics!.setUserId(id: id);
    }
  }
}

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class FirebaseService {
  final Logger _logger = Logger();
  FirebaseAnalytics? _analytics;

  FirebaseAnalytics? get analytics => _analytics;

  Future<void> init({required bool enableAnalytics}) async {
    try {
      // In local environments without google-services.json/GoogleService-Info.plist,
      // Firebase.initializeApp() can throw an exception. We catch it to allow local runs.
      if (kIsWeb || defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
        await Firebase.initializeApp();
        _logger.i('Firebase initialized successfully.');

        if (enableAnalytics) {
          _analytics = FirebaseAnalytics.instance;
          await _analytics!.setAnalyticsCollectionEnabled(true);
          _logger.i('Firebase Analytics collection enabled.');
        }
      }
    } catch (e) {
      _logger.w('Firebase initialization skipped/failed: $e. '
          'Make sure google-services.json / GoogleService-Info.plist are correctly configured.');
    }
  }

  Future<void> logEvent({required String name, Map<String, Object>? parameters}) async {
    if (_analytics != null) {
      await _analytics!.logEvent(name: name, parameters: parameters);
    } else {
      _logger.d('Analytics Log [Offline]: $name ($parameters)');
    }
  }

  Future<void> setUserId(String? id) async {
    if (_analytics != null) {
      await _analytics!.setUserId(id: id);
    }
  }
}

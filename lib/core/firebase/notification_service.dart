import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../routing/app_router.dart';
import '../theme/tenant_manager.dart';
import '../di/injection.dart';

final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class LocalNotification {
  final String id;
  final String title;
  final String body;
  final bool isRead;
  final DateTime timestamp;

  LocalNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.isRead,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'isRead': isRead,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory LocalNotification.fromMap(Map<dynamic, dynamic> map) {
    return LocalNotification(
      id: map['id'] as String? ?? '',
      title: map['title'] as String? ?? '',
      body: map['body'] as String? ?? '',
      isRead: map['isRead'] as bool? ?? false,
      timestamp: DateTime.tryParse(map['timestamp'] as String? ?? '') ?? DateTime.now(),
    );
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    
    // Extract title & body
    final String initialTitle = message.notification?.title ?? '';
    final String initialBody = message.notification?.body ?? '';
    String finalTitle = initialTitle;
    String finalBody = initialBody;
    if (finalTitle.isEmpty || finalBody.isEmpty) {
      finalTitle = finalTitle.isNotEmpty ? finalTitle : (message.data['title'] ?? message.data['titulo'] ?? 'Juna');
      finalBody = finalBody.isNotEmpty ? finalBody : (message.data['body'] ?? message.data['message'] ?? message.data['mensaje'] ?? '');
    }

    if (finalTitle.isNotEmpty || finalBody.isNotEmpty) {
      await Hive.initFlutter();
      final Box<Map> box = await Hive.openBox<Map>('notifications_box');
      final String id = message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString();
      try {
        await box.put(id, {
          'id': id,
          'title': finalTitle,
          'body': finalBody,
          'isRead': false,
          'timestamp': DateTime.now().toIso8601String(),
        });
      } finally {
        await box.close();
      }

      // Show system notification tray alert in background isolate
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
          );
      const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
      );

      await _localNotificationsPlugin.initialize(initializationSettings);

      const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        'juna_push_channel',
        'Notificaciones Juna',
        channelDescription: 'Alertas e información del corredor',
        importance: Importance.max,
        priority: Priority.high,
      );
      const NotificationDetails details = NotificationDetails(
        android: androidDetails,
        iOS: DarwinNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true),
      );

      await _localNotificationsPlugin.show(
        id.hashCode,
        finalTitle,
        finalBody,
        details,
      );
    }
  } catch (e) {
    debugPrint('Error saving background message to Hive: $e');
  }
}

@lazySingleton
class NotificationService extends ChangeNotifier with WidgetsBindingObserver {
  final Logger _logger = Logger();
  FirebaseMessaging? _messaging;
  List<LocalNotification> _notifications = [];

  List<LocalNotification> get notifications => _notifications;
  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  Future<void> init() async {
    WidgetsBinding.instance.addObserver(this);
    try {
      _messaging = FirebaseMessaging.instance;
      
      // Initialize local notifications for active application
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
          );
      const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
      );

      await _localNotificationsPlugin.initialize(initializationSettings);

      // Load cached notifications at startup
      await refreshNotifications();

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
        // Set foreground presentation options to show heads-up notifications (mainly for iOS)
        await _messaging!.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

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

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    _logger.i('AppLifecycleState changed to: $state');
    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      try {
        if (Hive.isBoxOpen('notifications_box')) {
          await Hive.box<Map>('notifications_box').close();
          _logger.i('Closed notifications_box on app paused/detached');
        }
      } catch (e) {
        _logger.w('Error closing notifications_box: $e');
      }
    } else if (state == AppLifecycleState.resumed) {
      try {
        await refreshNotifications();
        _logger.i('Refreshed notifications on app resumed');
      } catch (e) {
        _logger.w('Error refreshing notifications on app resumed: $e');
      }
    }
  }

  Future<void> refreshNotifications() async {
    try {
      final box = await Hive.openBox<Map>('notifications_box');
      _notifications = box.values.map((map) {
        return LocalNotification.fromMap(map);
      }).toList();
      // Sort: newest first
      _notifications.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      notifyListeners();
    } catch (e) {
      _logger.w('Failed to load notifications from cache: $e');
    }
  }

  Future<void> saveNotification(String title, String body) async {
    try {
      final String id = DateTime.now().millisecondsSinceEpoch.toString();
      final newNotif = LocalNotification(
        id: id,
        title: title,
        body: body,
        isRead: false,
        timestamp: DateTime.now(),
      );
      
      final box = await Hive.openBox<Map>('notifications_box');
      await box.put(id, newNotif.toMap());
      
      _notifications.insert(0, newNotif);
      notifyListeners();
    } catch (e) {
      _logger.w('Failed to save notification: $e');
    }
  }

  Future<void> markAsRead(String id) async {
    try {
      final index = _notifications.indexWhere((n) => n.id == id);
      if (index != -1) {
        final current = _notifications[index];
        if (!current.isRead) {
          final updated = LocalNotification(
            id: current.id,
            title: current.title,
            body: current.body,
            isRead: true,
            timestamp: current.timestamp,
          );
          
          final box = await Hive.openBox<Map>('notifications_box');
          await box.put(id, updated.toMap());
          
          _notifications[index] = updated;
          notifyListeners();
        }
      }
    } catch (e) {
      _logger.w('Failed to mark notification as read: $e');
    }
  }

  Future<void> clearAll() async {
    try {
      final box = await Hive.openBox<Map>('notifications_box');
      await box.clear();
      _notifications.clear();
      notifyListeners();
    } catch (e) {
      _logger.w('Failed to clear notifications: $e');
    }
  }

  void _handleForegroundMessage(RemoteMessage message) async {
    final String initialTitle = message.notification?.title ?? '';
    final String initialBody = message.notification?.body ?? '';

    String finalTitle = initialTitle;
    String finalBody = initialBody;

    // Fallback to data payload keys if notification is null/empty (typical for data-only/custom server messages)
    if (finalTitle.isEmpty || finalBody.isEmpty) {
      finalTitle = finalTitle.isNotEmpty ? finalTitle : (message.data['title'] ?? message.data['titulo'] ?? 'Juna');
      finalBody = finalBody.isNotEmpty ? finalBody : (message.data['body'] ?? message.data['message'] ?? message.data['mensaje'] ?? '');
    }

    if (finalTitle.isEmpty && finalBody.isEmpty) {
      _logger.d('FCM message contains no displayable title or body. Skipping.');
      return;
    }

    // Save notification to local database and reload lists
    await saveNotification(finalTitle, finalBody);

    final overlayState = getIt<AppRouter>().rootNavigatorKey.currentState?.overlay;
    if (overlayState == null) {
      _logger.w('Failed to get overlay state from rootNavigatorKey. Dynamic foreground banner skipped.');
      return;
    }

    // Show a premium top banner using Overlay
    showTopNotificationBanner(
      overlayState,
      title: finalTitle,
      body: finalBody,
      onTap: () => _handleNotificationNavigation(message),
    );
  }

  void _handleNotificationNavigation(RemoteMessage message) {
    _logger.i('Handling notification navigation with payload: ${message.data}');
    final context = getIt<AppRouter>().rootNavigatorKey.currentContext;
    if (context == null) return;
    
    // Check if the notification payload contains a specific route redirection
    final route = message.data['route'] as String?;
    if (route != null && route.isNotEmpty) {
      context.go(route);
    } else {
      // Default fallback
      context.go('/notificaciones');
    }
  }

  Future<String?> getFcmToken() async {
    if (_messaging != null) {
      return await _messaging!.getToken();
    }
    return null;
  }
}

void showTopNotificationBanner(
  OverlayState overlayState, {
  required String title,
  required String body,
  required VoidCallback onTap,
}) {
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) {
      return TopNotificationWidget(
        title: title,
        body: body,
        onTap: () {
          overlayEntry.remove();
          onTap();
        },
        onDismiss: () {
          overlayEntry.remove();
        },
      );
    },
  );

  overlayState.insert(overlayEntry);
}

class TopNotificationWidget extends StatefulWidget {
  final String title;
  final String body;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  const TopNotificationWidget({
    super.key,
    required this.title,
    required this.body,
    required this.onTap,
    required this.onDismiss,
  });

  @override
  State<TopNotificationWidget> createState() => _TopNotificationWidgetState();
}

class _TopNotificationWidgetState extends State<TopNotificationWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    _controller.forward();

    // Auto-dismiss after 4 seconds
    _timer = Timer(const Duration(seconds: 4), () {
      _dismiss();
    });
  }

  void _dismiss() async {
    if (mounted) {
      await _controller.reverse();
      widget.onDismiss();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tenantManager = getIt<TenantManager>();
    final activeTenant = tenantManager.value;
    final primaryColor = activeTenant.primaryColorRef;

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: SlideTransition(
          position: _offsetAnimation,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  _timer?.cancel();
                  widget.onTap();
                },
                borderRadius: BorderRadius.circular(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: primaryColor.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withValues(alpha: 0.15),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: primaryColor.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: primaryColor.withValues(alpha: 0.4),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.notifications_active_rounded,
                            color: primaryColor,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.body,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white54,
                            size: 20,
                          ),
                          onPressed: _dismiss,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

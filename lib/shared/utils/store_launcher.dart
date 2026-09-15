import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../features/settings/domain/entities/event_settings.dart';

Future<void> launchStoreUrl(BuildContext context, EventSettings? settings) async {
  if (settings == null) return;
  final stores = settings.urlStoresMap;
  final iosLink = stores['IOS']?.toString() ?? stores['iOS']?.toString() ?? '';
  final androidLink = stores['ANDROID']?.toString() ?? stores['android']?.toString() ?? '';

  final platform = Theme.of(context).platform;
  String targetUrl = '';
  if (platform == TargetPlatform.iOS) {
    targetUrl = iosLink.isNotEmpty ? iosLink : settings.urlStores;
  } else if (platform == TargetPlatform.android) {
    targetUrl = androidLink.isNotEmpty ? androidLink : settings.urlStores;
  } else {
    targetUrl = androidLink.isNotEmpty ? androidLink : iosLink;
    if (targetUrl.isEmpty) {
      targetUrl = settings.urlStores;
    }
  }

  targetUrl = targetUrl.trim();
  if (targetUrl.isNotEmpty) {
    final uri = Uri.parse(targetUrl);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (_) {}
    }
  }
}

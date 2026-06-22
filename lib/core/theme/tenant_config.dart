import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase/tenant_firebase_config.dart';

enum SportType {
  running,
  trailRunning,
  mtb,
  duathlon;

  String get displayName {
    switch (this) {
      case SportType.running:
        return 'Running';
      case SportType.trailRunning:
        return 'Trail Running';
      case SportType.mtb:
        return 'MTB';
      case SportType.duathlon:
        return 'Duatlón';
    }
  }
}

class TenantConfig {
  final int tenantId;
  final String tenantName;
  final String logoUrl;

  final String primaryColor;
  final String secondaryColor;
  final String accentColor;

  final FirebaseConfig firebase;

  final FeatureFlags featureFlags;

  // Compatibility fields for the rest of the application
  final String? baseUrl;
  final List<SportType> supportedSports;

  const TenantConfig({
    required this.tenantId,
    required this.tenantName,
    required this.logoUrl,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.firebase,
    required this.featureFlags,
    this.baseUrl,
    this.supportedSports = const [
      SportType.running,
      SportType.trailRunning,
      SportType.mtb,
      SportType.duathlon,
    ],
  });

  // Helpers to get Colors from Hex Strings
  Color get primaryColorRef => Color(int.parse(primaryColor.replaceFirst('#', '0xff')));
  Color get secondaryColorRef => Color(int.parse(secondaryColor.replaceFirst('#', '0xff')));
  Color get accentColorRef => Color(int.parse(accentColor.replaceFirst('#', '0xff')));
  Color get backgroundColorRef => const Color(0xFF121212); // Standard dark mode background

  // Compatibility getters
  String get id => tenantId.toString();
  String get name => tenantName;
  bool get enableRegistration => featureFlags.enableRegistration;
  bool get enableLiveTracking => featureFlags.enableLiveTracking;

  FirebaseOptions get androidFirebaseOptions => FirebaseOptions(
        apiKey: firebase.apiKey,
        appId: firebase.appId,
        messagingSenderId: firebase.messagingSenderId,
        projectId: firebase.projectId,
        storageBucket: firebase.storageBucket,
      );

  FirebaseOptions get iosFirebaseOptions => FirebaseOptions(
        apiKey: firebase.apiKey,
        appId: firebase.appId,
        messagingSenderId: firebase.messagingSenderId,
        projectId: firebase.projectId,
        storageBucket: firebase.storageBucket,
        iosBundleId: firebase.iosBundleId ?? 'com.churo.desafiomobile',
      );

  TenantConfig copyWith({
    int? tenantId,
    String? tenantName,
    String? logoUrl,
    String? primaryColor,
    String? secondaryColor,
    String? accentColor,
    FirebaseConfig? firebase,
    FeatureFlags? featureFlags,
    String? baseUrl,
    List<SportType>? supportedSports,
  }) {
    return TenantConfig(
      tenantId: tenantId ?? this.tenantId,
      tenantName: tenantName ?? this.tenantName,
      logoUrl: logoUrl ?? this.logoUrl,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      accentColor: accentColor ?? this.accentColor,
      firebase: firebase ?? this.firebase,
      featureFlags: featureFlags ?? this.featureFlags,
      baseUrl: baseUrl ?? this.baseUrl,
      supportedSports: supportedSports ?? this.supportedSports,
    );
  }

  // Factory to build fallback tenant config
  factory TenantConfig.defaultConfig() {
    return TenantConfig(
      tenantId: 1,
      tenantName: 'Sport Event Platform',
      logoUrl: 'assets/images/default_logo.png',
      primaryColor: '#0D47A1', // Deep Blue hex
      secondaryColor: '#1976D2', // Blue hex
      accentColor: '#FF5722', // Orange hex
      firebase: DefaultFirebaseConfig.ddln(),
      featureFlags: const FeatureFlags(
        enableRegistration: true,
        enableLiveTracking: true,
      ),
    );
  }

  factory TenantConfig.fromJson(Map<String, dynamic> json) {
    final branding = json['branding'] as Map<String, dynamic>? ?? {};
    final fb = json['firebase'] as Map<String, dynamic>? ?? {};
    final ff = json['featureFlags'] as Map<String, dynamic>? ?? {};

    return TenantConfig(
      tenantId: json['tenantId'] as int? ?? 1,
      tenantName: json['tenantName'] as String? ?? 'DDLN',
      logoUrl: json['logoUrl'] as String? ?? 'assets/images/ddln_logo.png',
      primaryColor: branding['primaryColor'] as String? ?? '#E58D00',
      secondaryColor: branding['secondaryColor'] as String? ?? '#212121',
      accentColor: branding['accentColor'] as String? ?? '#FFC107',
      firebase: FirebaseConfig.fromJson(fb),
      featureFlags: FeatureFlags.fromJson(ff),
      baseUrl: json['baseUrl'] as String?,
      supportedSports: (json['supportedSports'] as List?)
              ?.map((e) => SportType.values.firstWhere(
                    (s) => s.name == e.toString(),
                    orElse: () => SportType.running,
                  ))
              .toList() ??
          const [
            SportType.running,
            SportType.trailRunning,
            SportType.mtb,
            SportType.duathlon,
          ],
    );
  }

  Map<String, dynamic> toJson() => {
        'tenantId': tenantId,
        'tenantName': tenantName,
        'logoUrl': logoUrl,
        'primaryColor': primaryColor,
        'secondaryColor': secondaryColor,
        'accentColor': accentColor,
        'firebase': firebase.toJson(),
        'featureFlags': featureFlags.toJson(),
        'baseUrl': baseUrl,
        'supportedSports': supportedSports.map((e) => e.name).toList(),
      };
}

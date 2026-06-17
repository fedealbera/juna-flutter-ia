import 'package:flutter/material.dart';

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
  final String id;
  final String name;
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final Color backgroundColor;
  final String logoUrl;
  final List<SportType> supportedSports;
  final bool enableRegistration;
  final bool enableLiveTracking;

  const TenantConfig({
    required this.id,
    required this.name,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.backgroundColor,
    required this.logoUrl,
    required this.supportedSports,
    this.enableRegistration = true,
    this.enableLiveTracking = false,
  });

  // Factory to build fallback tenant config
  factory TenantConfig.defaultConfig() {
    return const TenantConfig(
      id: 'default',
      name: 'Sport Event Platform',
      primaryColor: Color(0xFF0D47A1), // Deep Blue
      secondaryColor: Color(0xFF1976D2), // Blue
      accentColor: Color(0xFFFF5722), // Orange
      backgroundColor: Color(0xFFF5F5F5), // Light grey
      logoUrl: 'assets/images/default_logo.png',
      supportedSports: [
        SportType.running,
        SportType.trailRunning,
        SportType.mtb,
        SportType.duathlon,
      ],
    );
  }
}

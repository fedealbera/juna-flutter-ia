import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TenantEntity extends Equatable {
  final String id;
  final String name;
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final Color backgroundColor;
  final String logoUrl;
  final List<String> supportedSports;
  final bool enableRegistration;
  final bool enableLiveTracking;

  const TenantEntity({
    required this.id,
    required this.name,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.backgroundColor,
    required this.logoUrl,
    required this.supportedSports,
    required this.enableRegistration,
    required this.enableLiveTracking,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        primaryColor,
        secondaryColor,
        accentColor,
        backgroundColor,
        logoUrl,
        supportedSports,
        enableRegistration,
        enableLiveTracking,
      ];
}

import 'package:equatable/equatable.dart';
import '../../../../core/firebase/tenant_firebase_config.dart';

class TenantEntity extends Equatable {
  final int tenantId;
  final String tenantName;
  final String logoUrl;

  final String primaryColor;
  final String secondaryColor;
  final String accentColor;

  final FirebaseConfig firebase;
  final FeatureFlags featureFlags;

  final String? baseUrl;
  final List<String> supportedSports;

  const TenantEntity({
    required this.tenantId,
    required this.tenantName,
    required this.logoUrl,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.firebase,
    required this.featureFlags,
    this.baseUrl,
    this.supportedSports = const ['running', 'trailRunning', 'mtb', 'duathlon'],
  });

  @override
  List<Object?> get props => [
        tenantId,
        tenantName,
        logoUrl,
        primaryColor,
        secondaryColor,
        accentColor,
        firebase,
        featureFlags,
        baseUrl,
        supportedSports,
      ];
}

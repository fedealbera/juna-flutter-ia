import 'package:equatable/equatable.dart';

class AboutInfo extends Equatable {
  final String appName;
  final String appVersion;
  final String buildNumber;
  final String platformDescription;

  const AboutInfo({
    required this.appName,
    required this.appVersion,
    required this.buildNumber,
    required this.platformDescription,
  });

  @override
  List<Object?> get props => [appName, appVersion, buildNumber, platformDescription];
}

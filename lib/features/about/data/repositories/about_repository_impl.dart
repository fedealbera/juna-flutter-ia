import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../domain/entities/about_info.dart';
import '../../domain/repositories/about_repository.dart';

@LazySingleton(as: AboutRepository)
class AboutRepositoryImpl implements AboutRepository {
  @override
  Future<AboutInfo> getAboutInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return AboutInfo(
        appName: packageInfo.appName.isNotEmpty ? packageInfo.appName : 'Juna Event Platform',
        appVersion: packageInfo.version.isNotEmpty ? packageInfo.version : '1.0.0',
        buildNumber: packageInfo.buildNumber.isNotEmpty ? packageInfo.buildNumber : '1',
        platformDescription: 'White Label Multi-Tenant platform for sports events.',
      );
    } catch (_) {
      return const AboutInfo(
        appName: 'Juna Event Platform',
        appVersion: '1.0.0',
        buildNumber: '1',
        platformDescription: 'White Label Multi-Tenant platform for sports events.',
      );
    }
  }
}

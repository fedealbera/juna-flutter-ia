import 'package:injectable/injectable.dart';
import '../../domain/entities/about_info.dart';
import '../../domain/repositories/about_repository.dart';

@LazySingleton(as: AboutRepository)
class AboutRepositoryImpl implements AboutRepository {
  @override
  Future<AboutInfo> getAboutInfo() async {
    // Returns default mock values as it's a placeholder feature
    return const AboutInfo(
      appName: 'Juna Event Platform',
      appVersion: '3.0.0',
      buildNumber: '1',
      platformDescription: 'White Label Multi-Tenant platform for sports events.',
    );
  }
}

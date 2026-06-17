import 'package:injectable/injectable.dart';
import '../../domain/entities/social_links.dart';
import '../../domain/repositories/social_repository.dart';

@LazySingleton(as: SocialRepository)
class SocialRepositoryImpl implements SocialRepository {
  @override
  Future<SocialLinks> getSocialLinks() async {
    // Returns default mock values as it's a placeholder feature
    return const SocialLinks(
      facebookUrl: 'https://facebook.com/junamobile',
      instagramUrl: 'https://instagram.com/junamobile',
      twitterUrl: 'https://twitter.com/junamobile',
    );
  }
}

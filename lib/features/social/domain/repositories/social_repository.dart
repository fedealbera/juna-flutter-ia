import '../entities/social_links.dart';

abstract class SocialRepository {
  Future<SocialLinks> getSocialLinks();
}

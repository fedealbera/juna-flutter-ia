import 'package:injectable/injectable.dart';
import '../entities/social_links.dart';
import '../repositories/social_repository.dart';

@lazySingleton
class GetSocialLinks {
  final SocialRepository _repository;

  GetSocialLinks(this._repository);

  Future<SocialLinks> call() {
    return _repository.getSocialLinks();
  }
}

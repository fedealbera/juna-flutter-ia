import 'package:equatable/equatable.dart';

class SocialLinks extends Equatable {
  final String facebookUrl;
  final String instagramUrl;
  final String twitterUrl;

  const SocialLinks({
    required this.facebookUrl,
    required this.instagramUrl,
    required this.twitterUrl,
  });

  @override
  List<Object?> get props => [facebookUrl, instagramUrl, twitterUrl];
}

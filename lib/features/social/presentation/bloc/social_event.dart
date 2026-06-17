import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_event.freezed.dart';

@freezed
class SocialEvent with _$SocialEvent {
  const factory SocialEvent.loadSocialLinks() = LoadSocialLinks;
}

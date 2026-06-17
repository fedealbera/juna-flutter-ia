import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/social_links.dart';

part 'social_state.freezed.dart';

@freezed
class SocialState with _$SocialState {
  const factory SocialState.initial() = SocialInitial;
  const factory SocialState.loading() = SocialLoading;
  const factory SocialState.loaded(SocialLinks links) = SocialLoaded;
  const factory SocialState.error(String message) = SocialError;
}

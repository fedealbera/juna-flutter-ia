import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/about_info.dart';

part 'about_state.freezed.dart';

@freezed
class AboutState with _$AboutState {
  const factory AboutState.initial() = AboutInitial;
  const factory AboutState.loading() = AboutLoading;
  const factory AboutState.loaded(AboutInfo info) = AboutLoaded;
  const factory AboutState.error(String message) = AboutError;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_event.freezed.dart';

@freezed
class AboutEvent with _$AboutEvent {
  const factory AboutEvent.loadAboutInfo() = LoadAboutInfo;
}

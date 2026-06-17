import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_response_dto.freezed.dart';
part 'track_response_dto.g.dart';

@freezed
class TrackResponseDto with _$TrackResponseDto {
  const factory TrackResponseDto({
    required Map<String, dynamic> rawJson,
  }) = _TrackResponseDto;

  factory TrackResponseDto.fromJson(Map<String, dynamic> json) =>
      TrackResponseDto(rawJson: json);
}

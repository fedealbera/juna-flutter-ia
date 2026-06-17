import '../dto/response/participant_file_response_dto.dart';
import '../dto/response/upload_file_response_dto.dart';
import '../../domain/entities/participant_file.dart';
import '../../domain/entities/upload_file_result.dart';

class DocumentsMapper {
  static ParticipantFile toFileEntity(ParticipantFileResponseDto dto) {
    return ParticipantFile(dto.rawJson);
  }

  static UploadFileResult toUploadEntity(UploadFileResponseDto dto) {
    return UploadFileResult(dto.rawJson);
  }
}

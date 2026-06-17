import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/participant_file.dart';
import '../../domain/entities/upload_file_result.dart';

part 'documents_state.freezed.dart';

@freezed
class DocumentsState with _$DocumentsState {
  const factory DocumentsState.initial() = DocumentsInitial;
  const factory DocumentsState.loading() = DocumentsLoading;
  const factory DocumentsState.loaded(List<ParticipantFile> files) = DocumentsLoaded;
  const factory DocumentsState.uploaded(UploadFileResult result) = DocumentsUploaded;
  const factory DocumentsState.error(String message) = DocumentsError;
}

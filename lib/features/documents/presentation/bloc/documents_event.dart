import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'documents_event.freezed.dart';

@freezed
class DocumentsEvent with _$DocumentsEvent {
  const factory DocumentsEvent.getDocuments({required String partiId}) = FetchDocuments;

  const factory DocumentsEvent.uploadDocument({
    required String tipo,
    required String partiId,
    required File file,
  }) = UploadDocumentEvent;
}

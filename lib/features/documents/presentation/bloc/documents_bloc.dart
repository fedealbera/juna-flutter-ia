import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_documents.dart';
import '../../domain/usecases/upload_document.dart';
import 'documents_event.dart';
import 'documents_state.dart';

@injectable
class DocumentsBloc extends Bloc<DocumentsEvent, DocumentsState> {
  final GetDocuments _getDocuments;
  final UploadDocument _uploadDocument;

  DocumentsBloc(this._getDocuments, this._uploadDocument)
      : super(const DocumentsState.initial()) {
    on<FetchDocuments>((event, emit) async {
      emit(const DocumentsState.loading());
      try {
        final files = await _getDocuments(partiId: event.partiId);
        emit(DocumentsState.loaded(files));
      } catch (e) {
        emit(DocumentsState.error(e.toString()));
      }
    });

    on<UploadDocumentEvent>((event, emit) async {
      emit(const DocumentsState.loading());
      try {
        final result = await _uploadDocument(
          tipo: event.tipo,
          partiId: event.partiId,
          file: event.file,
        );
        emit(DocumentsState.uploaded(result));
      } catch (e) {
        emit(DocumentsState.error(e.toString()));
      }
    });
  }
}

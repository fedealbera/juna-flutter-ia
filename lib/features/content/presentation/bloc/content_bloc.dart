import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_event_content.dart';
import 'content_event.dart';
import 'content_state.dart';

@injectable
class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final GetEventContent _getEventContent;

  ContentBloc(this._getEventContent) : super(const ContentState.initial()) {
    on<FetchContent>((event, emit) async {
      emit(const ContentState.loading());
      try {
        final content = await _getEventContent(
          eventId: event.eventId,
          idOrg: event.idOrg,
        );
        emit(ContentState.loaded(content));
      } catch (e) {
        emit(ContentState.error(e.toString()));
      }
    });
  }
}

import 'package:injectable/injectable.dart';
import '../entities/event_content.dart';
import '../repositories/content_repository.dart';

@lazySingleton
class GetEventContent {
  final ContentRepository _repository;

  GetEventContent(this._repository);

  Future<EventContent> call({required String eventId, required String idOrg}) {
    return _repository.getEventContent(eventId, idOrg);
  }
}

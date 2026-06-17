import '../../domain/entities/event_content.dart';

abstract class ContentRepository {
  Future<EventContent> getEventContent(String eventoId, String idOrg);
}

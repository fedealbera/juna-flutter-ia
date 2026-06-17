import 'package:injectable/injectable.dart';
import '../../../settings/data/datasource/settings_remote_datasource.dart';
import '../../domain/entities/event_content.dart';
import '../../domain/repositories/content_repository.dart';
import '../mappers/event_content_mapper.dart';

@LazySingleton(as: ContentRepository)
class ContentRepositoryImpl implements ContentRepository {
  final SettingsRemoteDataSource _settingsRemoteDataSource;

  ContentRepositoryImpl(this._settingsRemoteDataSource);

  @override
  Future<EventContent> getEventContent(String eventoId, String idOrg) async {
    final dto = await _settingsRemoteDataSource.getEventContent(eventoId, idOrg);
    return EventContentMapper.toEntity(dto);
  }
}

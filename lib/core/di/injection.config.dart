// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/about/data/repositories/about_repository_impl.dart'
    as _i857;
import '../../features/about/domain/repositories/about_repository.dart'
    as _i302;
import '../../features/about/domain/usecases/get_about_info.dart' as _i155;
import '../../features/about/presentation/bloc/about_bloc.dart' as _i161;
import '../../features/catalog/data/api/catalog_api_service.dart' as _i636;
import '../../features/catalog/data/datasource/catalog_remote_datasource.dart'
    as _i14;
import '../../features/categories/data/repositories/categories_repository_impl.dart'
    as _i245;
import '../../features/categories/domain/repositories/categories_repository.dart'
    as _i488;
import '../../features/categories/domain/usecases/get_categories.dart' as _i872;
import '../../features/categories/domain/usecases/get_sizes.dart' as _i554;
import '../../features/categories/presentation/bloc/categories_bloc.dart'
    as _i78;
import '../../features/content/data/repositories/content_repository_impl.dart'
    as _i463;
import '../../features/content/domain/repositories/content_repository.dart'
    as _i1027;
import '../../features/content/domain/usecases/get_event_content.dart' as _i954;
import '../../features/content/presentation/bloc/content_bloc.dart' as _i835;
import '../../features/documents/data/api/documents_api_service.dart' as _i792;
import '../../features/documents/data/datasource/documents_remote_datasource.dart'
    as _i361;
import '../../features/documents/data/repositories/documents_repository_impl.dart'
    as _i270;
import '../../features/documents/domain/repositories/documents_repository.dart'
    as _i345;
import '../../features/documents/domain/usecases/get_documents.dart' as _i237;
import '../../features/documents/domain/usecases/upload_document.dart' as _i982;
import '../../features/documents/presentation/bloc/documents_bloc.dart'
    as _i266;
import '../../features/emergency/data/api/emergency_api_service.dart' as _i467;
import '../../features/emergency/data/datasource/emergency_remote_datasource.dart'
    as _i706;
import '../../features/emergency/data/repositories/emergency_repository_impl.dart'
    as _i995;
import '../../features/emergency/domain/repositories/emergency_repository.dart'
    as _i978;
import '../../features/emergency/domain/usecases/send_sos_position.dart'
    as _i587;
import '../../features/emergency/presentation/bloc/emergency_bloc.dart'
    as _i921;
import '../../features/event/data/repositories/event_repository_impl.dart'
    as _i429;
import '../../features/event/domain/repositories/event_repository.dart'
    as _i660;
import '../../features/event/domain/usecases/get_circuits.dart' as _i474;
import '../../features/event/presentation/bloc/event_bloc.dart' as _i92;
import '../../features/geography/data/api/geography_api_service.dart' as _i304;
import '../../features/geography/data/datasource/geography_remote_datasource.dart'
    as _i635;
import '../../features/geography/data/repositories/geography_repository_impl.dart'
    as _i771;
import '../../features/geography/domain/repositories/geography_repository.dart'
    as _i480;
import '../../features/geography/domain/usecases/get_cities.dart' as _i953;
import '../../features/geography/domain/usecases/get_countries.dart' as _i12;
import '../../features/geography/domain/usecases/get_states.dart' as _i317;
import '../../features/geography/presentation/bloc/geography_bloc.dart'
    as _i137;
import '../../features/maps/data/repositories/maps_repository_impl.dart'
    as _i368;
import '../../features/maps/domain/repositories/maps_repository.dart' as _i769;
import '../../features/maps/domain/usecases/get_map_settings.dart' as _i508;
import '../../features/maps/presentation/bloc/maps_bloc.dart' as _i1;
import '../../features/notifications/data/repositories/notifications_repository_impl.dart'
    as _i201;
import '../../features/notifications/domain/repositories/notifications_repository.dart'
    as _i563;
import '../../features/notifications/domain/usecases/register_firebase_token.dart'
    as _i880;
import '../../features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i1041;
import '../../features/participant/data/api/participant_api_service.dart'
    as _i280;
import '../../features/participant/data/datasource/participant_remote_datasource.dart'
    as _i881;
import '../../features/participant/data/repositories/participant_repository_impl.dart'
    as _i585;
import '../../features/participant/domain/repositories/participant_repository.dart'
    as _i911;
import '../../features/participant/domain/usecases/authenticate_participant.dart'
    as _i641;
import '../../features/participant/domain/usecases/get_participant_detail.dart'
    as _i1007;
import '../../features/participant/domain/usecases/update_circuito.dart'
    as _i444;
import '../../features/participant/domain/usecases/update_contact.dart'
    as _i614;
import '../../features/participant/domain/usecases/update_emergency.dart'
    as _i296;
import '../../features/participant/domain/usecases/update_participant.dart'
    as _i470;
import '../../features/participant/presentation/bloc/participant_bloc.dart'
    as _i822;
import '../../features/registration/data/api/registration_api_service.dart'
    as _i360;
import '../../features/registration/data/datasource/registration_remote_datasource.dart'
    as _i382;
import '../../features/registration/data/repositories/registration_repository_impl.dart'
    as _i394;
import '../../features/registration/domain/repositories/registration_repository.dart'
    as _i980;
import '../../features/registration/domain/usecases/validate_discount.dart'
    as _i279;
import '../../features/registration/presentation/bloc/registration_bloc.dart'
    as _i616;
import '../../features/settings/data/api/events_api_service.dart' as _i998;
import '../../features/settings/data/api/settings_api_service.dart' as _i417;
import '../../features/settings/data/api/tracks_api_service.dart' as _i337;
import '../../features/settings/data/datasource/settings_remote_datasource.dart'
    as _i283;
import '../../features/settings/data/repositories/settings_repository_impl.dart'
    as _i955;
import '../../features/settings/domain/repositories/settings_repository.dart'
    as _i674;
import '../../features/settings/domain/usecases/get_event_settings.dart'
    as _i1066;
import '../../features/settings/presentation/bloc/settings_bloc.dart' as _i585;
import '../../features/social/data/repositories/social_repository_impl.dart'
    as _i5;
import '../../features/social/domain/repositories/social_repository.dart'
    as _i640;
import '../../features/social/domain/usecases/get_social_links.dart' as _i650;
import '../../features/social/presentation/bloc/social_bloc.dart' as _i17;
import '../../features/tenant/data/api/tenant_api_service.dart' as _i351;
import '../../features/tenant/data/repositories/tenant_repository_impl.dart'
    as _i981;
import '../../features/tenant/domain/repositories/tenant_repository.dart'
    as _i728;
import '../../features/tenant/domain/usecases/change_tenant.dart' as _i773;
import '../../features/tenant/domain/usecases/get_active_tenant.dart' as _i637;
import '../../features/tenant/presentation/bloc/tenant_bloc.dart' as _i447;
import '../../features/tracks/data/repositories/tracks_repository_impl.dart'
    as _i648;
import '../../features/tracks/domain/repositories/tracks_repository.dart'
    as _i103;
import '../../features/tracks/domain/usecases/get_tracks.dart' as _i547;
import '../../features/tracks/presentation/bloc/tracks_bloc.dart' as _i271;
import '../env/env_config.dart' as _i0;
import '../firebase/firebase_configuration_repository.dart' as _i322;
import '../firebase/firebase_manager.dart' as _i352;
import '../firebase/initialize_firebase_use_case.dart' as _i186;
import '../firebase/notification_service.dart' as _i650;
import '../network/dio_client.dart' as _i667;
import '../network/interceptors/api_key_interceptor.dart' as _i102;
import '../network/interceptors/error_interceptor.dart' as _i511;
import '../network/interceptors/logger_interceptor.dart' as _i238;
import '../network/interceptors/retry_interceptor.dart' as _i914;
import '../routing/app_router.dart' as _i282;
import '../storage/hive_service.dart' as _i459;
import '../storage/secure_storage_service.dart' as _i666;
import '../theme/branding_manager.dart' as _i9;
import '../theme/tenant_manager.dart' as _i476;
import '../theme/theme_manager.dart' as _i121;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final tenantApiModule = _$TenantApiModule();
    final eventsApiModule = _$EventsApiModule();
    final tracksApiModule = _$TracksApiModule();
    final settingsApiModule = _$SettingsApiModule();
    final registrationApiModule = _$RegistrationApiModule();
    final participantApiModule = _$ParticipantApiModule();
    final catalogApiModule = _$CatalogApiModule();
    final emergencyApiModule = _$EmergencyApiModule();
    final documentsApiModule = _$DocumentsApiModule();
    final geographyApiModule = _$GeographyApiModule();
    gh.lazySingleton<_i914.RetryInterceptor>(() => _i914.RetryInterceptor());
    gh.lazySingleton<_i511.ErrorInterceptor>(() => _i511.ErrorInterceptor());
    gh.lazySingleton<_i238.LoggerInterceptor>(() => _i238.LoggerInterceptor());
    gh.lazySingleton<_i459.HiveService>(() => _i459.HiveService());
    gh.lazySingleton<_i666.SecureStorageService>(
        () => _i666.SecureStorageService());
    gh.lazySingleton<_i650.NotificationService>(
        () => _i650.NotificationService());
    gh.lazySingleton<_i121.ThemeManager>(() => _i121.ThemeManager());
    gh.lazySingleton<_i476.TenantManager>(() => _i476.TenantManager());
    gh.lazySingleton<_i9.BrandingManager>(() => _i9.BrandingManager());
    gh.lazySingleton<_i282.AppRouter>(() => _i282.AppRouter());
    gh.lazySingleton<_i769.MapsRepository>(() => _i368.MapsRepositoryImpl());
    gh.lazySingleton<_i302.AboutRepository>(() => _i857.AboutRepositoryImpl());
    gh.lazySingleton<_i640.SocialRepository>(() => _i5.SocialRepositoryImpl());
    gh.lazySingleton<_i102.ApiKeyInterceptor>(() => _i102.ApiKeyInterceptor(
          gh<_i0.EnvConfig>(),
          gh<_i476.TenantManager>(),
        ));
    gh.lazySingleton<_i667.DioClient>(() => _i667.DioClient(
          gh<_i0.EnvConfig>(),
          gh<_i102.ApiKeyInterceptor>(),
          gh<_i238.LoggerInterceptor>(),
          gh<_i914.RetryInterceptor>(),
          gh<_i511.ErrorInterceptor>(),
          gh<_i476.TenantManager>(),
        ));
    gh.lazySingleton<_i728.TenantRepository>(
        () => _i981.TenantRepositoryImpl(gh<_i476.TenantManager>()));
    gh.lazySingleton<_i508.GetMapSettings>(
        () => _i508.GetMapSettings(gh<_i769.MapsRepository>()));
    gh.lazySingleton<_i773.ChangeTenant>(
        () => _i773.ChangeTenant(gh<_i728.TenantRepository>()));
    gh.lazySingleton<_i637.GetActiveTenant>(
        () => _i637.GetActiveTenant(gh<_i728.TenantRepository>()));
    gh.lazySingleton<_i155.GetAboutInfo>(
        () => _i155.GetAboutInfo(gh<_i302.AboutRepository>()));
    gh.factory<_i1.MapsBloc>(() => _i1.MapsBloc(gh<_i508.GetMapSettings>()));
    gh.lazySingleton<_i650.GetSocialLinks>(
        () => _i650.GetSocialLinks(gh<_i640.SocialRepository>()));
    gh.factory<_i17.SocialBloc>(
        () => _i17.SocialBloc(gh<_i650.GetSocialLinks>()));
    gh.lazySingleton<_i351.TenantApiService>(
        () => tenantApiModule.provideTenantApiService(gh<_i667.DioClient>()));
    gh.lazySingleton<_i998.EventsApiService>(
        () => eventsApiModule.provideEventsApiService(gh<_i667.DioClient>()));
    gh.lazySingleton<_i337.TracksApiService>(
        () => tracksApiModule.provideTracksApiService(gh<_i667.DioClient>()));
    gh.lazySingleton<_i417.SettingsApiService>(() =>
        settingsApiModule.provideSettingsApiService(gh<_i667.DioClient>()));
    gh.lazySingleton<_i360.RegistrationApiService>(() => registrationApiModule
        .provideRegistrationApiService(gh<_i667.DioClient>()));
    gh.lazySingleton<_i280.ParticipantApiService>(() => participantApiModule
        .provideParticipantApiService(gh<_i667.DioClient>()));
    gh.lazySingleton<_i636.CatalogApiService>(
        () => catalogApiModule.provideCatalogApiService(gh<_i667.DioClient>()));
    gh.lazySingleton<_i467.EmergencyApiService>(() =>
        emergencyApiModule.provideEmergencyApiService(gh<_i667.DioClient>()));
    gh.lazySingleton<_i792.DocumentsApiService>(() =>
        documentsApiModule.provideDocumentsApiService(gh<_i667.DioClient>()));
    gh.lazySingleton<_i304.GeographyApiService>(() =>
        geographyApiModule.provideGeographyApiService(gh<_i667.DioClient>()));
    gh.lazySingleton<_i881.ParticipantRemoteDataSource>(() =>
        _i881.ParticipantRemoteDataSourceImpl(
            gh<_i280.ParticipantApiService>()));
    gh.factory<_i161.AboutBloc>(
        () => _i161.AboutBloc(gh<_i155.GetAboutInfo>()));
    gh.factory<_i447.TenantBloc>(() => _i447.TenantBloc(
          gh<_i637.GetActiveTenant>(),
          gh<_i773.ChangeTenant>(),
        ));
    gh.lazySingleton<_i911.ParticipantRepository>(() =>
        _i585.ParticipantRepositoryImpl(
            gh<_i881.ParticipantRemoteDataSource>()));
    gh.lazySingleton<_i322.FirebaseConfigurationRepository>(() =>
        _i322.FirebaseConfigurationRepositoryImpl(
            gh<_i351.TenantApiService>()));
    gh.lazySingleton<_i14.CatalogRemoteDataSource>(
        () => _i14.CatalogRemoteDataSourceImpl(gh<_i636.CatalogApiService>()));
    gh.lazySingleton<_i361.DocumentsRemoteDataSource>(() =>
        _i361.DocumentsRemoteDataSourceImpl(gh<_i792.DocumentsApiService>()));
    gh.lazySingleton<_i345.DocumentsRepository>(() =>
        _i270.DocumentsRepositoryImpl(gh<_i361.DocumentsRemoteDataSource>()));
    gh.lazySingleton<_i488.CategoriesRepository>(() =>
        _i245.CategoriesRepositoryImpl(gh<_i14.CatalogRemoteDataSource>()));
    gh.lazySingleton<_i660.EventRepository>(
        () => _i429.EventRepositoryImpl(gh<_i14.CatalogRemoteDataSource>()));
    gh.lazySingleton<_i635.GeographyRemoteDataSource>(() =>
        _i635.GeographyRemoteDataSourceImpl(gh<_i304.GeographyApiService>()));
    gh.lazySingleton<_i283.SettingsRemoteDataSource>(
        () => _i283.SettingsRemoteDataSourceImpl(
              gh<_i998.EventsApiService>(),
              gh<_i337.TracksApiService>(),
              gh<_i417.SettingsApiService>(),
            ));
    gh.lazySingleton<_i382.RegistrationRemoteDataSource>(() =>
        _i382.RegistrationRemoteDataSourceImpl(
            gh<_i360.RegistrationApiService>()));
    gh.lazySingleton<_i1027.ContentRepository>(() =>
        _i463.ContentRepositoryImpl(gh<_i283.SettingsRemoteDataSource>()));
    gh.lazySingleton<_i103.TracksRepository>(
        () => _i648.TracksRepositoryImpl(gh<_i283.SettingsRemoteDataSource>()));
    gh.lazySingleton<_i296.UpdateEmergency>(
        () => _i296.UpdateEmergency(gh<_i911.ParticipantRepository>()));
    gh.lazySingleton<_i614.UpdateContact>(
        () => _i614.UpdateContact(gh<_i911.ParticipantRepository>()));
    gh.lazySingleton<_i444.UpdateCircuito>(
        () => _i444.UpdateCircuito(gh<_i911.ParticipantRepository>()));
    gh.lazySingleton<_i641.AuthenticateParticipant>(
        () => _i641.AuthenticateParticipant(gh<_i911.ParticipantRepository>()));
    gh.lazySingleton<_i1007.GetParticipantDetail>(
        () => _i1007.GetParticipantDetail(gh<_i911.ParticipantRepository>()));
    gh.lazySingleton<_i470.UpdateParticipant>(
        () => _i470.UpdateParticipant(gh<_i911.ParticipantRepository>()));
    gh.factory<_i822.ParticipantBloc>(() => _i822.ParticipantBloc(
          gh<_i641.AuthenticateParticipant>(),
          gh<_i1007.GetParticipantDetail>(),
          gh<_i296.UpdateEmergency>(),
          gh<_i614.UpdateContact>(),
          gh<_i444.UpdateCircuito>(),
          gh<_i470.UpdateParticipant>(),
        ));
    gh.lazySingleton<_i563.NotificationsRepository>(() =>
        _i201.NotificationsRepositoryImpl(
            gh<_i881.ParticipantRemoteDataSource>()));
    gh.lazySingleton<_i706.EmergencyRemoteDataSource>(() =>
        _i706.EmergencyRemoteDataSourceImpl(gh<_i467.EmergencyApiService>()));
    gh.lazySingleton<_i474.GetCircuits>(
        () => _i474.GetCircuits(gh<_i660.EventRepository>()));
    gh.lazySingleton<_i237.GetDocuments>(
        () => _i237.GetDocuments(gh<_i345.DocumentsRepository>()));
    gh.lazySingleton<_i982.UploadDocument>(
        () => _i982.UploadDocument(gh<_i345.DocumentsRepository>()));
    gh.lazySingleton<_i674.SettingsRepository>(
        () => _i955.SettingsRepositoryImpl(
              gh<_i283.SettingsRemoteDataSource>(),
              gh<_i476.TenantManager>(),
            ));
    gh.lazySingleton<_i980.RegistrationRepository>(() =>
        _i394.RegistrationRepositoryImpl(
            gh<_i382.RegistrationRemoteDataSource>()));
    gh.lazySingleton<_i480.GeographyRepository>(() =>
        _i771.GeographyRepositoryImpl(gh<_i635.GeographyRemoteDataSource>()));
    gh.lazySingleton<_i872.GetCategories>(
        () => _i872.GetCategories(gh<_i488.CategoriesRepository>()));
    gh.lazySingleton<_i554.GetSizes>(
        () => _i554.GetSizes(gh<_i488.CategoriesRepository>()));
    gh.factory<_i78.CategoriesBloc>(() => _i78.CategoriesBloc(
          gh<_i872.GetCategories>(),
          gh<_i554.GetSizes>(),
        ));
    gh.lazySingleton<_i954.GetEventContent>(
        () => _i954.GetEventContent(gh<_i1027.ContentRepository>()));
    gh.lazySingleton<_i978.EmergencyRepository>(() =>
        _i995.EmergencyRepositoryImpl(gh<_i706.EmergencyRemoteDataSource>()));
    gh.lazySingleton<_i1066.GetEventSettings>(
        () => _i1066.GetEventSettings(gh<_i674.SettingsRepository>()));
    gh.lazySingleton<_i547.GetTracks>(
        () => _i547.GetTracks(gh<_i103.TracksRepository>()));
    gh.factory<_i92.EventBloc>(() => _i92.EventBloc(gh<_i474.GetCircuits>()));
    gh.factory<_i585.SettingsBloc>(
        () => _i585.SettingsBloc(gh<_i1066.GetEventSettings>()));
    gh.factory<_i835.ContentBloc>(
        () => _i835.ContentBloc(gh<_i954.GetEventContent>()));
    gh.factory<_i271.TracksBloc>(() => _i271.TracksBloc(gh<_i547.GetTracks>()));
    gh.factory<_i266.DocumentsBloc>(() => _i266.DocumentsBloc(
          gh<_i237.GetDocuments>(),
          gh<_i982.UploadDocument>(),
        ));
    gh.lazySingleton<_i279.ValidateDiscount>(
        () => _i279.ValidateDiscount(gh<_i980.RegistrationRepository>()));
    gh.lazySingleton<_i880.RegisterFirebaseToken>(
        () => _i880.RegisterFirebaseToken(gh<_i563.NotificationsRepository>()));
    gh.lazySingleton<_i352.FirebaseManager>(() => _i352.FirebaseManager(
          gh<_i0.EnvConfig>(),
          gh<_i563.NotificationsRepository>(),
        ));
    gh.lazySingleton<_i587.SendSOSPosition>(
        () => _i587.SendSOSPosition(gh<_i978.EmergencyRepository>()));
    gh.lazySingleton<_i317.GetStates>(
        () => _i317.GetStates(gh<_i480.GeographyRepository>()));
    gh.lazySingleton<_i12.GetCountries>(
        () => _i12.GetCountries(gh<_i480.GeographyRepository>()));
    gh.lazySingleton<_i953.GetCities>(
        () => _i953.GetCities(gh<_i480.GeographyRepository>()));
    gh.factory<_i1041.NotificationsBloc>(
        () => _i1041.NotificationsBloc(gh<_i880.RegisterFirebaseToken>()));
    gh.lazySingleton<_i186.InitializeFirebaseUseCase>(
        () => _i186.InitializeFirebaseUseCase(gh<_i352.FirebaseManager>()));
    gh.factory<_i921.EmergencyBloc>(
        () => _i921.EmergencyBloc(gh<_i587.SendSOSPosition>()));
    gh.factory<_i137.GeographyBloc>(() => _i137.GeographyBloc(
          gh<_i12.GetCountries>(),
          gh<_i317.GetStates>(),
          gh<_i953.GetCities>(),
        ));
    gh.factory<_i616.RegistrationBloc>(
        () => _i616.RegistrationBloc(gh<_i279.ValidateDiscount>()));
    return this;
  }
}

class _$TenantApiModule extends _i351.TenantApiModule {}

class _$EventsApiModule extends _i998.EventsApiModule {}

class _$TracksApiModule extends _i337.TracksApiModule {}

class _$SettingsApiModule extends _i417.SettingsApiModule {}

class _$RegistrationApiModule extends _i360.RegistrationApiModule {}

class _$ParticipantApiModule extends _i280.ParticipantApiModule {}

class _$CatalogApiModule extends _i636.CatalogApiModule {}

class _$EmergencyApiModule extends _i467.EmergencyApiModule {}

class _$DocumentsApiModule extends _i792.DocumentsApiModule {}

class _$GeographyApiModule extends _i304.GeographyApiModule {}

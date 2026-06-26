import 'package:injectable/injectable.dart';
import '../../domain/entities/discount_result.dart';
import '../../domain/repositories/registration_repository.dart';
import '../datasource/registration_remote_datasource.dart';
import '../dto/request/validate_discount_request_dto.dart';
import '../mappers/registration_mapper.dart';

@LazySingleton(as: RegistrationRepository)
class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationRemoteDataSource _remoteDataSource;

  RegistrationRepositoryImpl(this._remoteDataSource);

  @override
  Future<DiscountResult> validateDiscount({
    required String insId,
    required String code,
  }) async {
    final response = await _remoteDataSource.validateDiscount(
      insId,
      ValidateDiscountRequestDto(codigo: code),
    );
    return RegistrationMapper.toEntity(response);
  }
}

import 'package:injectable/injectable.dart';
import '../entities/province.dart';
import '../repositories/geography_repository.dart';

@lazySingleton
class GetStates {
  final GeographyRepository _repository;

  GetStates(this._repository);

  Future<List<Province>> call({required String countryId}) {
    return _repository.getProvincias(countryId);
  }
}

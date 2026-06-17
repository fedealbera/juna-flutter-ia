import '../dto/response/ciudad_response_dto.dart';
import '../dto/response/pais_response_dto.dart';
import '../dto/response/provincia_response_dto.dart';
import '../../domain/entities/city.dart';
import '../../domain/entities/country.dart';
import '../../domain/entities/province.dart';

class GeographyMappers {
  static Country toCountryEntity(PaisResponseDto dto) {
    return Country(dto.rawJson);
  }

  static Province toProvinceEntity(ProvinciaResponseDto dto) {
    return Province(dto.rawJson);
  }

  static City toCityEntity(CiudadResponseDto dto) {
    return City(dto.rawJson);
  }
}

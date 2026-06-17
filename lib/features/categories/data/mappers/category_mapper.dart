import '../../../catalog/data/dto/response/categoria_response_dto.dart';
import '../../domain/entities/category.dart';

class CategoryMapper {
  static Category toEntity(CategoriaResponseDto dto) {
    return Category(dto.rawJson);
  }
}

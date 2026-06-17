import '../../domain/entities/category.dart';
import '../../domain/entities/size_entity.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getCategories(String circuitoId, String dni);
  Future<List<SizeEntity>> getSizes();
}

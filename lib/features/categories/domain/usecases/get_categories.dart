import 'package:injectable/injectable.dart';
import '../entities/category.dart';
import '../repositories/categories_repository.dart';

@lazySingleton
class GetCategories {
  final CategoriesRepository _repository;

  GetCategories(this._repository);

  Future<List<Category>> call({required String circuitoId, required String dni}) {
    return _repository.getCategories(circuitoId, dni);
  }
}

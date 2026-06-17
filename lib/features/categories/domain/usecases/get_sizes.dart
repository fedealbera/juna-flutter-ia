import 'package:injectable/injectable.dart';
import '../entities/size_entity.dart';
import '../repositories/categories_repository.dart';

@lazySingleton
class GetSizes {
  final CategoriesRepository _repository;

  GetSizes(this._repository);

  Future<List<SizeEntity>> call() {
    return _repository.getSizes();
  }
}

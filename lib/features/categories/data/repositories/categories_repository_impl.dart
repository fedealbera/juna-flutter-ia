import 'package:injectable/injectable.dart';
import '../../../catalog/data/datasource/catalog_remote_datasource.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/size_entity.dart';
import '../../domain/repositories/categories_repository.dart';
import '../mappers/category_mapper.dart';
import '../mappers/size_mapper.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CatalogRemoteDataSource _catalogRemoteDataSource;

  CategoriesRepositoryImpl(this._catalogRemoteDataSource);

  @override
  Future<List<Category>> getCategories(String circuitoId, String dni) async {
    final dtos = await _catalogRemoteDataSource.getCategorias(circuitoId, dni);
    return dtos.map(CategoryMapper.toEntity).toList();
  }

  @override
  Future<List<SizeEntity>> getSizes() async {
    final dtos = await _catalogRemoteDataSource.getTalles();
    return dtos.map(SizeMapper.toEntity).toList();
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/size_entity.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = CategoriesInitial;
  const factory CategoriesState.loading() = CategoriesLoading;
  const factory CategoriesState.categoriesLoaded(List<Category> categories) = CategoriesLoaded;
  const factory CategoriesState.sizesLoaded(List<SizeEntity> sizes) = SizesLoaded;
  const factory CategoriesState.error(String message) = CategoriesError;
}

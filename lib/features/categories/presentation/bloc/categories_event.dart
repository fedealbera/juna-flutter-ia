import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_event.freezed.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  const factory CategoriesEvent.getCategories({
    required String circuitoId,
    required String dni,
  }) = FetchCategories;
  const factory CategoriesEvent.getSizes() = FetchSizes;
}

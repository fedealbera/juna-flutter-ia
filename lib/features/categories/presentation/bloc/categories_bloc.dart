import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_sizes.dart';
import 'categories_event.dart';
import 'categories_state.dart';

@injectable
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategories _getCategories;
  final GetSizes _getSizes;

  CategoriesBloc(
    this._getCategories,
    this._getSizes,
  ) : super(const CategoriesState.initial()) {
    on<FetchCategories>((event, emit) async {
      emit(const CategoriesState.loading());
      try {
        final categories = await _getCategories(
          circuitoId: event.circuitoId,
          dni: event.dni,
        );
        emit(CategoriesState.categoriesLoaded(categories));
      } catch (e) {
        emit(CategoriesState.error(e.toString()));
      }
    });

    on<FetchSizes>((event, emit) async {
      emit(const CategoriesState.loading());
      try {
        final sizes = await _getSizes();
        emit(CategoriesState.sizesLoaded(sizes));
      } catch (e) {
        emit(CategoriesState.error(e.toString()));
      }
    });
  }
}

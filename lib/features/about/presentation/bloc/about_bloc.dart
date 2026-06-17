import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_about_info.dart';
import 'about_event.dart';
import 'about_state.dart';

@injectable
class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final GetAboutInfo _getAboutInfo;

  AboutBloc(this._getAboutInfo) : super(const AboutState.initial()) {
    on<LoadAboutInfo>((event, emit) async {
      emit(const AboutState.loading());
      try {
        final info = await _getAboutInfo();
        emit(AboutState.loaded(info));
      } catch (e) {
        emit(AboutState.error(e.toString()));
      }
    });
  }
}

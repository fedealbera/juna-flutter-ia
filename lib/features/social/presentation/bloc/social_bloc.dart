import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_social_links.dart';
import 'social_event.dart';
import 'social_state.dart';

@injectable
class SocialBloc extends Bloc<SocialEvent, SocialState> {
  final GetSocialLinks _getSocialLinks;

  SocialBloc(this._getSocialLinks) : super(const SocialState.initial()) {
    on<LoadSocialLinks>((event, emit) async {
      emit(const SocialState.loading());
      try {
        final links = await _getSocialLinks();
        emit(SocialState.loaded(links));
      } catch (e) {
        emit(SocialState.error(e.toString()));
      }
    });
  }
}

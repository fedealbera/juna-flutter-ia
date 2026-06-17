import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/register_firebase_token.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

@injectable
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final RegisterFirebaseToken _registerFirebaseToken;

  NotificationsBloc(this._registerFirebaseToken)
      : super(const NotificationsState.initial()) {
    on<RegisterToken>((event, emit) async {
      emit(const NotificationsState.loading());
      try {
        final result = await _registerFirebaseToken(
          documento: event.documento,
          idEvento: event.idEvento,
          idOrg: event.idOrg,
          token: event.token,
        );
        emit(NotificationsState.registered(result));
      } catch (e) {
        emit(NotificationsState.error(e.toString()));
      }
    });
  }
}

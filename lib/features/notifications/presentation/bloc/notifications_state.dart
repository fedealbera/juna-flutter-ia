import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/push_token_result.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = NotificationsInitial;
  const factory NotificationsState.loading() = NotificationsLoading;
  const factory NotificationsState.registered(PushTokenResult result) = NotificationsRegistered;
  const factory NotificationsState.error(String message) = NotificationsError;
}

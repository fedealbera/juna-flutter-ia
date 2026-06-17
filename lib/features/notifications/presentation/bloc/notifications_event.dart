import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_event.freezed.dart';

@freezed
class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.registerToken({
    required String documento,
    required String idEvento,
    required String idOrg,
    required String token,
  }) = RegisterToken;
}

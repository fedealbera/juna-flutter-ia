import 'package:equatable/equatable.dart';

class PushTokenResult extends Equatable {
  final Map<String, dynamic> rawJson;

  const PushTokenResult(this.rawJson);

  @override
  List<Object?> get props => [rawJson];
}

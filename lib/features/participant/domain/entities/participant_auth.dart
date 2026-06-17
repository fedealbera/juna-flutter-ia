import 'package:equatable/equatable.dart';

class ParticipantAuth extends Equatable {
  final Map<String, dynamic> rawJson;

  const ParticipantAuth(this.rawJson);

  @override
  List<Object?> get props => [rawJson];
}

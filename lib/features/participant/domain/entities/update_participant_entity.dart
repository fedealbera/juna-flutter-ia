import 'package:equatable/equatable.dart';

class UpdateParticipantEntity extends Equatable {
  final Map<String, dynamic> rawJson;

  const UpdateParticipantEntity(this.rawJson);

  @override
  List<Object?> get props => [rawJson];
}

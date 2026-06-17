import 'package:equatable/equatable.dart';

class ParticipantDetail extends Equatable {
  final Map<String, dynamic> rawJson;

  const ParticipantDetail(this.rawJson);

  String get id => rawJson['id']?.toString() ?? '';
  String get name => rawJson['nombre']?.toString() ?? '';
  String get dni => rawJson['documento']?.toString() ?? '';

  @override
  List<Object?> get props => [rawJson];
}

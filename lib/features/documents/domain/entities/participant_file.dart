import 'package:equatable/equatable.dart';

class ParticipantFile extends Equatable {
  final Map<String, dynamic> rawJson;

  const ParticipantFile(this.rawJson);

  String get id => rawJson['id']?.toString() ?? '';
  String get name => rawJson['nombre']?.toString() ?? '';
  String get url => rawJson['url']?.toString() ?? '';

  @override
  List<Object?> get props => [rawJson];
}

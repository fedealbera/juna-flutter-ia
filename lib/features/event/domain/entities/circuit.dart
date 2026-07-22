import 'package:equatable/equatable.dart';

class Circuit extends Equatable {
  final Map<String, dynamic> rawJson;

  const Circuit(this.rawJson);

  String get id => rawJson['id']?.toString() ?? rawJson['circuitoId']?.toString() ?? '';
  String get name => rawJson['nombre']?.toString() ?? rawJson['circuitoNombre']?.toString() ?? '';

  @override
  List<Object?> get props => [rawJson];
}

import 'package:equatable/equatable.dart';

class ParticipantDetail extends Equatable {
  final Map<String, dynamic> rawJson;

  const ParticipantDetail(this.rawJson);

  Map<String, dynamic> get _data => rawJson['corredor'] is Map 
      ? (rawJson['corredor'] as Map).cast<String, dynamic>() 
      : rawJson;

  String get id => _data['id']?.toString() ?? '';
  String get name => _data['nombre']?.toString() ?? '';
  String get dni => _data['dni']?.toString() ?? _data['documento']?.toString() ?? '';
  String get nroPlaca => _data['nroPlaca']?.toString() ?? '';
  String get lastName => _data['apellido']?.toString() ?? '';
  String get fullName => '$name $lastName'.trim();
  String get circuito => _data['idCircuitoNombre']?.toString() ?? '';
  String get categoria => _data['categoriaNombre']?.toString() ?? '';
  String get agrupamiento => _data['agrupamiento']?.toString() ?? '';
  String get largada => _data['largada']?.toString() ?? '';
  List<String> get articulos => (_data['articulos'] as List?)?.map((e) => e.toString()).toList() ?? [];

  @override
  List<Object?> get props => [rawJson];
}

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
  String get linkPago => _data['linkPago']?.toString() ?? '';
  String get lastName => _data['apellido']?.toString() ?? '';
  String get fullName => '$name $lastName'.trim();
  String get circuito => _data['idCircuitoNombre']?.toString() ?? '';
  String get categoria => _data['categoriaNombre']?.toString() ?? '';
  String get agrupamiento => _data['agrupamiento']?.toString() ?? '';
  String get largada => _data['largada']?.toString() ?? '';
  List<String> get articulos => (_data['articulos'] as List?)?.map((e) => e.toString()).toList() ?? [];

  String get contCelular => _data['contCelular']?.toString() ?? '';
  String get contEmail => _data['contEmail']?.toString() ?? '';
  String get contInstagram => _data['contInstagram']?.toString() ?? '';
  String get contNombre => _data['contNombre']?.toString() ?? '';
  String get contTel => _data['contTel']?.toString() ?? '';
  String get domCiudad => _data['domCiudad']?.toString() ?? '';
  String get domCiudadNombre => _data['domCiudadNombre']?.toString() ?? '';
  String get domProvincia => _data['domProvincia']?.toString() ?? '';
  String get domPais => _data['domPais']?.toString() ?? '';

  @override
  List<Object?> get props => [rawJson];
}

import '../../domain/entities/runner_item.dart';

class RunnerDto {
  final String id;
  final String nombre;
  final String apellido;
  final String dorsal;
  final String circuito;
  final String? idCircuito;
  final String categoria;
  final String? idCategoria;
  final String? ciudad;
  final String? provincia;
  final String? grupoEntrenamiento;

  const RunnerDto({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.dorsal,
    required this.circuito,
    this.idCircuito,
    required this.categoria,
    this.idCategoria,
    this.ciudad,
    this.provincia,
    this.grupoEntrenamiento,
  });

  factory RunnerDto.fromJson(Map<String, dynamic> json) {
    return RunnerDto(
      id: json['id']?.toString() ?? json['parti_id']?.toString() ?? '',
      nombre: json['nombre']?.toString() ?? json['name']?.toString() ?? '',
      apellido: json['apellido']?.toString() ?? json['lastName']?.toString() ?? '',
      dorsal: json['dorsal']?.toString() ??
          json['nroPlaca']?.toString() ??
          json['placa']?.toString() ??
          json['bib']?.toString() ??
          '',
      circuito: json['circuito']?.toString() ??
          json['idCircuitoNombre']?.toString() ??
          json['distancia']?.toString() ??
          '',
      idCircuito: json['idCircuito']?.toString() ?? json['id_circuito']?.toString(),
      categoria: json['categoria']?.toString() ?? json['categoriaNombre']?.toString() ?? '',
      idCategoria: json['idCategoria']?.toString() ?? json['id_categoria']?.toString(),
      ciudad: json['ciudad']?.toString() ?? json['domCiudadNombre']?.toString(),
      provincia: json['provincia']?.toString() ?? json['domProvincia']?.toString(),
      grupoEntrenamiento: json['grupoEntrenamiento']?.toString() ??
          json['grupo_entrenamiento']?.toString(),
    );
  }

  RunnerItem toEntity() {
    return RunnerItem(
      id: id,
      nombre: nombre,
      apellido: apellido,
      dorsal: dorsal,
      circuito: circuito,
      idCircuito: idCircuito,
      categoria: categoria,
      idCategoria: idCategoria,
      ciudad: ciudad,
      provincia: provincia,
      grupoEntrenamiento: grupoEntrenamiento,
    );
  }
}

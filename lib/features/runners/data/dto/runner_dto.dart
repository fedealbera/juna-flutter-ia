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
  final String? sexo;

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
    this.sexo,
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
      sexo: json['sexo']?.toString(),
    );
  }

  static List<RunnerDto> fromAcreditadosResponse(Map<String, dynamic> json) {
    final List<RunnerDto> runners = [];
    final dynamic participantes = json['participantes'];
    if (participantes is! Map) return runners;

    participantes.forEach((sexoKey, circuitosMap) {
      final sexo = sexoKey?.toString() ?? '';
      if (circuitosMap is Map) {
        circuitosMap.forEach((circuitoKey, categoriasMap) {
          final circuito = circuitoKey?.toString() ?? '';
          if (categoriasMap is Map) {
            categoriasMap.forEach((categoriaKey, itemsList) {
              final categoria = categoriaKey?.toString() ?? '';
              if (itemsList is List) {
                for (int i = 0; i < itemsList.length; i++) {
                  final item = itemsList[i];
                  if (item is Map) {
                    final map = item.cast<String, dynamic>();
                    runners.add(RunnerDto(
                      id: map['id']?.toString() ??
                          '${circuito}_${categoria}_${map['nombre']}_${map['apellido']}_$i',
                      nombre: map['nombre']?.toString() ?? '',
                      apellido: map['apellido']?.toString() ?? '',
                      dorsal: map['dorsal']?.toString() ??
                          map['nroPlaca']?.toString() ??
                          map['placa']?.toString() ??
                          map['bib']?.toString() ??
                          '',
                      circuito: circuito,
                      categoria: categoria,
                      ciudad: map['ciudad']?.toString(),
                      provincia: map['provincia']?.toString(),
                      grupoEntrenamiento: map['grupoEntrenamiento']?.toString() ??
                          map['grupo_entrenamiento']?.toString(),
                      sexo: sexo,
                    ));
                  }
                }
              }
            });
          }
        });
      }
    });

    return runners;
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
      sexo: sexo,
    );
  }
}

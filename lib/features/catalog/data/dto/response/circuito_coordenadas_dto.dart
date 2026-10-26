import '../../../../event/domain/entities/circuito_coordenadas.dart';

class CoordenadaPuntoDto {
  final int id;
  final double lat;
  final double lng;
  final double ele;
  final double dist;

  const CoordenadaPuntoDto({
    required this.id,
    required this.lat,
    required this.lng,
    required this.ele,
    required this.dist,
  });

  factory CoordenadaPuntoDto.fromJson(Map<String, dynamic> json) {
    return CoordenadaPuntoDto(
      id: (json['id'] as num?)?.toInt() ??
          (int.tryParse(json['id']?.toString() ?? '') ?? 0),
      lat: (json['lat'] as num?)?.toDouble() ??
          (double.tryParse(json['lat']?.toString() ?? '') ?? 0.0),
      lng: (json['lng'] as num?)?.toDouble() ??
          (double.tryParse(json['lng']?.toString() ?? '') ?? 0.0),
      ele: (json['ele'] as num?)?.toDouble() ??
          (double.tryParse(json['ele']?.toString() ?? '') ?? 0.0),
      dist: (json['dist'] as num?)?.toDouble() ??
          (double.tryParse(json['dist']?.toString() ?? '') ?? 0.0),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'lat': lat,
        'lng': lng,
        'ele': ele,
        'dist': dist,
      };

  CoordenadaPunto toEntity() => CoordenadaPunto(
        id: id,
        lat: lat,
        lng: lng,
        ele: ele,
        dist: dist,
      );
}

class CircuitoCoordenadasDto {
  final int circuitoId;
  final String circuitoNombre;
  final String circuitoNombreCorto;
  final int totalPuntos;
  final List<CoordenadaPuntoDto> coordenadas;
  final dynamic error;

  const CircuitoCoordenadasDto({
    required this.circuitoId,
    required this.circuitoNombre,
    required this.circuitoNombreCorto,
    required this.totalPuntos,
    required this.coordenadas,
    this.error,
  });

  factory CircuitoCoordenadasDto.fromJson(Map<String, dynamic> json) {
    final rawCoordenadas = json['coordenadas'] as List<dynamic>? ?? [];
    return CircuitoCoordenadasDto(
      circuitoId: (json['circuito_id'] as num?)?.toInt() ??
          (int.tryParse(json['circuito_id']?.toString() ?? '') ?? 0),
      circuitoNombre: json['circuito_nombre']?.toString() ?? '',
      circuitoNombreCorto: json['circuito_nombre_corto']?.toString() ?? '',
      totalPuntos: (json['total_puntos'] as num?)?.toInt() ??
          (int.tryParse(json['total_puntos']?.toString() ?? '') ?? rawCoordenadas.length),
      coordenadas: rawCoordenadas
          .whereType<Map<String, dynamic>>()
          .map(CoordenadaPuntoDto.fromJson)
          .toList(),
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() => {
        'circuito_id': circuitoId,
        'circuito_nombre': circuitoNombre,
        'circuito_nombre_corto': circuitoNombreCorto,
        'total_puntos': totalPuntos,
        'coordenadas': coordenadas.map((c) => c.toJson()).toList(),
        'error': error,
      };

  CircuitoCoordenadas toEntity() => CircuitoCoordenadas(
        circuitoId: circuitoId,
        circuitoNombre: circuitoNombre,
        circuitoNombreCorto: circuitoNombreCorto,
        totalPuntos: totalPuntos,
        coordenadas: coordenadas.map((c) => c.toEntity()).toList(),
      );
}

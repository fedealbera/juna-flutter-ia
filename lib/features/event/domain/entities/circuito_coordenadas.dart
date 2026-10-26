import 'package:equatable/equatable.dart';

class CoordenadaPunto extends Equatable {
  final int id;
  final double lat;
  final double lng;
  final double ele;
  final double dist;

  const CoordenadaPunto({
    required this.id,
    required this.lat,
    required this.lng,
    required this.ele,
    required this.dist,
  });

  @override
  List<Object?> get props => [id, lat, lng, ele, dist];
}

class CircuitoCoordenadas extends Equatable {
  final int circuitoId;
  final String circuitoNombre;
  final String circuitoNombreCorto;
  final int totalPuntos;
  final List<CoordenadaPunto> coordenadas;

  const CircuitoCoordenadas({
    required this.circuitoId,
    required this.circuitoNombre,
    required this.circuitoNombreCorto,
    required this.totalPuntos,
    required this.coordenadas,
  });

  bool get hasPoints => coordenadas.isNotEmpty;
  CoordenadaPunto? get startPoint => hasPoints ? coordenadas.first : null;
  CoordenadaPunto? get endPoint => hasPoints ? coordenadas.last : null;

  @override
  List<Object?> get props => [
        circuitoId,
        circuitoNombre,
        circuitoNombreCorto,
        totalPuntos,
        coordenadas,
      ];
}

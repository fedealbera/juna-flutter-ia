import 'package:equatable/equatable.dart';

class MapSettings extends Equatable {
  final double defaultLatitude;
  final double defaultLongitude;
  final double defaultZoom;

  const MapSettings({
    required this.defaultLatitude,
    required this.defaultLongitude,
    required this.defaultZoom,
  });

  @override
  List<Object?> get props => [defaultLatitude, defaultLongitude, defaultZoom];
}

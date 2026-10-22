import 'package:equatable/equatable.dart';

class RunnerItem extends Equatable {
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

  const RunnerItem({
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

  String get fullName => '$nombre $apellido'.trim();
  bool get hasDorsal => dorsal.isNotEmpty && dorsal != '0';

  @override
  List<Object?> get props => [
        id,
        nombre,
        apellido,
        dorsal,
        circuito,
        idCircuito,
        categoria,
        idCategoria,
        ciudad,
        provincia,
        grupoEntrenamiento,
      ];
}

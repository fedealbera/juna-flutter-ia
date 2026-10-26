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
  final String? sexo;

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
    this.sexo,
  });

  String get fullName => '$nombre $apellido'.trim();
  bool get hasDorsal => dorsal.isNotEmpty && dorsal != '0';

  String get location {
    final hasCiudad = ciudad != null && ciudad!.trim().isNotEmpty;
    final hasProvincia = provincia != null && provincia!.trim().isNotEmpty;
    if (hasCiudad && hasProvincia) return '$ciudad, $provincia';
    if (hasCiudad) return ciudad!;
    if (hasProvincia) return provincia!;
    return '';
  }

  String get initials {
    final n = nombre.trim();
    final a = apellido.trim();
    if (n.isNotEmpty && a.isNotEmpty) {
      return '${n[0]}${a[0]}'.toUpperCase();
    }
    if (n.isNotEmpty) {
      return n.length >= 2 ? n.substring(0, 2).toUpperCase() : n.toUpperCase();
    }
    if (a.isNotEmpty) {
      return a.length >= 2 ? a.substring(0, 2).toUpperCase() : a.toUpperCase();
    }
    return 'CO';
  }

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
        sexo,
      ];
}

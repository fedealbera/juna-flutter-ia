import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final Map<String, dynamic> rawJson;

  const Category(this.rawJson);

  String get id => rawJson['id']?.toString() ?? rawJson['categId']?.toString() ?? '';
  String get name => rawJson['nombre']?.toString() ?? rawJson['categNombre']?.toString() ?? '';

  @override
  List<Object?> get props => [rawJson];
}

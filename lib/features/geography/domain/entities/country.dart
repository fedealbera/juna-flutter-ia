import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final Map<String, dynamic> rawJson;

  const Country(this.rawJson);

  String get id => rawJson['id']?.toString() ?? '';
  String get name => rawJson['nombre']?.toString() ?? '';

  @override
  List<Object?> get props => [rawJson];
}

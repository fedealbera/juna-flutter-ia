import 'package:equatable/equatable.dart';

class Track extends Equatable {
  final Map<String, dynamic> rawJson;

  const Track(this.rawJson);

  String get id => rawJson['id']?.toString() ?? '';
  String get name => rawJson['nombre']?.toString() ?? '';

  @override
  List<Object?> get props => [rawJson];
}

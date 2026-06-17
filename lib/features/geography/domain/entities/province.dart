import 'package:equatable/equatable.dart';

class Province extends Equatable {
  final Map<String, dynamic> rawJson;

  const Province(this.rawJson);

  String get id => rawJson['id']?.toString() ?? '';
  String get name => rawJson['nombre']?.toString() ?? '';

  @override
  List<Object?> get props => [rawJson];
}

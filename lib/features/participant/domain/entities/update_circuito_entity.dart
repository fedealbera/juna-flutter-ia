import 'package:equatable/equatable.dart';

class UpdateCircuitoEntity extends Equatable {
  final Map<String, dynamic> rawJson;

  const UpdateCircuitoEntity(this.rawJson);

  @override
  List<Object?> get props => [rawJson];
}

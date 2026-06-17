import 'package:equatable/equatable.dart';

class UpdateEmergencyEntity extends Equatable {
  final Map<String, dynamic> rawJson;

  const UpdateEmergencyEntity(this.rawJson);

  @override
  List<Object?> get props => [rawJson];
}

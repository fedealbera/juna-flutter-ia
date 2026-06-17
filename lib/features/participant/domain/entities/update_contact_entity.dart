import 'package:equatable/equatable.dart';

class UpdateContactEntity extends Equatable {
  final Map<String, dynamic> rawJson;

  const UpdateContactEntity(this.rawJson);

  @override
  List<Object?> get props => [rawJson];
}

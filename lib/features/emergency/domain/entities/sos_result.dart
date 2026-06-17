import 'package:equatable/equatable.dart';

class SosResult extends Equatable {
  final Map<String, dynamic> rawJson;

  const SosResult(this.rawJson);

  @override
  List<Object?> get props => [rawJson];
}

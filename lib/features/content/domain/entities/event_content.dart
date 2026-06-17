import 'package:equatable/equatable.dart';

class EventContent extends Equatable {
  final Map<String, dynamic> rawJson;

  const EventContent(this.rawJson);

  String get id => rawJson['id']?.toString() ?? '';
  String get title => rawJson['titulo']?.toString() ?? '';

  @override
  List<Object?> get props => [rawJson];
}

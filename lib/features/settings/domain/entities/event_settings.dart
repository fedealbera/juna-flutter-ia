import 'package:equatable/equatable.dart';

class EventSettings extends Equatable {
  final Map<String, dynamic> rawJson;

  const EventSettings(this.rawJson);

  String get id => rawJson['id']?.toString() ?? '';

  @override
  List<Object?> get props => [rawJson];
}

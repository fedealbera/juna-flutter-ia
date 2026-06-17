import 'package:equatable/equatable.dart';

class DiscountResult extends Equatable {
  final Map<String, dynamic> rawJson;

  const DiscountResult(this.rawJson);

  @override
  List<Object?> get props => [rawJson];
}

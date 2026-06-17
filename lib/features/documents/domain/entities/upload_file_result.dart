import 'package:equatable/equatable.dart';

class UploadFileResult extends Equatable {
  final Map<String, dynamic> rawJson;

  const UploadFileResult(this.rawJson);

  @override
  List<Object?> get props => [rawJson];
}

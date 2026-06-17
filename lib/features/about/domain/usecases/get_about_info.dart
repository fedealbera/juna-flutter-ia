import 'package:injectable/injectable.dart';
import '../entities/about_info.dart';
import '../repositories/about_repository.dart';

@lazySingleton
class GetAboutInfo {
  final AboutRepository _repository;

  GetAboutInfo(this._repository);

  Future<AboutInfo> call() {
    return _repository.getAboutInfo();
  }
}

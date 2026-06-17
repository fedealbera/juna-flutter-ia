import 'package:injectable/injectable.dart';
import 'firebase_manager.dart';
import 'tenant_firebase_config.dart';

@lazySingleton
class InitializeFirebaseUseCase {
  final FirebaseManager _firebaseManager;

  InitializeFirebaseUseCase(this._firebaseManager);

  Future<void> call(int tenantId, FirebaseConfig config) async {
    await _firebaseManager.initializeFirebase(tenantId, config);
  }
}

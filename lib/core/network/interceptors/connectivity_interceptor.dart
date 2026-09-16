import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../error/exceptions.dart';
import '../connectivity_dialog_service.dart';
import '../network_info.dart';

@lazySingleton
class ConnectivityInterceptor extends Interceptor {
  final NetworkInfo _networkInfo;
  final ConnectivityDialogService _connectivityDialogService;

  ConnectivityInterceptor(
    this._networkInfo,
    this._connectivityDialogService,
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final bool skipCheck = options.extra['skipConnectivityCheck'] == true;

    if (!skipCheck) {
      final isConnected = await _networkInfo.isConnected;

      if (!isConnected) {
        // Trigger dialog asynchronously without blocking handler rejection
        _connectivityDialogService.showNoInternetDialog();

        return handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.connectionError,
            error: const NetworkException(
              message: 'No hay conexión a internet en este momento. Por favor, prueba en unos minutos.',
              code: 'NO_INTERNET',
            ),
          ),
        );
      }
    }

    super.onRequest(options, handler);
  }
}

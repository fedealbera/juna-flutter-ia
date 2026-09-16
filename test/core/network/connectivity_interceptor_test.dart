import 'package:dio/dio.dart';
import 'package:event_platform_v3/core/error/exceptions.dart';
import 'package:event_platform_v3/core/network/connectivity_dialog_service.dart';
import 'package:event_platform_v3/core/network/interceptors/connectivity_interceptor.dart';
import 'package:event_platform_v3/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockConnectivityDialogService extends Mock
    implements ConnectivityDialogService {}

class MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockConnectivityDialogService mockConnectivityDialogService;
  late ConnectivityInterceptor interceptor;
  late MockRequestInterceptorHandler mockHandler;

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: ''));
    registerFallbackValue(
      DioException(
        requestOptions: RequestOptions(path: ''),
      ),
    );
  });

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockConnectivityDialogService = MockConnectivityDialogService();
    interceptor = ConnectivityInterceptor(
      mockNetworkInfo,
      mockConnectivityDialogService,
    );
    mockHandler = MockRequestInterceptorHandler();
  });

  group('ConnectivityInterceptor', () {
    test('passes request through when internet is connected', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      final options = RequestOptions(path: '/api/test');
      await interceptor.onRequest(options, mockHandler);

      verify(() => mockNetworkInfo.isConnected).called(1);
      verify(() => mockHandler.next(options)).called(1);
      verifyNever(() => mockConnectivityDialogService.showNoInternetDialog());
      verifyNever(() => mockHandler.reject(any()));
    });

    test('rejects request and triggers popup dialog when offline', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(() => mockConnectivityDialogService.showNoInternetDialog())
          .thenAnswer((_) async {});

      final options = RequestOptions(path: '/api/test');
      await interceptor.onRequest(options, mockHandler);

      verify(() => mockNetworkInfo.isConnected).called(1);
      verify(() => mockConnectivityDialogService.showNoInternetDialog()).called(1);
      verifyNever(() => mockHandler.next(any()));

      final captured = verify(() => mockHandler.reject(captureAny())).captured;
      expect(captured.length, 1);
      final rejectedException = captured.first as DioException;
      expect(rejectedException.type, DioExceptionType.connectionError);
      expect(rejectedException.error, isA<NetworkException>());
    });

    test('skips connectivity check when skipConnectivityCheck is true', () async {
      final options = RequestOptions(
        path: '/api/test',
        extra: {'skipConnectivityCheck': true},
      );

      await interceptor.onRequest(options, mockHandler);

      verifyNever(() => mockNetworkInfo.isConnected);
      verifyNever(() => mockConnectivityDialogService.showNoInternetDialog());
      verify(() => mockHandler.next(options)).called(1);
    });
  });
}

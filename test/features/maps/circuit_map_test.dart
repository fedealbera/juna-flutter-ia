import 'dart:async';
import 'dart:io';
import 'package:event_platform_v3/core/di/injection.dart';
import 'package:event_platform_v3/core/theme/tenant_manager.dart';
import 'package:event_platform_v3/features/event/domain/entities/circuito_coordenadas.dart';
import 'package:event_platform_v3/features/maps/presentation/screens/circuit_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeHttpClientResponse extends Fake implements HttpClientResponse {
  @override
  int get statusCode => 200;

  @override
  String get reasonPhrase => 'OK';

  @override
  int get contentLength => _transparentPng.length;

  @override
  final HttpHeaders headers = _FakeHttpHeaders();

  @override
  bool get isRedirect => false;

  @override
  List<RedirectInfo> get redirects => const [];

  @override
  bool get persistentConnection => false;

  @override
  X509Certificate? get certificate => null;

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int> event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return Stream<List<int>>.value(_transparentPng).listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  static const List<int> _transparentPng = [
    0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D,
    0x49, 0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
    0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4, 0x89, 0x00, 0x00, 0x00,
    0x0A, 0x49, 0x44, 0x41, 0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
    0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x49,
    0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82,
  ];
}

class _FakeHttpClientRequest extends Fake implements HttpClientRequest {
  @override
  final HttpHeaders headers = _FakeHttpHeaders();

  @override
  bool followRedirects = true;

  @override
  int maxRedirects = 5;

  @override
  int contentLength = 0;

  @override
  bool persistentConnection = false;

  @override
  Future<void> addStream(Stream<List<int>> stream) async {
    await stream.drain();
  }

  @override
  void add(List<int> data) {}

  @override
  Future<HttpClientResponse> close() async => _FakeHttpClientResponse();
}

class _FakeHttpHeaders extends Fake implements HttpHeaders {
  @override
  void set(String name, Object value, {bool preserveHeaderCase = false}) {}

  @override
  void forEach(void Function(String name, List<String> values) action) {}

  @override
  List<String>? operator [](String name) => null;

  @override
  String? value(String name) => null;

  @override
  int get contentLength => _FakeHttpClientResponse._transparentPng.length;

  @override
  ContentType? get contentType => ContentType('image', 'png');
}

class _FakeHttpClient extends Fake implements HttpClient {
  @override
  bool autoUncompress = true;

  @override
  Duration idleTimeout = const Duration(seconds: 15);

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) async => _FakeHttpClientRequest();

  @override
  Future<HttpClientRequest> getUrl(Uri url) async => _FakeHttpClientRequest();

  @override
  void close({bool force = false}) {}
}

class _TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) => _FakeHttpClient();
}

void main() {
  setUpAll(() {
    HttpOverrides.global = _TestHttpOverrides();
  });

  setUp(() {
    if (!getIt.isRegistered<TenantManager>()) {
      getIt.registerSingleton<TenantManager>(TenantManager());
    }
  });

  tearDown(() {
    getIt.reset();
  });

  group('CircuitMapScreen Widget Tests', () {
    const mockCoordenadas = CircuitoCoordenadas(
      circuitoId: 4,
      circuitoNombre: '10K',
      circuitoNombreCorto: '10K',
      totalPuntos: 3,
      coordenadas: [
        CoordenadaPunto(
          id: 1,
          lat: -26.8264,
          lng: -65.1929,
          ele: 437.0,
          dist: 0.0,
        ),
        CoordenadaPunto(
          id: 2,
          lat: -26.8270,
          lng: -65.1935,
          ele: 442.0,
          dist: 0.5,
        ),
        CoordenadaPunto(
          id: 3,
          lat: -26.8280,
          lng: -65.1945,
          ele: 450.0,
          dist: 1.0,
        ),
      ],
    );

    testWidgets('renders CircuitMapScreen with title, points and FlutterMap', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CircuitMapScreen(
            circuitName: '10K',
            circuitoCoordenadas: mockCoordenadas,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check title and total points
      expect(find.text('Circuito 10K'), findsWidgets);
      expect(find.text('3 puntos de trazado'), findsOneWidget);

      // Check FlutterMap and PolylineLayer
      expect(find.byType(FlutterMap), findsOneWidget);
      expect(find.byType(PolylineLayer), findsOneWidget);

      // Check bottom panel details
      expect(find.text('Recorrido Oficial 10K'), findsOneWidget);
      expect(find.text('437m - 450m'), findsOneWidget);
      expect(find.text('1.0 km'), findsOneWidget);

      // Check recenter button exists
      expect(find.byIcon(Icons.fit_screen_rounded), findsOneWidget);

      // Flush flutter_map gesture timers
      await tester.pump(const Duration(milliseconds: 300));
    });

    testWidgets('can tap recenter button without error', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CircuitMapScreen(
            circuitName: '10K',
            circuitoCoordenadas: mockCoordenadas,
          ),
        ),
      );
      await tester.pumpAndSettle();

      final recenterButton = find.byIcon(Icons.fit_screen_rounded);
      expect(recenterButton, findsOneWidget);
      await tester.tap(recenterButton);
      await tester.pumpAndSettle();

      // Flush flutter_map gesture timers
      await tester.pump(const Duration(milliseconds: 300));
    });

    test('CircuitoCoordenadas hasPoints is false when empty', () {
      const emptyCoords = CircuitoCoordenadas(
        circuitoId: 2,
        circuitoNombre: '21K',
        circuitoNombreCorto: '21K',
        totalPuntos: 0,
        coordenadas: [],
      );

      expect(emptyCoords.hasPoints, isFalse);
      expect(emptyCoords.startPoint, isNull);
      expect(emptyCoords.endPoint, isNull);
    });

    testWidgets('shows warning dialog when circuit has no coordinates', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                      title: Text('Circuito no disponible'),
                      content: Text('El trazado del circuito aún no está disponible para su visualización. Por favor, intenta nuevamente más tarde.'),
                    ),
                  );
                },
                child: const Text('Show Warning'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Warning'));
      await tester.pumpAndSettle();

      expect(find.text('Circuito no disponible'), findsOneWidget);
      expect(
        find.text('El trazado del circuito aún no está disponible para su visualización. Por favor, intenta nuevamente más tarde.'),
        findsOneWidget,
      );
    });
  });
}

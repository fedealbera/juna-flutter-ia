import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../tracks/presentation/bloc/tracks_bloc.dart';
import '../../../tracks/presentation/bloc/tracks_event.dart';
import '../../../settings/domain/repositories/settings_repository.dart';
import '../../../settings/domain/entities/event_settings.dart';


class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  late final TracksBloc _tracksBloc;
  EventSettings? _settings;

  // Selected layer
  String _selectedLayer = 'Largada';

  // Map controller
  final MapController _mapController = MapController();

  // Config map for layout matching the user screenshot
  final Map<String, _LayerInfo> _layerConfig = {
    'Largada': const _LayerInfo(
      label: 'LARGADA',
      icon: Icons.outlined_flag_rounded,
    ),
    'Acreditación': const _LayerInfo(
      label: 'ACRED.',
      icon: Icons.credit_card_outlined,
    ),
    'Reconocimiento': const _LayerInfo(
      label: 'RECONOC.',
      icon: Icons.location_on_outlined,
    ),
    'Circuitos': const _LayerInfo(
      label: 'CIRCUITOS',
      icon: Icons.alt_route_rounded,
    ),
  };

  // Simulated GPX Track Coordinates
  final List<LatLng> _gpxPoints = [
    const LatLng(-34.6037, -58.3816), // Start (Obelisco)
    const LatLng(-34.6050, -58.3850),
    const LatLng(-34.6080, -58.3900),
    const LatLng(-34.6100, -58.3950),
    const LatLng(-34.6150, -58.4000),
    const LatLng(-34.6200, -58.4100),
    const LatLng(-34.6250, -58.4150),
    const LatLng(-34.6200, -58.4250),
    const LatLng(-34.6150, -58.4300),
    const LatLng(-34.6080, -58.4350), // End (Parque Centenario)
  ];

  @override
  void initState() {
    super.initState();
    _tracksBloc = getIt<TracksBloc>();
    _loadTracks();

    _settings = getIt<SettingsRepository>().getCachedSettings();
    final layers = _availableLayers;
    if (layers.isNotEmpty) {
      _selectedLayer = layers.first;
    }

    _tenantManager.addListener(_onTenantChanged);
  }

  void _loadTracks() {
    _tracksBloc.add(const TracksEvent.getTracks(eventId: '1'));
  }

  void _onTenantChanged() {
    _loadTracks();
    setState(() {
      _settings = getIt<SettingsRepository>().getCachedSettings();
      final layers = _availableLayers;
      if (layers.isNotEmpty && !layers.contains(_selectedLayer)) {
        _selectedLayer = layers.first;
      }
    });
  }

  @override
  void dispose() {
    _tenantManager.removeListener(_onTenantChanged);
    super.dispose();
  }

  double? _parseCoordinate(dynamic val) {
    if (val == null) return null;
    if (val is num) return val.toDouble();
    return double.tryParse(val.toString());
  }

  List<String> get _availableLayers {
    final layers = <String>[];
    final settings = _settings;
    if (settings != null) {
      if (settings.latLargada != null && settings.lonLargada != null) {
        layers.add('Largada');
      }
      if (settings.acreditacionesMap.isNotEmpty) {
        layers.add('Acreditación');
      }
      if (settings.isEnabledReconocimiento &&
          settings.latReconocimiento != null &&
          settings.lonReconocimiento != null) {
        layers.add('Reconocimiento');
      }
    } else {
      layers.addAll(['Largada', 'Acreditación']);
    }
    layers.add('Circuitos');
    return layers;
  }

  LatLng? _getLayerCenter(String layer, EventSettings? settings) {
    if (settings == null) return null;
    switch (layer) {
      case 'Largada':
        if (settings.latLargada != null && settings.lonLargada != null) {
          return LatLng(settings.latLargada!, settings.lonLargada!);
        }
        break;
      case 'Acreditación':
        final map = settings.acreditacionesMap;
        if (map.isNotEmpty) {
          final firstKey = map.keys.first;
          final entry = map[firstKey];
          if (entry is Map) {
            final lat = _parseCoordinate(entry['lat']);
            final lon = _parseCoordinate(entry['lon']);
            if (lat != null && lon != null) {
              return LatLng(lat, lon);
            }
          }
        }
        break;
      case 'Reconocimiento':
        if (settings.latReconocimiento != null && settings.lonReconocimiento != null) {
          return LatLng(settings.latReconocimiento!, settings.lonReconocimiento!);
        }
        break;
      case 'Circuitos':
        return _gpxPoints.first;
    }
    return null;
  }

  void _onLayerSelected(String layer) {
    setState(() {
      _selectedLayer = layer;
    });
    if (layer != 'Circuitos') {
      final center = _getLayerCenter(layer, _settings);
      if (center != null) {
        _mapController.move(center, 15.0);
      }
    }
  }

  List<Marker> _buildAcreditacionMarkers(EventSettings? settings) {
    if (settings == null) return [];
    final markers = <Marker>[];
    settings.acreditacionesMap.forEach((dateLabel, value) {
      if (value is Map) {
        final lat = _parseCoordinate(value['lat']);
        final lon = _parseCoordinate(value['lon']);
        if (lat != null && lon != null) {
          markers.add(
            Marker(
              point: LatLng(lat, lon),
              width: 45,
              height: 45,
              child: _buildMapMarker(Icons.badge_outlined, Colors.orange),
            ),
          );
        }
      }
    });
    return markers;
  }

  Future<void> _launchNavigation(double lat, double lon) async {
    // In Android and iOS, try launching native deep links directly (without canLaunchUrl, which can fail due to OS queries configurations).
    final isApple = Theme.of(context).platform == TargetPlatform.iOS;
    final googleMapsUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lon");
    final appleMapsUrl = Uri.parse("https://maps.apple.com/?ll=$lat,$lon&q=Ubicacion");

    try {
      bool launched = false;
      if (isApple) {
        // Try Apple Maps first on iOS
        launched = await launchUrl(appleMapsUrl, mode: LaunchMode.externalApplication);
      } else {
        // Try Google Maps first on Android/others
        launched = await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
      }

      if (!launched) {
        // Fallback to the other service if primary launcher is not available
        launched = await launchUrl(isApple ? googleMapsUrl : appleMapsUrl, mode: LaunchMode.externalApplication);
      }

      if (!launched) {
        // Final fallback: launch in system browser
        launched = await launchUrl(googleMapsUrl, mode: LaunchMode.platformDefault);
      }

      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir la aplicación de mapas.')),
        );
      }
    } catch (_) {
      // Catch exceptions (like missing apps/launch failures) and force opening the browser map
      try {
        await launchUrl(googleMapsUrl, mode: LaunchMode.platformDefault);
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No se pudo abrir el mapa.')),
          );
        }
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;

    return BlocProvider<TracksBloc>.value(
      value: _tracksBloc,
      child: Scaffold(
        backgroundColor: activeTenant.backgroundColorRef,
        body: Column(
            children: [
              // Switcher Bar matching requested style
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black, // Negro
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _availableLayers.map((layer) {
                      final isSelected = _selectedLayer == layer;
                      final config = _layerConfig[layer] ??
                          _LayerInfo(label: layer.toUpperCase(), icon: Icons.place);

                      return Expanded(
                        child: GestureDetector(
                          onTap: () => _onLayerSelected(layer),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? activeTenant.primaryColorRef : Colors.transparent, // Remarque con Primary Color
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  config.icon,
                                  color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.6), // Letras/iconos blancas
                                  size: 24,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  config.label,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.6), // Letras/iconos blancas
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              
              // Dynamic Body
              Expanded(
                child: _selectedLayer == 'Circuitos'
                    ? _buildCircuitosList(activeTenant)
                    : _buildMapStack(activeTenant),
              ),
            ],
          ),

      ),
    );
  }

  Widget _buildMapStack(dynamic activeTenant) {
    final initialCenter = _getLayerCenter(_selectedLayer, _settings) ?? _gpxPoints.first;

    return Stack(
      children: [
        // 1. Integrated flutter_map with OpenStreetMap tiles
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: initialCenter,
            initialZoom: 15.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.churomobile.juna',
            ),
            // Draw Markers according to selected layer
            MarkerLayer(
              markers: [
                // Largada Marker
                if (_selectedLayer == 'Largada')
                  Marker(
                    point: _getLayerCenter('Largada', _settings) ?? _gpxPoints.first,
                    width: 45,
                    height: 45,
                    child: _buildMapMarker(Icons.flag_rounded, Colors.green),
                  ),
                // Acreditación Markers
                if (_selectedLayer == 'Acreditación')
                  ..._buildAcreditacionMarkers(_settings),
                // Recon Marker
                if (_selectedLayer == 'Reconocimiento')
                  Marker(
                    point: _getLayerCenter('Reconocimiento', _settings) ?? _gpxPoints.first,
                    width: 45,
                    height: 45,
                    child: _buildMapMarker(Icons.warning_amber_rounded, Colors.redAccent),
                  ),
              ],
            ),
          ],
        ),

        // 2. Floating Bottom Details Panel
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: _buildBottomPanel(activeTenant),
        ),
      ],
    );
  }

  Widget _buildCircuitosList(dynamic activeTenant) {
    final Map<String, dynamic> fallbackCircuitos = {
      '30K Rural': 'https://desafiodelasnubes.com.ar/30k.html',
      '35K XC': 'https://desafiodelasnubes.com.ar/35k.html',
      '50K XC': 'https://desafiodelasnubes.com.ar/50k.html',
      '80K Rural': 'https://desafiodelasnubes.com.ar/80k.html',
    };

    final circuitos = _settings?.circuitosMap.isNotEmpty == true 
        ? _settings!.circuitosMap 
        : fallbackCircuitos;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 12.0, bottom: 8.0),
          child: Text(
            'Selecciona un Circuito',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: circuitos.length,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            itemBuilder: (context, index) {
              final name = circuitos.keys.elementAt(index);
              final url = circuitos[name]?.toString() ?? '';

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: AppCard(
                  style: AppCardStyle.glassmorphic,
                  padding: EdgeInsets.zero,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      if (url.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CircuitWebViewScreen(
                              title: name,
                              url: url,
                            ),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Left Icon Circle Badge
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: activeTenant.primaryColorRef.withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.alt_route_rounded,
                              color: activeTenant.primaryColorRef,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 14),
                          // Title and Subtitle Text Block
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Ver altimetría y recorrido',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white.withValues(alpha: 0.6),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Right Square Action Icon
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.open_in_full_rounded,
                              color: Colors.white.withValues(alpha: 0.6),
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBottomPanel(dynamic activeTenant) {
    String title = '';
    String description = '';
    IconData icon = Icons.place;
    Color iconColor = Colors.white;
    double? lat;
    double? lon;
    final List<Widget> extraContent = [];

    final settings = _settings;
    if (_selectedLayer == 'Largada') {
      title = 'Largada';
      description = 'Punto de largada oficial de la carrera.';
      icon = Icons.flag_rounded;
      iconColor = Colors.green;
      lat = settings?.latLargada;
      lon = settings?.lonLargada;
    } else if (_selectedLayer == 'Acreditación') {
      title = 'Acreditaciones';
      description = 'Lugar y fechas de acreditación de competidores.';
      icon = Icons.badge_outlined;
      iconColor = Colors.orange;
      
      if (settings != null && settings.acreditacionesMap.isNotEmpty) {
        final entries = settings.acreditacionesMap;
        for (final entry in entries.entries) {
          final dateStr = entry.key;
          final val = entry.value;
          if (val is Map) {
            final entryLat = _parseCoordinate(val['lat']);
            final entryLon = _parseCoordinate(val['lon']);
            if (entryLat != null && entryLon != null) {
              lat ??= entryLat;
              lon ??= entryLon;
            }
          }
          extraContent.add(
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                children: [
                  Icon(Icons.calendar_month_rounded, size: 14, color: activeTenant.primaryColorRef),
                  const SizedBox(width: 6),
                  Text(
                    dateStr,
                    style: const TextStyle(
                      color: Color(0xFF333333), // gris mas oscuro
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
    } else if (_selectedLayer == 'Reconocimiento') {
      title = 'Reconocimiento';
      description = 'Punto establecido para el reconocimiento del circuito.';
      icon = Icons.warning_amber_rounded;
      iconColor = Colors.redAccent;
      lat = settings?.latReconocimiento;
      lon = settings?.lonReconocimiento;
    }

    return AppCard(
      style: AppCardStyle.glassmorphic,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: iconColor.withValues(alpha: 0.3), width: 1.5),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF1E293B), // gris oscuro para contrastar en el fondo blured
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Color(0xFF333333), // gris mas oscuro para resaltar en el fondo blured
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (extraContent.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      ...extraContent,
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (lat != null && lon != null) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: 'CÓMO LLEGAR',
                    icon: Icons.directions_rounded,
                    textColor: Colors.white,
                    onPressed: () => _launchNavigation(lat!, lon!),
                    type: AppButtonType.primary,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMapMarker(IconData icon, Color color, {bool isTracker = false}) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: isTracker
                ? [
                    BoxShadow(
                      color: color.withValues(alpha: 0.6),
                      blurRadius: 8,
                      spreadRadius: 2,
                    )
                  ]
                : null,
          ),
          child: Icon(icon, color: Colors.white, size: 16),
        ),
      ),
    );
  }
}

class _LayerInfo {
  final String label;
  final IconData icon;

  const _LayerInfo({
    required this.label,
    required this.icon,
  });
}

class CircuitWebViewScreen extends StatefulWidget {
  final String title;
  final String url;

  const CircuitWebViewScreen({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<CircuitWebViewScreen> createState() => _CircuitWebViewScreenState();
}

class _CircuitWebViewScreenState extends State<CircuitWebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..enableZoom(true)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
            // Forces pinch-to-zoom support even if the HTML viewport disables user scaling
            _controller.runJavaScript('''
              var meta = document.querySelector('meta[name="viewport"]');
              if (meta) {
                meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes');
              } else {
                meta = document.createElement('meta');
                meta.name = 'viewport';
                meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes';
                document.getElementsByTagName('head')[0].appendChild(meta);
              }
            ''');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("WebView error: ${error.description}");
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = getIt<TenantManager>().value;

    return Scaffold(
      backgroundColor: activeTenant.backgroundColorRef,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

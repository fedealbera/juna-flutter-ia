import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../event/domain/entities/circuito_coordenadas.dart';
import '../../../../shared/design_system/cards/app_card.dart';

class CircuitMapScreen extends StatefulWidget {
  final String circuitName;
  final CircuitoCoordenadas circuitoCoordenadas;

  const CircuitMapScreen({
    super.key,
    required this.circuitName,
    required this.circuitoCoordenadas,
  });

  @override
  State<CircuitMapScreen> createState() => _CircuitMapScreenState();
}

class _CircuitMapScreenState extends State<CircuitMapScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  late final MapController _mapController;
  late final List<LatLng> _points;

  double? _minElevation;
  double? _maxElevation;
  double? _totalDistanceKm;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _points = widget.circuitoCoordenadas.coordenadas
        .map((p) => LatLng(p.lat, p.lng))
        .toList();

    _calculateStats();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fitTrackBounds();
    });
  }

  void _calculateStats() {
    if (widget.circuitoCoordenadas.coordenadas.isEmpty) return;

    final coords = widget.circuitoCoordenadas.coordenadas;
    double? minE;
    double? maxE;

    for (final p in coords) {
      if (p.ele > 0) {
        if (minE == null || p.ele < minE) minE = p.ele;
        if (maxE == null || p.ele > maxE) maxE = p.ele;
      }
    }
    _minElevation = minE;
    _maxElevation = maxE;

    // Check if the API returned cumulative distance in km/m
    final lastPoint = coords.last;
    if (lastPoint.dist > 0) {
      // If dist is in km or m (values > 100 typically represent meters)
      _totalDistanceKm = lastPoint.dist > 100 ? lastPoint.dist / 1000 : lastPoint.dist;
    } else if (_points.length > 1) {
      // Calculate cumulative distance using geodesy Distance
      const distanceCalc = Distance();
      double totalMeters = 0;
      for (int i = 0; i < _points.length - 1; i++) {
        totalMeters += distanceCalc.as(LengthUnit.Meter, _points[i], _points[i + 1]);
      }
      _totalDistanceKm = totalMeters / 1000.0;
    }
  }

  void _fitTrackBounds() {
    if (_points.isEmpty) return;
    try {
      final bounds = LatLngBounds.fromPoints(_points);
      _mapController.fitCamera(
        CameraFit.bounds(
          bounds: bounds,
          padding: const EdgeInsets.only(
            left: 36,
            right: 36,
            top: 50,
            bottom: 140,
          ),
        ),
      );
    } catch (e) {
      debugPrint('Error fitting camera bounds: $e');
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;
    final initialCenter = _points.isNotEmpty
        ? _points.first
        : const LatLng(-26.8264, -65.1930);

    return Scaffold(
      backgroundColor: activeTenant.backgroundColorRef,
      appBar: AppBar(
        backgroundColor: Colors.black.withValues(alpha: 0.85),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Circuito ${widget.circuitName}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              '${widget.circuitoCoordenadas.totalPuntos} puntos de trazado',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: activeTenant.primaryColorRef.withValues(alpha: 0.2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: activeTenant.primaryColorRef.withValues(alpha: 0.5),
                  width: 1.2,
                ),
              ),
              child: Icon(
                Icons.fit_screen_rounded,
                color: activeTenant.primaryColorRef,
                size: 20,
              ),
            ),
            onPressed: _fitTrackBounds,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          // 1. FlutterMap with Painted Polyline and Markers
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: initialCenter,
              initialZoom: 14.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.churomobile.juna',
              ),
              if (_points.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _points,
                      strokeWidth: 5.0,
                      color: activeTenant.primaryColorRef,
                      borderStrokeWidth: 2.5,
                      borderColor: Colors.white,
                    ),
                  ],
                ),
              if (_points.isNotEmpty)
                MarkerLayer(
                  markers: [
                    // Start Marker (Largada)
                    Marker(
                      point: _points.first,
                      width: 50,
                      height: 50,
                      child: _buildStartFinishMarker(
                        icon: Icons.flag_rounded,
                        color: Colors.green,
                        label: 'LARGADA',
                      ),
                    ),
                    // End Marker (Llegada)
                    if (_points.length > 1)
                      Marker(
                        point: _points.last,
                        width: 50,
                        height: 50,
                        child: _buildStartFinishMarker(
                          icon: Icons.sports_score_rounded,
                          color: Colors.redAccent,
                          label: 'LLEGADA',
                        ),
                      ),
                  ],
                ),
            ],
          ),

          // 2. Floating Info Panel at Bottom
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: AppCard(
              style: AppCardStyle.glassmorphic,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: activeTenant.primaryColorRef.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.alt_route_rounded,
                          color: activeTenant.primaryColorRef,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Recorrido Oficial ${widget.circuitName}',
                              style: const TextStyle(
                                color: Color(0xFF1E293B),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Trazado verificado por la organización',
                              style: TextStyle(
                                color: Colors.blueGrey.shade700,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: Colors.black12, height: 1),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatChip(
                        icon: Icons.straighten_rounded,
                        label: 'Distancia',
                        value: _totalDistanceKm != null
                            ? '${_totalDistanceKm!.toStringAsFixed(1)} km'
                            : widget.circuitName,
                        accentColor: activeTenant.primaryColorRef,
                      ),
                      if (_minElevation != null && _maxElevation != null)
                        _buildStatChip(
                          icon: Icons.terrain_rounded,
                          label: 'Altimetría',
                          value: '${_minElevation!.round()}m - ${_maxElevation!.round()}m',
                          accentColor: Colors.orange.shade700,
                        ),
                      _buildStatChip(
                        icon: Icons.grain_rounded,
                        label: 'Puntos',
                        value: '${widget.circuitoCoordenadas.totalPuntos}',
                        accentColor: Colors.blueGrey.shade700,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartFinishMarker({
    required IconData icon,
    required Color color,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.5),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      ],
    );
  }

  Widget _buildStatChip({
    required IconData icon,
    required String label,
    required String value,
    required Color accentColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: accentColor),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

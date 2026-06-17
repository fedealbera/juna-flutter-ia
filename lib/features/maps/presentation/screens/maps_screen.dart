import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../tracks/presentation/bloc/tracks_bloc.dart';
import '../../../tracks/presentation/bloc/tracks_event.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  late final TracksBloc _tracksBloc;

  // Selected layer
  String _selectedLayer = 'Circuitos';

  // Map controller
  final MapController _mapController = MapController();

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

  // Tracker simulation parameters
  Timer? _simulationTimer;
  int _currentSimulationIndex = 0;
  bool _isSimulating = false;

  @override
  void initState() {
    super.initState();
    _tracksBloc = getIt<TracksBloc>();
    _loadTracks();

    _tenantManager.addListener(_onTenantChanged);
  }

  void _loadTracks() {
    final activeTenant = _tenantManager.value;
    _tracksBloc.add(TracksEvent.getTracks(eventId: 'evt_v3_${activeTenant.id}'));
  }

  void _onTenantChanged() {
    _loadTracks();
    _stopSimulation();
    setState(() {});
  }

  @override
  void dispose() {
    _tenantManager.removeListener(_onTenantChanged);
    _simulationTimer?.cancel();
    super.dispose();
  }

  void _startSimulation() {
    if (_isSimulating) return;
    setState(() {
      _isSimulating = true;
      _currentSimulationIndex = 0;
    });

    _simulationTimer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      if (mounted) {
        setState(() {
          if (_currentSimulationIndex < _gpxPoints.length - 1) {
            _currentSimulationIndex++;
            // Focus map on the moving tracker
            _mapController.move(_gpxPoints[_currentSimulationIndex], _mapController.camera.zoom);
          } else {
            _stopSimulation();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('¡Simulación de recorrido completada!')),
            );
          }
        });
      }
    });
  }

  void _stopSimulation() {
    _simulationTimer?.cancel();
    setState(() {
      _isSimulating = false;
      _currentSimulationIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;

    // Current position of the simulated runner
    final LatLng trackerPosition = _gpxPoints[_currentSimulationIndex];

    return BlocProvider<TracksBloc>.value(
      value: _tracksBloc,
      child: Scaffold(
        backgroundColor: activeTenant.backgroundColor,
        body: Stack(
          children: [
            // 1. Integrated flutter_map with OpenStreetMap tiles
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _gpxPoints.first,
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.churomobile.juna',
                ),
                // Draw polyline path if "Circuitos" or "Tracks" is selected
                if (_selectedLayer == 'Circuitos' || _selectedLayer == 'Tracks')
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: _gpxPoints,
                        color: activeTenant.primaryColor,
                        strokeWidth: 5.0,
                        borderColor: Colors.black.withValues(alpha: 0.3),
                        borderStrokeWidth: 1.5,
                      ),
                    ],
                  ),
                // Draw Markers according to selected layer
                MarkerLayer(
                  markers: [
                    // Start Marker
                    if (_selectedLayer == 'Largada' || _selectedLayer == 'Circuitos')
                      Marker(
                        point: _gpxPoints.first,
                        width: 45,
                        height: 45,
                        child: _buildMapMarker(Icons.flag_rounded, Colors.green),
                      ),
                    // Check-in / Registration Marker
                    if (_selectedLayer == 'Acreditación')
                      Marker(
                        point: _gpxPoints[3],
                        width: 45,
                        height: 45,
                        child: _buildMapMarker(Icons.badge_outlined, Colors.orange),
                      ),
                    // Recon / Alert Marker
                    if (_selectedLayer == 'Reconocimiento')
                      Marker(
                        point: _gpxPoints[6],
                        width: 45,
                        height: 45,
                        child: _buildMapMarker(Icons.warning_amber_rounded, Colors.redAccent),
                      ),
                    // End Marker
                    if (_selectedLayer == 'Circuitos')
                      Marker(
                        point: _gpxPoints.last,
                        width: 45,
                        height: 45,
                        child: _buildMapMarker(Icons.sports_score_rounded, Colors.blue),
                      ),
                    // Runner tracker Marker
                    if (_isSimulating)
                      Marker(
                        point: trackerPosition,
                        width: 50,
                        height: 50,
                        child: _buildMapMarker(Icons.directions_run_rounded, activeTenant.accentColor, isTracker: true),
                      ),
                  ],
                ),
              ],
            ),

            // 2. Floating Top Bar with layer switcher
            Positioned(
              top: 12,
              left: 12,
              right: 12,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ['Largada', 'Acreditación', 'Reconocimiento', 'Circuitos', 'Tracks'].map((layer) {
                    final isSelected = _selectedLayer == layer;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedLayer = layer;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? activeTenant.primaryColor
                              : activeTenant.backgroundColor.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: isSelected ? Colors.transparent : Colors.white.withValues(alpha: 0.1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Text(
                          layer,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey.shade300,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            // 3. Floating Bottom Simulation Panel
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: AppCard(
                style: AppCardStyle.glassmorphic,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activeTenant.name,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'GPX Track: Cruce 80K',
                              style: TextStyle(color: Colors.grey, fontSize: 11),
                            ),
                          ],
                        ),
                        if (_isSimulating)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: activeTenant.accentColor.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: activeTenant.accentColor.withValues(alpha: 0.4)),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.lens, color: Colors.green, size: 8),
                                SizedBox(width: 6),
                                Text(
                                  'SIMULACIÓN EN VIVO',
                                  style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            text: _isSimulating ? 'DETENER SIMULACIÓN' : 'INICIAR SIMULACIÓN GPX',
                            icon: _isSimulating ? Icons.stop_rounded : Icons.play_arrow_rounded,
                            onPressed: _isSimulating ? _stopSimulation : _startSimulation,
                            type: _isSimulating ? AppButtonType.outlined : AppButtonType.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_config.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../core/storage/hive_service.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../../content/presentation/bloc/content_bloc.dart';
import '../../../content/presentation/bloc/content_event.dart';
import '../../../emergency/presentation/bloc/emergency_bloc.dart';
import '../../../emergency/presentation/bloc/emergency_event.dart';
import '../../../emergency/presentation/bloc/emergency_state.dart';
import '../../../settings/presentation/bloc/settings_bloc.dart';
import '../../../settings/presentation/bloc/settings_event.dart';
import '../../../settings/presentation/bloc/settings_state.dart';
import '../../../settings/domain/repositories/settings_repository.dart';
import '../../../settings/domain/entities/event_settings.dart';
import '../../../participant/domain/entities/participant_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();

  late final ContentBloc _contentBloc;
  late final EmergencyBloc _emergencyBloc;
  late final SettingsBloc _settingsBloc;

  // Countdown timer parameters
  late Timer _countdownTimer;
  Duration _timeLeft = const Duration(
    days: 12,
    hours: 8,
    minutes: 43,
    seconds: 12,
  );
  int? _raceTimestamp;

  // Weather parameters
  bool _isLoadingWeather = true;
  double? _weatherTempBase;
  int _weatherCodeBase = 0;
  double? _weatherWindBase;

  // Scroll parameters for visual indicator
  final ScrollController _scrollController = ScrollController();
  bool _showScrollIndicator = true;

  // Participant parameters
  ParticipantDetail? _linkedParticipant;

  @override
  void initState() {
    super.initState();
    _contentBloc = getIt<ContentBloc>();
    _emergencyBloc = getIt<EmergencyBloc>();
    _settingsBloc = getIt<SettingsBloc>();

    _loadLinkedParticipant();

    // Try to load cached settings instantly to avoid countdown jump
    final cached = getIt<SettingsRepository>().getCachedSettings();
    if (cached != null) {
      final tsStr = cached.fechaCarreraTs;
      if (tsStr.isNotEmpty) {
        final parsedTs = int.tryParse(tsStr);
        if (parsedTs != null) {
          _raceTimestamp = tsStr.length == 10 ? parsedTs * 1000 : parsedTs;
          final difference = DateTime.fromMillisecondsSinceEpoch(
            _raceTimestamp!,
          ).difference(DateTime.now());
          _timeLeft = difference.inSeconds > 0 ? difference : Duration.zero;
        }
      }
      _loadWeatherForSettings(cached);
    }

    // Load active event content and settings
    _loadEventContent();
    _settingsBloc.add(
      const SettingsEvent.getSettings(eventId: '1', idOrg: '1'),
    );

    // Dynamically rebuild when tenant configuration changes
    _tenantManager.addListener(_onTenantChanged);

    // Run countdown update loop
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        // Sync setting changes dynamically from BLoC state
        final settingsState = _settingsBloc.state;
        settingsState.maybeWhen(
          loaded: (settings) {
            final tsStr = settings.fechaCarreraTs;
            if (tsStr.isNotEmpty) {
              final ts = int.tryParse(tsStr);
              if (ts != null) {
                _raceTimestamp = tsStr.length == 10 ? ts * 1000 : ts;
              }
            }
          },
          orElse: () {},
        );

        setState(() {
          if (_raceTimestamp != null) {
            final raceDate = DateTime.fromMillisecondsSinceEpoch(
              _raceTimestamp!,
            );
            final difference = raceDate.difference(DateTime.now());
            _timeLeft = difference.inSeconds > 0 ? difference : Duration.zero;
          } else {
            if (_timeLeft.inSeconds > 0) {
              _timeLeft = _timeLeft - const Duration(seconds: 1);
            }
          }
        });
      }
    });

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollController.offset > 30 && _showScrollIndicator) {
          setState(() {
            _showScrollIndicator = false;
          });
        } else if (_scrollController.offset <= 30 && !_showScrollIndicator) {
          setState(() {
            _showScrollIndicator = true;
          });
        }
      }
    });
  }

  void _loadEventContent() {
    _contentBloc.add(
      const ContentEvent.getEventContent(eventId: '1', idOrg: '1'),
    );
  }

  Future<void> _loadLinkedParticipant() async {
    try {
      final hiveService = getIt<HiveService>();
      final Map? cachedJson = await hiveService.get<Map>(
        'participant_box',
        'cached_participant',
      );
      if (cachedJson != null && mounted) {
        setState(() {
          _linkedParticipant = ParticipantDetail(cachedJson.cast<String, dynamic>());
        });
      }
    } catch (e) {
      debugPrint('Error loading participant on home: $e');
    }
  }

  void _onTenantChanged() {
    _loadEventContent();
    _settingsBloc.add(
      const SettingsEvent.getSettings(eventId: '1', idOrg: '1'),
    );
    _loadLinkedParticipant();
    setState(() {});
  }

  @override
  void dispose() {
    _tenantManager.removeListener(_onTenantChanged);
    _countdownTimer.cancel();
    _scrollController.dispose();
    _settingsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;

    return MultiBlocProvider(
      providers: [
        BlocProvider<ContentBloc>.value(value: _contentBloc),
        BlocProvider<EmergencyBloc>.value(value: _emergencyBloc),
        BlocProvider<SettingsBloc>.value(value: _settingsBloc),
      ],
      child: Scaffold(
        backgroundColor: activeTenant.backgroundColorRef,
        body: MultiBlocListener(
          listeners: [
            BlocListener<EmergencyBloc, EmergencyState>(
              listener: (context, state) {
                state.maybeWhen(
                  sosSent: (result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          '¡Señal de Emergencia SOS enviada con éxito!',
                        ),
                        backgroundColor: Colors.green.shade800,
                      ),
                    );
                  },
                  error: (msg) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error al enviar SOS: $msg'),
                        backgroundColor: Colors.red.shade800,
                      ),
                    );
                  },
                  orElse: () {},
                );
              },
            ),
            BlocListener<SettingsBloc, SettingsState>(
              listener: (context, state) {
                state.maybeWhen(
                  loaded: (settings) {
                    final tsStr = settings.fechaCarreraTs;
                    if (tsStr.isNotEmpty) {
                      final ts = int.tryParse(tsStr);
                      if (ts != null) {
                        setState(() {
                          _raceTimestamp = tsStr.length == 10 ? ts * 1000 : ts;
                        });
                      }
                    }
                    _loadWeatherForSettings(settings);
                  },
                  orElse: () {},
                );
              },
            ),
          ],
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, settingsState) {
              final cachedSettings = getIt<SettingsRepository>().getCachedSettings();
              final settings = settingsState.maybeWhen(
                loaded: (s) => s,
                orElse: () => cachedSettings,
              );

              final String bannerImage = settings?.getSetting('IMAGE_BANNER') ?? '';

              final appTitle =
                  settings?.appTitle.isNotEmpty == true
                      ? settings!.appTitle
                      : activeTenant.name;
              final edicion =
                  settings?.edicion.isNotEmpty == true
                      ? settings!.edicion
                      : '2026';
              final tipoCarrera =
                  settings?.tipoCarrera.isNotEmpty == true
                      ? settings!.tipoCarrera
                      : 'MOUNTAIN BIKE';
               final fechaCarrera =
                   settings?.fechaCarrera.isNotEmpty == true
                       ? settings!.fechaCarrera
                       : '7 de Junio';

              final bool isBikeRace = tipoCarrera.toUpperCase().contains('BIKE') ||
                  tipoCarrera.toUpperCase().contains('CICLI') ||
                  tipoCarrera.toUpperCase().contains('MTB');
              final IconData sportIcon = isBikeRace 
                  ? Icons.directions_bike_rounded 
                  : Icons.directions_run_rounded;

               final isVisibleSos =
                  settings != null
                      ? settings.getSetting('ISVISIBLE_SOS') == 'TRUE'
                      : activeTenant.enableLiveTracking;

              final isEnabledSosSetting =
                  settings != null
                      ? settings.getSetting('ISENABLED_SOS') == 'TRUE'
                      : activeTenant.enableLiveTracking;

              bool isRaceDay = false;
              if (settings != null) {
                final tsStr = settings.fechaCarreraTs;
                if (tsStr.isNotEmpty) {
                  final ts = int.tryParse(tsStr);
                  if (ts != null) {
                    final milliseconds = tsStr.length == 10 ? ts * 1000 : ts;
                    final raceDate = DateTime.fromMillisecondsSinceEpoch(
                      milliseconds,
                    );
                    final now = DateTime.now();
                    isRaceDay =
                        now.year == raceDate.year &&
                        now.month == raceDate.month &&
                        now.day == raceDate.day;
                  }
                }
              }

              return Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (bannerImage.isNotEmpty) ...[
                      DynamicHeroBanner(
                        imageUrl: bannerImage,
                        tipoCarrera: tipoCarrera,
                        edicion: edicion,
                        appTitle: appTitle,
                        activeTenant: activeTenant,
                      ),
                      const SizedBox(height: 20),
                    ],

                    if (_linkedParticipant != null) ...[
                      _buildRunnerPassCard(activeTenant),
                      const SizedBox(height: 20),
                    ],

                    // 2. Next Event & Countdown section
                    AppCard(
                      style: AppCardStyle.gradient,
                      customGradient: LinearGradient(
                        colors: [
                          activeTenant.primaryColorRef.withValues(alpha: 0.85),
                          (activeTenant.secondaryColorRef.computeLuminance() > 0.15)
                              ? const Color(0xFF1E1E1E)
                              : activeTenant.secondaryColorRef.withValues(alpha: 0.95),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      child: isRaceDay
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'EDICIÓN EN CURSO ($edicion)',
                                            style: TextStyle(
                                              color: Colors.white.withValues(
                                                alpha: 0.7,
                                              ),
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          const Text(
                                            'Evento en Marcha',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(
                                      sportIcon,
                                      color: activeTenant.accentColorRef,
                                      size: 28,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.4),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: activeTenant.accentColorRef.withValues(alpha: 0.3),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.redAccent.withValues(alpha: 0.6),
                                              blurRadius: 8,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '¡EL EVENTO ESTÁ EN MARCHA!',
                                        style: TextStyle(
                                          color: activeTenant.accentColorRef,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Cuenta Regresiva',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'Cronómetro Oficial',
                                            style: TextStyle(
                                              color: activeTenant.accentColorRef,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(
                                      sportIcon,
                                      color: activeTenant.accentColorRef,
                                      size: 28,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.calendar_today_rounded,
                                      color: activeTenant.accentColorRef,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'FECHA DEL EVENTO: $fechaCarrera',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildCountdownBlock(
                                      _timeLeft.inDays.toString(),
                                      'DÍAS',
                                      activeTenant,
                                    ),
                                    _buildCountdownDivider(activeTenant),
                                    _buildCountdownBlock(
                                      (_timeLeft.inHours.remainder(
                                        24,
                                      )).toString().padLeft(2, '0'),
                                      'HORAS',
                                      activeTenant,
                                    ),
                                    _buildCountdownDivider(activeTenant),
                                    _buildCountdownBlock(
                                      (_timeLeft.inMinutes.remainder(
                                        60,
                                      )).toString().padLeft(2, '0'),
                                      'MINUTOS',
                                      activeTenant,
                                    ),
                                  ],
                                ),
                                if (_linkedParticipant == null) ...[
                                  const SizedBox(height: 24),
                                  AppButton(
                                    text: 'Ver Inscripción',
                                    onPressed: () => context.go('/inscripciones'),
                                    type: AppButtonType.outlined,
                                    borderColor: activeTenant.primaryColorRef.computeLuminance() < 0.15
                                        ? activeTenant.accentColorRef
                                        : activeTenant.primaryColorRef,
                                    textColor: activeTenant.primaryColorRef.computeLuminance() < 0.15
                                        ? activeTenant.accentColorRef
                                        : activeTenant.primaryColorRef,
                                  ),
                                ],
                              ],
                            ),
                    ),
                    const SizedBox(height: 20),

                    // 2.2. Quick Actions Grid
                    _buildQuickActionsGrid(activeTenant),
                    const SizedBox(height: 20),

                    // 3. Context-sensitive SOS and Quick Actions
                    if (isVisibleSos) ...[
                      AppCard(
                        style: AppCardStyle.glassmorphic,
                        customBorder: Border.all(
                          color: Colors.redAccent.withValues(alpha: 0.3),
                          width: 1.5,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.redAccent,
                                  size: 28,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Acción Crítica SOS',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Presiona el botón para enviar coordenadas de rescate en tiempo real a la organización.',
                                        style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 11,
                                        ),
                                      ),
                                      if (!isRaceDay) ...[
                                        const SizedBox(height: 4),
                                        Text(
                                          'Disponible únicamente el día de la carrera ($fechaCarrera).',
                                          style: TextStyle(
                                            color: activeTenant.accentColorRef
                                                .withValues(alpha: 0.8),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            AppButton(
                              text: 'ENVIAR ALERTA SOS',
                              textColor: isEnabledSosSetting && isRaceDay ? Colors.white : null,
                              onPressed:
                                  isEnabledSosSetting && isRaceDay
                                      ? () => _showSosConfirmDialog(context)
                                      : null,
                              icon: Icons.emergency_share_rounded,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // 2.5. Weather Advisory Card
                    _buildWeatherAdvisoryCard(activeTenant, settings),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  ignoring: true,
                  child: AnimatedOpacity(
                    opacity: _showScrollIndicator ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: activeTenant.accentColorRef.withValues(alpha: 0.5),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: activeTenant.accentColorRef.withValues(alpha: 0.25),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'MÁS INFORMACIÓN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              Icons.keyboard_double_arrow_down_rounded,
                              color: activeTenant.accentColorRef,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
            },
          ),
        ),
      ),
    );
  }

  Future<Position?> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return null;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 6),
        ),
      );
    } catch (_) {
      try {
        return await Geolocator.getLastKnownPosition();
      } catch (_) {
        return null;
      }
    }
  }

  Future<void> _fetchWeather(double lat, double lng) async {
    if (!mounted) return;
    setState(() {
      _isLoadingWeather = true;
    });

    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.open-meteo.com/v1/forecast',
        queryParameters: {
          'latitude': lat,
          'longitude': lng,
          'current': 'temperature_2m,weather_code,wind_speed_10m',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final current = response.data['current'];
        if (current != null && mounted) {
          setState(() {
            _weatherTempBase = (current['temperature_2m'] as num?)?.toDouble();
            _weatherCodeBase = (current['weather_code'] as num?)?.toInt() ?? 0;
            _weatherWindBase = (current['wind_speed_10m'] as num?)?.toDouble();
            _isLoadingWeather = false;
          });
          return;
        }
      }
    } catch (e) {
      debugPrint('Error fetching weather data: $e');
    }

    if (mounted) {
      setState(() {
        _isLoadingWeather = false;
      });
    }
  }

  void _loadWeatherForSettings(EventSettings settings) {
    final lat = settings.latLargada ?? -26.824;
    final lon = settings.lonLargada ?? -65.221;
    _fetchWeather(lat, lon);
  }

  Map<String, dynamic> _getWeatherInfo(int code) {
    if (code == 0) {
      return {
        'desc': 'Despejado',
        'icon': Icons.wb_sunny_rounded,
        'color': Colors.amber,
      };
    } else if (code >= 1 && code <= 3) {
      return {
        'desc': 'Algo Nublado',
        'icon': Icons.cloud_queue_rounded,
        'color': Colors.blueGrey,
      };
    } else if (code == 45 || code == 48) {
      return {
        'desc': 'Niebla',
        'icon': Icons.blur_on_rounded,
        'color': Colors.grey,
      };
    } else if ((code >= 51 && code <= 57) || (code >= 80 && code <= 82)) {
      return {
        'desc': 'Llovizna',
        'icon': Icons.umbrella_rounded,
        'color': Colors.lightBlue,
      };
    } else if (code >= 61 && code <= 67) {
      return {
        'desc': 'Lluvia',
        'icon': Icons.grain_rounded,
        'color': Colors.blue,
      };
    } else if ((code >= 71 && code <= 77) || (code >= 85 && code <= 86)) {
      return {
        'desc': 'Nieve',
        'icon': Icons.ac_unit_rounded,
        'color': Colors.lightBlueAccent,
      };
    } else if (code >= 95) {
      return {
        'desc': 'Tormenta',
        'icon': Icons.thunderstorm_rounded,
        'color': Colors.deepPurpleAccent,
      };
    }
    return {
      'desc': 'Despejado',
      'icon': Icons.wb_sunny_rounded,
      'color': Colors.amber,
    };
  }

  void _showSosConfirmDialog(BuildContext context) {
    final activeTenant = _tenantManager.value;
    bool isFetchingLocation = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return BlocProvider<EmergencyBloc>.value(
              value: _emergencyBloc,
              child: AlertDialog(
                backgroundColor: activeTenant.backgroundColorRef,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.redAccent.withValues(alpha: 0.2)),
                ),
                title: Row(
                  children: const [
                    Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Confirmar Emergencia',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                content: const Text(
                  '¿Estás seguro de que deseas enviar una alerta de rescate SOS? Esto compartirá tu ubicación GPS actual con el equipo médico de la organización.',
                  style: TextStyle(color: Colors.white70),
                ),
                actions: [
                  TextButton(
                    onPressed: isFetchingLocation ? null : () => Navigator.pop(dialogContext),
                    child: const Text(
                      'CANCELAR',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: isFetchingLocation
                        ? null
                        : () async {
                            setDialogState(() {
                              isFetchingLocation = true;
                            });

                            final position = await _getCurrentLocation();
                            
                            // Default fallback coordinates if fetching fails
                            String lat = '-34.6037';
                            String lng = '-58.3816';

                            if (position != null) {
                              lat = position.latitude.toString();
                              lng = position.longitude.toString();
                            } else {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'No se pudo obtener la ubicación GPS precisa. Se enviaron coordenadas predeterminadas de emergencia.',
                                    ),
                                    backgroundColor: Colors.orange,
                                  ),
                                );
                              }
                            }

                            _emergencyBloc.add(
                              EmergencyEvent.sendSos(
                                partiId: 'parti_demo_1',
                                eventoId: '1',
                                orgId: '1',
                                latitud: lat,
                                longitud: lng,
                              ),
                            );

                            if (dialogContext.mounted) {
                              Navigator.pop(dialogContext);
                            }
                          },
                    child: isFetchingLocation
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            'ENVIAR SOS',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _launchURL(String urlString) async {
    if (urlString.isEmpty) return;
    final uri = Uri.parse(urlString);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No se pudo abrir la página de pago.'),
            ),
          );
        }
      }
    }
  }

  Widget _buildRunnerPassCard(TenantConfig activeTenant) {
    if (_linkedParticipant == null) return const SizedBox.shrink();

    final detail = _linkedParticipant!;
    final bool hasPlate = detail.nroPlaca.isNotEmpty && detail.nroPlaca != '0';
    final bool hasPendingPayment = !hasPlate && detail.linkPago.isNotEmpty;

    return AppCard(
      style: AppCardStyle.gradient,
      padding: EdgeInsets.zero,
      customGradient: LinearGradient(
        colors: [
          activeTenant.primaryColorRef,
          activeTenant.secondaryColorRef,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: InkWell(
        onTap: () => context.go('/inscripciones'),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.badge_outlined,
                        color: activeTenant.accentColorRef,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'TARJETA DE CORREDOR',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: hasPlate ? Colors.greenAccent : Colors.amberAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          hasPlate ? 'INSCRIPCIÓN ACTIVA' : 'PAGO PENDIENTE',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detail.fullName.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        if (detail.circuito.isNotEmpty)
                          Row(
                            children: [
                              Icon(
                                Icons.route_outlined,
                                color: activeTenant.accentColorRef,
                                size: 14,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  'Circuito: ${detail.circuito}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 4),
                        if (detail.categoria.isNotEmpty)
                          Row(
                            children: [
                              Icon(
                                Icons.emoji_events_outlined,
                                color: activeTenant.accentColorRef,
                                size: 14,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  'Categoría: ${detail.categoria}',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        if (detail.largada.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.play_circle_outline_rounded,
                                color: activeTenant.accentColorRef,
                                size: 14,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  'Largada: ${detail.largada}',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Dorsal Box
                  if (hasPlate)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            activeTenant.name.toLowerCase().contains('21k')
                                ? 'DORSAL'
                                : 'PLACA',
                            style: TextStyle(
                              color: activeTenant.primaryColorRef,
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            detail.nroPlaca,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (hasPendingPayment) ...[
            const SizedBox(height: 14),
            const Divider(color: Colors.white24, height: 1),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => _launchURL(detail.linkPago),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.amberAccent.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.amberAccent.withValues(alpha: 0.5),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.payment_rounded,
                      color: Colors.amberAccent,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Pago Pendiente. Toca aquí para abonar.',
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.amberAccent,
                      size: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    ),
  ),
);
}

  Widget _buildQuickActionsGrid(TenantConfig activeTenant) {
    final items = [
      _QuickActionItem(
        icon: Icons.badge_outlined,
        label: 'Mi Ficha',
        description: 'Tus datos de carrera',
        onTap: () => context.go('/inscripciones'),
      ),
      _QuickActionItem(
        icon: Icons.map_outlined,
        label: 'Circuitos',
        description: 'Mapas e información',
        onTap: () => context.go('/mapas'),
      ),
      _QuickActionItem(
        icon: Icons.sensors_rounded,
        label: 'En Vivo',
        description: 'Seguimiento y crono',
        onTap: () => context.go('/vivo'),
      ),
      _QuickActionItem(
        icon: Icons.info_outline_rounded,
        label: 'Ayuda',
        description: 'Contacto y reglamento',
        onTap: () => context.go('/mas'),
      ),
    ];

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: items.map((item) {
        return AppCard(
          style: AppCardStyle.glassmorphic,
          padding: EdgeInsets.zero,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: item.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: activeTenant.primaryColorRef.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      item.icon,
                      color: activeTenant.accentColorRef,
                      size: 20,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.description,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 10,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCountdownBlock(String value, String label, TenantConfig tenant) {
    return Container(
      width: 75,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: tenant.primaryColorRef.withValues(alpha: 0.25),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: tenant.primaryColorRef.withValues(alpha: 0.05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              color: tenant.accentColorRef,
              fontSize: 26,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 9,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownDivider(TenantConfig tenant) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        ':',
        style: TextStyle(
          color: tenant.primaryColorRef.withValues(alpha: 0.6),
          fontSize: 28,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _buildWeatherAdvisoryCard(TenantConfig activeTenant, EventSettings? settings) {
    final String tipoCarrera = settings?.tipoCarrera ?? 'MOUNTAIN BIKE';
    final bool isMountainRace = tipoCarrera.toUpperCase().contains('TRAIL') ||
        tipoCarrera.toUpperCase().contains('MOUNTAIN') ||
        tipoCarrera.toUpperCase().contains('MTB') ||
        tipoCarrera.toUpperCase().contains('AVENTURA') ||
        tipoCarrera.toUpperCase().contains('DESAFÍO');

    return AppCard(
      style: AppCardStyle.glassmorphic,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.wb_sunny_outlined,
                color: activeTenant.accentColorRef,
                size: 22,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Clima & Equipamiento',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_isLoadingWeather)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: CircularProgressIndicator.adaptive(),
              ),
            )
          else if (_weatherTempBase == null)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  'No se pudo cargar la información del clima.',
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
              ),
            )
          else ...[
            Builder(
              builder: (context) {
                final baseTemp = _weatherTempBase ?? 0.0;
                final baseWind = _weatherWindBase ?? 0.0;
                
                final baseInfo = _getWeatherInfo(_weatherCodeBase);
                
                final summitTemp = baseTemp - 10.0;
                final summitWind = baseWind * 2.5;
                final summitInfo = summitWind > 30 
                    ? {
                        'desc': 'Viento Fuerte',
                        'icon': Icons.air_rounded,
                        'color': Colors.lightBlueAccent,
                      }
                    : baseInfo;
                
                final arrivalTemp = baseTemp + 1.0;
                final arrivalInfo = baseInfo;

                if (!isMountainRace) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildWeatherMetricItem(
                        title: 'TEMPERATURA',
                        temp: '${baseTemp.toStringAsFixed(1)}°C',
                        desc: baseInfo['desc'] as String,
                        icon: baseInfo['icon'] as IconData,
                        iconColor: baseInfo['color'] as Color,
                      ),
                      _buildWeatherMetricDivider(),
                      _buildWeatherMetricItem(
                        title: 'VIENTO',
                        temp: '${baseWind.toStringAsFixed(1)} km/h',
                        desc: _getWindDescription(baseWind),
                        icon: Icons.air_rounded,
                        iconColor: Colors.blueGrey.shade300,
                      ),
                    ],
                  );
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildWeatherMetricItem(
                      title: 'BASE (LARGADA)',
                      temp: '${baseTemp.toStringAsFixed(1)}°C',
                      desc: baseInfo['desc'] as String,
                      icon: baseInfo['icon'] as IconData,
                      iconColor: baseInfo['color'] as Color,
                    ),
                    _buildWeatherMetricDivider(),
                    _buildWeatherMetricItem(
                      title: 'CUMBRE',
                      temp: '${summitTemp.toStringAsFixed(1)}°C',
                      desc: summitInfo['desc'] as String,
                      icon: summitInfo['icon'] as IconData,
                      iconColor: summitInfo['color'] as Color,
                    ),
                    _buildWeatherMetricDivider(),
                    _buildWeatherMetricItem(
                      title: 'LLEGADA',
                      temp: '${arrivalTemp.toStringAsFixed(1)}°C',
                      desc: arrivalInfo['desc'] as String,
                      icon: arrivalInfo['icon'] as IconData,
                      iconColor: arrivalInfo['color'] as Color,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 18),
            const Divider(color: Colors.white10, height: 1),
            const SizedBox(height: 14),
            Builder(
              builder: (context) {
                final baseTemp = _weatherTempBase ?? 0.0;
                final baseWind = _weatherWindBase ?? 0.0;
                final summitTemp = baseTemp - 10.0;
                final summitWind = baseWind * 2.5;

                IconData warningIcon = Icons.info_outline_rounded;
                Color warningColor = Colors.grey;
                String warningMsg = '';
                
                if (isMountainRace) {
                  warningMsg = 'Clima templado en cumbre. Equipamiento estándar sugerido.';
                  if (summitWind > 30 || summitTemp < 10) {
                    warningIcon = Icons.warning_amber_rounded;
                    warningColor = Colors.orangeAccent;
                    warningMsg = 'Alerta en Cumbre: Viento de ${summitWind.toStringAsFixed(0)} km/h a ${summitTemp.toStringAsFixed(1)}°C. Rompevientos obligatorio.';
                  } else if (summitTemp < 5) {
                    warningIcon = Icons.ac_unit_rounded;
                    warningColor = Colors.lightBlueAccent;
                    warningMsg = 'Alerta en Cumbre: Temperatura muy baja (${summitTemp.toStringAsFixed(1)}°C). Abrigarse con capas adicionales.';
                  }
                } else {
                  warningMsg = 'Clima agradable para correr. ¡Disfruta de la carrera!';
                  if (baseTemp > 30) {
                    warningIcon = Icons.warning_amber_rounded;
                    warningColor = Colors.orangeAccent;
                    warningMsg = 'Alerta de Calor: Temperatura elevada (${baseTemp.toStringAsFixed(1)}°C). Correr a ritmo controlado y priorizar hidratación.';
                  } else if (baseTemp < 8) {
                    warningIcon = Icons.ac_unit_rounded;
                    warningColor = Colors.lightBlueAccent;
                    warningMsg = 'Alerta de Frío: Temperatura baja (${baseTemp.toStringAsFixed(1)}°C). Se recomienda precalentamiento prolongado y abrigo liviano.';
                  } else if (_weatherCodeBase >= 51 && _weatherCodeBase <= 67) {
                    warningIcon = Icons.umbrella_rounded;
                    warningColor = Colors.lightBlue;
                    warningMsg = 'Pronóstico de Lluvia: Se sugiere rompevientos impermeable y calzado con buena tracción.';
                  } else if (_weatherCodeBase >= 95) {
                    warningIcon = Icons.thunderstorm_rounded;
                    warningColor = Colors.deepPurpleAccent;
                    warningMsg = 'Alerta de Tormenta: Precaución en el circuito por posibles calzadas resbaladizas o tormentas eléctricas.';
                  }
                }

                String uvMsg = 'Índice UV: Moderado. Se recomienda uso de protector solar.';
                Color uvColor = Colors.amber;
                if (_weatherCodeBase == 0 || _weatherCodeBase == 1) {
                  if (baseTemp > 22) {
                    uvMsg = 'Índice UV: Muy Alto. Llevar protector solar, gorra y anteojos.';
                    uvColor = Colors.orangeAccent;
                  } else {
                    uvMsg = 'Índice UV: Alto. Llevar protector solar y anteojos.';
                  }
                }

                String hydrationMsg = 'Hidratación: Clima templado. Llevar mínimo 1.5L de líquido.';
                Color hydrationColor = Colors.blueAccent;
                if (baseTemp > 25) {
                  hydrationMsg = 'Hidratación: Temperatura elevada (${baseTemp.toStringAsFixed(1)}°C). Llevar mínimo 2.0L de líquido y sales.';
                  hydrationColor = Colors.orange;
                } else if (baseTemp < 10) {
                  hydrationMsg = 'Hidratación: Clima frío. Llevar mínimo 1.0L de líquido templado.';
                  hydrationColor = Colors.lightBlue;
                }

                return Column(
                  children: [
                    _buildWeatherAdvisoryRow(
                      icon: warningIcon,
                      iconColor: warningColor,
                      message: warningMsg,
                    ),
                    const SizedBox(height: 8),
                    _buildWeatherAdvisoryRow(
                      icon: Icons.wb_sunny_rounded,
                      iconColor: uvColor,
                      message: uvMsg,
                    ),
                    const SizedBox(height: 8),
                    _buildWeatherAdvisoryRow(
                      icon: Icons.water_drop_rounded,
                      iconColor: hydrationColor,
                      message: hydrationMsg,
                    ),
                  ],
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  String _getWindDescription(double speed) {
    if (speed < 10) return 'Calma';
    if (speed < 20) return 'Brisa leve';
    if (speed < 30) return 'Viento mod.';
    return 'Viento fuerte';
  }

  Widget _buildWeatherMetricItem({
    required String title,
    required String temp,
    required String desc,
    required IconData icon,
    required Color iconColor,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 9,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            temp,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            desc,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherMetricDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white10,
    );
  }

  Widget _buildWeatherAdvisoryRow({
    required IconData icon,
    required Color iconColor,
    required String message,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}

class DynamicHeroBanner extends StatefulWidget {
  final String imageUrl;
  final String tipoCarrera;
  final String edicion;
  final String appTitle;
  final dynamic activeTenant;

  const DynamicHeroBanner({
    super.key,
    required this.imageUrl,
    required this.tipoCarrera,
    required this.edicion,
    required this.appTitle,
    required this.activeTenant,
  });

  @override
  State<DynamicHeroBanner> createState() => _DynamicHeroBannerState();
}

class _DynamicHeroBannerState extends State<DynamicHeroBanner> {
  double? _aspectRatio;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _resolveImage();
  }

  @override
  void didUpdateWidget(covariant DynamicHeroBanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _resolveImage();
    }
  }

  void _resolveImage() {
    if (widget.imageUrl.isEmpty) {
      setState(() {
        _loading = false;
        _aspectRatio = null;
      });
      return;
    }
    setState(() {
      _loading = true;
    });
    final ImageStream stream = NetworkImage(widget.imageUrl).resolve(ImageConfiguration.empty);
    late ImageStreamListener listener;
    listener = ImageStreamListener(
      (ImageInfo info, bool _) {
        if (mounted) {
          setState(() {
            _aspectRatio = info.image.width / info.image.height;
            _loading = false;
          });
        }
        stream.removeListener(listener);
      },
      onError: (exception, stackTrace) {
        if (mounted) {
          setState(() {
            _loading = false;
          });
        }
        stream.removeListener(listener);
      },
    );
    stream.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrl.isEmpty) return const SizedBox.shrink();

    if (_loading) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 220,
          color: Colors.white.withValues(alpha: 0.05),
          child: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      );
    }

    final double aspectRatio = _aspectRatio ?? 1.64;
    final bool isWide = aspectRatio > 2.0;

    if (isWide) {
      return Container(
        height: 160,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              widget.activeTenant.secondaryColorRef.withValues(alpha: 0.95),
              widget.activeTenant.secondaryColorRef.withValues(alpha: 0.75),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: widget.activeTenant.primaryColorRef.withValues(alpha: 0.15),
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top part: Dynamic Aspect Ratio Banner Image
              // Since height is determined by AspectRatio, the image is rendered with ZERO cropping or stretching!
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: Colors.white.withValues(alpha: 0.05),
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  },
                ),
              ),
              // Bottom part: Thematic Details Info Card
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: widget.activeTenant.primaryColorRef,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              widget.tipoCarrera,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          Text(
                            'Edición ${widget.edicion}',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.appTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      // Proportional/Recommended Banner Layout: Fully immersive covered image
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.network(
              widget.imageUrl,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Container(
                  height: 220,
                  color: Colors.white.withValues(alpha: 0.05),
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              },
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.8),
                      Colors.black.withValues(alpha: 0.2),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: widget.activeTenant.primaryColorRef,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      widget.tipoCarrera,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Edición ${widget.edicion} - Inscripciones Abiertas',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.appTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _QuickActionItem {
  final IconData icon;
  final String label;
  final String description;
  final VoidCallback onTap;

  _QuickActionItem({
    required this.icon,
    required this.label,
    required this.description,
    required this.onTap,
  });
}

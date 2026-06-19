import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_config.dart';
import '../../../../core/theme/tenant_manager.dart';
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
  Duration _timeLeft = const Duration(days: 12, hours: 8, minutes: 43, seconds: 12);
  int? _raceTimestamp;

  @override
  void initState() {
    super.initState();
    _contentBloc = getIt<ContentBloc>();
    _emergencyBloc = getIt<EmergencyBloc>();
    _settingsBloc = getIt<SettingsBloc>();

    // Try to load cached settings instantly to avoid countdown jump
    final cached = getIt<SettingsRepository>().getCachedSettings();
    if (cached != null) {
      final tsStr = cached.fechaCarreraTs;
      if (tsStr.isNotEmpty) {
        final parsedTs = int.tryParse(tsStr);
        if (parsedTs != null) {
          _raceTimestamp = tsStr.length == 10 ? parsedTs * 1000 : parsedTs;
          final difference = DateTime.fromMillisecondsSinceEpoch(_raceTimestamp!).difference(DateTime.now());
          _timeLeft = difference.inSeconds > 0 ? difference : Duration.zero;
        }
      }
    }

    // Load active event content and settings
    _loadEventContent();
    _settingsBloc.add(const SettingsEvent.getSettings(eventId: '1', idOrg: '1'));

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
            final raceDate = DateTime.fromMillisecondsSinceEpoch(_raceTimestamp!);
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
  }

  void _loadEventContent() {
    _contentBloc.add(const ContentEvent.getEventContent(
      eventId: '1',
      idOrg: '1',
    ));
  }

  void _onTenantChanged() {
    _loadEventContent();
    _settingsBloc.add(const SettingsEvent.getSettings(eventId: '1', idOrg: '1'));
    setState(() {});
  }

  @override
  void dispose() {
    _tenantManager.removeListener(_onTenantChanged);
    _countdownTimer.cancel();
    _settingsBloc.close();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;

    // List of banner graphics according to the organization/tenant ID
    final String bannerImage = activeTenant.id == 'velo_mtb'
        ? 'https://images.unsplash.com/photo-1544192240-4a34feb0104a?w=800&q=80'
        : activeTenant.id == 'patagonia_trail'
            ? 'https://images.unsplash.com/photo-1551632879-6dfc301c3490?w=800&q=80'
            : 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?w=800&q=80';

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
                        content: const Text('¡Señal de Emergencia SOS enviada con éxito!'),
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
                  },
                  orElse: () {},
                );
              },
            ),
          ],
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, settingsState) {
              final settings = settingsState.maybeWhen(
                loaded: (s) => s,
                orElse: () => null,
              );

              final appTitle = settings?.appTitle.isNotEmpty == true ? settings!.appTitle : activeTenant.name;
              final edicion = settings?.edicion.isNotEmpty == true ? settings!.edicion : '2026';
              final tipoCarrera = settings?.tipoCarrera.isNotEmpty == true ? settings!.tipoCarrera : 'MOUNTAIN BIKE';
              final fechaCarrera = settings?.fechaCarrera.isNotEmpty == true ? settings!.fechaCarrera : '7 de Junio';

              final isVisibleSos = settings != null
                  ? settings.getSetting('ISVISIBLE_SOS') == 'TRUE'
                  : activeTenant.enableLiveTracking;

              final isEnabledSosSetting = settings != null
                  ? settings.getSetting('ISENABLED_SOS') == 'TRUE'
                  : activeTenant.enableLiveTracking;

              bool isRaceDay = false;
              if (settings != null) {
                final tsStr = settings.fechaCarreraTs;
                if (tsStr.isNotEmpty) {
                  final ts = int.tryParse(tsStr);
                  if (ts != null) {
                    final milliseconds = tsStr.length == 10 ? ts * 1000 : ts;
                    final raceDate = DateTime.fromMillisecondsSinceEpoch(milliseconds);
                    final now = DateTime.now();
                    isRaceDay = now.year == raceDate.year &&
                                now.month == raceDate.month &&
                                now.day == raceDate.day;
                  }
                }
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Dynamic Hero Banner Carousel with premium dark overlay
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Image.network(
                            bannerImage,
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return Container(
                                height: 220,
                                color: Colors.white.withValues(alpha: 0.05),
                                child: const Center(child: CircularProgressIndicator.adaptive()),
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
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: activeTenant.primaryColorRef,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    tipoCarrera,
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
                                  'Edición $edicion - Inscripciones Abiertas',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.8),
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  appTitle,
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
                    ),
                    const SizedBox(height: 20),

                    // 2. Next Event & Countdown section
                    AppCard(
                      style: AppCardStyle.gradient,
                      child: Column(
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
                                      'PRÓXIMA EDICIÓN ($edicion)',
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.7),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      appTitle,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      tipoCarrera,
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
                                Icons.timer_outlined,
                                color: activeTenant.accentColorRef,
                                size: 28,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today_rounded, color: activeTenant.accentColorRef, size: 16),
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
                              _buildCountdownBlock(_timeLeft.inDays.toString(), 'DÍAS', activeTenant),
                              _buildCountdownDivider(activeTenant),
                              _buildCountdownBlock((_timeLeft.inHours.remainder(24)).toString().padLeft(2, '0'), 'HORAS', activeTenant),
                              _buildCountdownDivider(activeTenant),
                              _buildCountdownBlock((_timeLeft.inMinutes.remainder(60)).toString().padLeft(2, '0'), 'MINUTOS', activeTenant),
                            ],
                          ),
                          const SizedBox(height: 24),
                          AppButton(
                            text: 'Ver Inscripción',
                            onPressed: () => context.go('/inscripciones'),
                            type: AppButtonType.outlined,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 3. Context-sensitive SOS and Quick Actions
                    if (isVisibleSos) ...[
                      AppCard(
                        style: AppCardStyle.glassmorphic,
                        customBorder: Border.all(color: Colors.redAccent.withValues(alpha: 0.3), width: 1.5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 28),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                        style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                                      ),
                                      if (!isRaceDay) ...[
                                        const SizedBox(height: 4),
                                        Text(
                                          'Disponible únicamente el día de la carrera ($fechaCarrera).',
                                          style: TextStyle(
                                            color: activeTenant.accentColorRef.withValues(alpha: 0.8),
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
                              onPressed: isEnabledSosSetting && isRaceDay
                                  ? () => _showSosConfirmDialog(context)
                                  : null,
                              icon: Icons.emergency_share_rounded,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showSosConfirmDialog(BuildContext context) {
    final activeTenant = _tenantManager.value;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return BlocProvider<EmergencyBloc>.value(
          value: _emergencyBloc,
          child: AlertDialog(
            backgroundColor: activeTenant.backgroundColorRef,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.redAccent.withValues(alpha: 0.2)),
            ),
            title: const Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
                SizedBox(width: 10),
                Text('Confirmar Emergencia', style: TextStyle(color: Colors.white)),
              ],
            ),
            content: const Text(
              '¿Estás seguro de que deseas enviar una alerta de rescate SOS? Esto compartirá tu ubicación GPS actual con el equipo médico de la organización.',
              style: TextStyle(color: Colors.white70),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('CANCELAR', style: TextStyle(color: Colors.grey)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                onPressed: () {
                  _emergencyBloc.add(const EmergencyEvent.sendSos(
                    partiId: 'parti_demo_1',
                    eventoId: '1',
                    orgId: '1',
                    latitud: '-34.6037',
                    longitud: '-58.3816',
                  ));
                  Navigator.pop(dialogContext);
                },
                child: const Text('ENVIAR SOS', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
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
}

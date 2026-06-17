import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../../content/presentation/bloc/content_bloc.dart';
import '../../../content/presentation/bloc/content_event.dart';
import '../../../content/presentation/bloc/content_state.dart';
import '../../../emergency/presentation/bloc/emergency_bloc.dart';
import '../../../emergency/presentation/bloc/emergency_event.dart';
import '../../../emergency/presentation/bloc/emergency_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();

  late final ContentBloc _contentBloc;
  late final EmergencyBloc _emergencyBloc;

  // Countdown timer parameters
  late Timer _countdownTimer;
  Duration _timeLeft = const Duration(days: 12, hours: 8, minutes: 43, seconds: 12);

  @override
  void initState() {
    super.initState();
    _contentBloc = getIt<ContentBloc>();
    _emergencyBloc = getIt<EmergencyBloc>();

    // Load active event content
    _loadEventContent();

    // Dynamically rebuild when tenant configuration changes
    _tenantManager.addListener(_onTenantChanged);

    // Run countdown update loop
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_timeLeft.inSeconds > 0) {
            _timeLeft = _timeLeft - const Duration(seconds: 1);
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
    setState(() {});
  }

  @override
  void dispose() {
    _tenantManager.removeListener(_onTenantChanged);
    _countdownTimer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final days = duration.inDays;
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '${days}d : ${hours}h : ${minutes}m : ${seconds}s';
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;
    final theme = Theme.of(context);

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
      ],
      child: Scaffold(
        backgroundColor: activeTenant.backgroundColorRef,
        body: BlocListener<EmergencyBloc, EmergencyState>(
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
          child: SingleChildScrollView(
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
                                activeTenant.id.toUpperCase(),
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
                              'Edición 2026 - Inscripciones Abiertas',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.8),
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              activeTenant.name,
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PRÓXIMA LARGA',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Cruce Andino 80K',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.timer_outlined,
                            color: activeTenant.accentColorRef,
                            size: 28,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                        ),
                        child: Center(
                          child: Text(
                            _formatDuration(_timeLeft),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Courier',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppButton(
                        text: 'Ver Detalles de Categorías',
                        onPressed: () => context.go('/inscripciones'),
                        type: AppButtonType.outlined,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 3. Dynamic News Section
                Text(
                  'Últimas Novedades',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final isFirst = index == 0;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: AppCard(
                        style: AppCardStyle.glassmorphic,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 80,
                                height: 80,
                                color: Colors.white.withValues(alpha: 0.05),
                                child: Icon(
                                  isFirst ? Icons.notifications_active_rounded : Icons.info_outline,
                                  color: activeTenant.primaryColorRef,
                                  size: 30,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isFirst ? '¡Entrega de Kits e Inscripción!' : 'Charlas técnicas online',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    isFirst
                                        ? 'Presentarse en el polideportivo principal con DNI original y deslinde impreso.'
                                        : 'Únete a la charla técnica en vivo de las rutas el viernes a las 18:00hs.',
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 12,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),

                // 4. Dynamic Markdown Content Bloc integration
                BlocBuilder<ContentBloc, ContentState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => Container(
                        padding: const EdgeInsets.all(20),
                        child: const Center(child: CircularProgressIndicator.adaptive()),
                      ),
                      loaded: (content) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Información del Circuito',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 10),
                            AppCard(
                              style: AppCardStyle.normal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.description_outlined, color: activeTenant.primaryColorRef),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'Reglamento Oficial',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    content.title.isNotEmpty 
                                        ? content.title 
                                        : 'Contenido dinámico para este evento deportivo. Descarga el deslinde obligatorio y repasa el equipamiento sugerido.',
                                    style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 14,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // 5. Context-sensitive SOS and Quick Actions
                if (activeTenant.enableLiveTracking) ...[
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
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        AppButton(
                          text: 'ENVIAR ALERTA SOS',
                          onPressed: () => _showSosConfirmDialog(context),
                          icon: Icons.emergency_share_rounded,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ],
            ),
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
}

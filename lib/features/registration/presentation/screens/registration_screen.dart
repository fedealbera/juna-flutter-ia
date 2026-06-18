import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_config.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../../../shared/design_system/text_fields/app_text_field.dart';
import '../../../notifications/presentation/bloc/notifications_bloc.dart';
import '../../../notifications/presentation/bloc/notifications_event.dart';
import '../../../notifications/presentation/bloc/notifications_state.dart';
import '../../../participant/presentation/bloc/participant_bloc.dart';
import '../../../participant/presentation/bloc/participant_event.dart';
import '../../../participant/presentation/bloc/participant_state.dart';
import '../../../settings/domain/repositories/settings_repository.dart';
import '../bloc/registration_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> with SingleTickerProviderStateMixin {
  final TenantManager _tenantManager = getIt<TenantManager>();

  late TabController _tabController;
  late final ParticipantBloc _participantBloc;
  late final RegistrationBloc _registrationBloc;
  late final NotificationsBloc _notificationsBloc;

  // Search input controllers
  final TextEditingController _dniController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _participantBloc = getIt<ParticipantBloc>();
    _registrationBloc = getIt<RegistrationBloc>();
    _notificationsBloc = getIt<NotificationsBloc>();

    _tenantManager.addListener(_onTenantChanged);
  }

  void _onTenantChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _tenantManager.removeListener(_onTenantChanged);
    _tabController.dispose();
    _dniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;

    return MultiBlocProvider(
      providers: [
        BlocProvider<ParticipantBloc>.value(value: _participantBloc),
        BlocProvider<RegistrationBloc>.value(value: _registrationBloc),
        BlocProvider<NotificationsBloc>.value(value: _notificationsBloc),
      ],
      child: Scaffold(
        backgroundColor: activeTenant.backgroundColorRef,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: activeTenant.primaryColorRef,
            labelColor: activeTenant.primaryColorRef,
            unselectedLabelColor: Colors.grey.shade400,
            tabs: const [
              Tab(text: 'NUEVA INSCRIPCIÓN', icon: Icon(Icons.add_task_rounded)),
              Tab(text: 'VER PARTICIPANTE', icon: Icon(Icons.badge_outlined)),
            ],
          ),
        ),
        body: BlocListener<NotificationsBloc, NotificationsState>(
          listener: (context, state) {
            state.maybeWhen(
              registered: (res) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Token Push registrado con éxito en Firebase.'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              error: (msg) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error de Token Push: $msg'), backgroundColor: Colors.red),
                );
              },
              orElse: () {},
            );
          },
          child: TabBarView(
            controller: _tabController,
            children: [
              // Tab 1: New Registration
              RegistrationWebView(activeTenant: activeTenant),
              // Tab 2: View / Lookups
              _buildViewLookupTab(activeTenant),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildViewLookupTab(TenantConfig activeTenant) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Buscar Corredor',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Verifica tu estado de inscripción, vincula tu cuenta, o conecta tu chip deportivo.',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: AppTextField(
                  label: 'DNI / Pasaporte',
                  hint: 'Ingresa DNI del corredor',
                  prefixIcon: Icons.search_rounded,
                  controller: _dniController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 100,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: activeTenant.primaryColorRef,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if (_dniController.text.isNotEmpty) {
                      _participantBloc.add(ParticipantEvent.getDetail(
                        dni: _dniController.text,
                        idOrg: '1',
                        eventoId: '1',
                      ));
                    }
                  },
                  child: const Text('Buscar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<ParticipantBloc, ParticipantState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator.adaptive()),
                detailLoaded: (detail) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppCard(
                        style: AppCardStyle.glassmorphic,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  detail.name.isNotEmpty ? detail.name : 'Corredor Encontrado',
                                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.green.withValues(alpha: 0.4)),
                                  ),
                                  child: const Text(
                                    'PAGO CONFIRMADO',
                                    style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Divider(color: Colors.white.withValues(alpha: 0.1)),
                            const SizedBox(height: 8),
                            _buildInfoRow('Documento:', detail.dni.isNotEmpty ? detail.dni : _dniController.text),
                            _buildInfoRow('Chip Asociado:', 'Acreditación Pendiente'),
                            _buildInfoRow('Categoría:', 'General 80K Caballeros A'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Acciones Disponibles',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      AppButton(
                        text: 'Vincular DNI a este Dispositivo',
                        icon: Icons.link_rounded,
                        onPressed: () {
                          _participantBloc.add(ParticipantEvent.authenticate(
                            dni: detail.dni.isNotEmpty ? detail.dni : _dniController.text,
                            idEvento: '1',
                            idOrg: '1',
                            token: 'token_dispositivo_demo_123',
                          ));
                        },
                        type: AppButtonType.primary,
                      ),
                      const SizedBox(height: 12),
                      AppButton(
                        text: 'Asociar Dispositivo / Chip',
                        icon: Icons.bluetooth_searching_rounded,
                        onPressed: () => _showDeviceScanDialog(context),
                        type: AppButtonType.outlined,
                      ),
                      const SizedBox(height: 12),
                      AppButton(
                        text: 'Registrar Push Token FCM',
                        icon: Icons.notification_add_rounded,
                        onPressed: () {
                          _notificationsBloc.add(NotificationsEvent.registerToken(
                            documento: detail.dni.isNotEmpty ? detail.dni : _dniController.text,
                            idEvento: '1',
                            idOrg: '1',
                            token: 'fcm_token_device_sync_mock',
                          ));
                        },
                        type: AppButtonType.outlined,
                      ),
                    ],
                  );
                },
                error: (msg) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'No se encontraron registros para ese DNI en este evento.',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  );
                },
                orElse: () => Container(
                  padding: const EdgeInsets.all(32),
                  child: const Center(
                    child: Text(
                      'Ingresa un DNI para buscar registros de participación.',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  void _showDeviceScanDialog(BuildContext context) {
    final activeTenant = _tenantManager.value;
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: activeTenant.backgroundColorRef,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: activeTenant.primaryColorRef.withValues(alpha: 0.2)),
              ),
              title: const Text('Escaneando Dispositivo/Chip', style: TextStyle(color: Colors.white)),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  CircularProgressIndicator.adaptive(),
                  SizedBox(height: 24),
                  Text(
                    'Buscando wearables, sensores Garmin, polar bands o chips RFID por Bluetooth...',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('CANCELAR', style: TextStyle(color: Colors.grey)),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class RegistrationWebView extends StatefulWidget {
  final TenantConfig activeTenant;

  const RegistrationWebView({
    super.key,
    required this.activeTenant,
  });

  @override
  State<RegistrationWebView> createState() => _RegistrationWebViewState();
}

class _RegistrationWebViewState extends State<RegistrationWebView>
    with AutomaticKeepAliveClientMixin {
  late final WebViewController _controller;
  bool _isLoading = true;
  double _loadingProgress = 0.0;
  String? _url;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    final cachedSettings = getIt<SettingsRepository>().getCachedSettings();
    final urlString = cachedSettings?.urlInscripciones ?? 'https://juna.net.ar/desafio2026/';
    _url = urlString;

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (mounted) {
              setState(() {
                _loadingProgress = progress / 100.0;
              });
            }
          },
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
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("WebView error: ${error.description}");
          },
        ),
      )
      ..loadRequest(Uri.parse(urlString));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_url == null || _url!.isEmpty) {
      return const Center(
        child: Text(
          'Error: No se pudo cargar la URL de inscripciones.',
          style: TextStyle(color: Colors.redAccent, fontSize: 16),
        ),
      );
    }

    return Stack(
      children: [
        WebViewWidget(controller: _controller),
        if (_isLoading)
          Container(
            color: widget.activeTenant.backgroundColorRef,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      widget.activeTenant.primaryColorRef,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Cargando inscripciones...',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (_isLoading && _loadingProgress > 0 && _loadingProgress < 1.0)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 3,
            child: LinearProgressIndicator(
              value: _loadingProgress,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.activeTenant.primaryColorRef,
              ),
            ),
          ),
      ],
    );
  }
}

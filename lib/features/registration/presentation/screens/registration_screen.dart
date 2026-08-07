import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../../shared/design_system/dialogs/app_dialog.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_config.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../../../shared/design_system/text_fields/app_text_field.dart';
import '../../../notifications/presentation/bloc/notifications_bloc.dart';
import '../../../notifications/presentation/bloc/notifications_event.dart';
import '../../../notifications/presentation/bloc/notifications_state.dart';
import '../../../participant/presentation/bloc/participant_bloc.dart';
import '../../../participant/presentation/bloc/participant_event.dart';
import '../../../participant/domain/entities/participant_detail.dart';
import '../../../participant/presentation/bloc/participant_state.dart';
import '../../../../core/storage/hive_service.dart';
import '../../../settings/domain/repositories/settings_repository.dart';
import '../bloc/registration_bloc.dart';
import '../bloc/registration_event.dart';
import '../bloc/registration_state.dart';

class RegistrationScreen extends StatefulWidget {
  final int? initialTab;
  const RegistrationScreen({super.key, this.initialTab});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final TenantManager _tenantManager = getIt<TenantManager>();

  late TabController _tabController;
  late final ParticipantBloc _participantBloc;
  late final RegistrationBloc _registrationBloc;
  late final NotificationsBloc _notificationsBloc;

  // Search input controllers
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _discountCodeController = TextEditingController();
  final FocusNode _dniFocusNode = FocusNode();

  // Scroll parameters for visual indicator in Profile tab
  final ScrollController _profileScrollController = ScrollController();
  bool _showProfileScrollIndicator = true;

  // Animation for the scroll-down indicator
  late final AnimationController _bounceController;
  late final Animation<double> _bounceAnimation;

  ParticipantDetail? _linkedParticipant;
  bool _checkingCache = true;
  bool _isValidatingDiscountCode = false;
  bool? _isDiscountCodeValid;
  String? _discountCodeErrorMessage;
  String? _discountCodeSuccessMessage;
  bool _verificandoPago = false;
  final bool _isCheckingKitAuth = false;
  int _previousTabIndex = 0;
  bool _shouldSkipRefresh = false;
  bool _yoRetiroKitLocal = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTab ?? 0,
    );
    _tabController.addListener(_handleTabSelection);
    _participantBloc = getIt<ParticipantBloc>();
    _registrationBloc = getIt<RegistrationBloc>();
    _notificationsBloc = getIt<NotificationsBloc>();

    _tenantManager.addListener(_onTenantChanged);
    _loadLinkedParticipant();

    _profileScrollController.addListener(() {
      if (_profileScrollController.hasClients) {
        if (_profileScrollController.offset > 30 && _showProfileScrollIndicator) {
          setState(() {
            _showProfileScrollIndicator = false;
          });
        } else if (_profileScrollController.offset <= 30 && !_showProfileScrollIndicator) {
          setState(() {
            _showProfileScrollIndicator = true;
          });
        }
      }
    });

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: 0.0, end: 6.0).animate(
      CurvedAnimation(
        parent: _bounceController,
        curve: Curves.easeInOut,
      ),
    );
  }

  Future<void> _loadLinkedParticipant() async {
    final hiveService = getIt<HiveService>();
    final Map? cachedJson = await hiveService.get<Map>(
      'participant_box',
      'cached_participant',
    );
    if (cachedJson != null) {
      if (mounted) {
        setState(() {
          final detail = ParticipantDetail(cachedJson.cast<String, dynamic>());
          _linkedParticipant = detail;
          _discountCodeController.text = detail.insCodDesc;
          _checkingCache = false;
          _tabController.index = 1;
          _checkLocalKitStatus(detail.id);
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _checkingCache = false;
        });
      }
    }
  }

  Future<void> _checkLocalKitStatus(String participantId) async {
    if (participantId.isEmpty) return;
    try {
      final hiveService = getIt<HiveService>();
      final status = await hiveService.get<bool>(
        'kit_box',
        'yo_retiro_kit_$participantId',
      );
      if (mounted) {
        setState(() {
          _yoRetiroKitLocal = status ?? false;
        });
      }
    } catch (e) {
      debugPrint('Error al obtener estado local del kit: $e');
    }
  }

  void _onTenantChanged() {
    setState(() {});
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

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tenantManager.removeListener(_onTenantChanged);
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    _profileScrollController.dispose();
    _bounceController.dispose();
    _dniController.dispose();
    _discountCodeController.dispose();
    _dniFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final p = _linkedParticipant;
      if (p != null && p.nroPlaca == '0') {
        _verificarPagoServidor();
      }
    }
  }

  void _verificarPagoServidor() {
    final detail = _linkedParticipant;
    if (detail == null) return;

    if (mounted) {
      setState(() {
        _verificandoPago = true;
      });
    }

    _participantBloc.add(
      ParticipantEvent.getDetail(
        dni: detail.dni.isNotEmpty ? detail.dni : _dniController.text,
        idOrg: '1',
        eventoId: '1',
        roundId: '1',
      ),
    );
  }

  void _handleTabSelection() {
    if (_tabController.index == 1 && !_tabController.indexIsChanging) {
      if (_tabController.index != _previousTabIndex) {
        if (_shouldSkipRefresh) {
          _shouldSkipRefresh = false;
        } else {
          _refreshParticipantIfLinked();
        }
      }
    }
    _previousTabIndex = _tabController.index;
  }

  void _refreshParticipantIfLinked() {
    final detail = _linkedParticipant;
    if (detail == null) return;

    _participantBloc.add(
      ParticipantEvent.getDetail(
        dni: detail.dni.isNotEmpty ? detail.dni : _dniController.text,
        idOrg: '1',
        eventoId: '1',
        roundId: '1',
      ),
    );
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
            tabs: [
              const Tab(
                text: 'NUEVA INSCRIPCIÓN',
                icon: Icon(Icons.add_task_rounded),
              ),
              Tab(
                text: _linkedParticipant != null ? 'MI PERFIL' : 'INICIAR SESIÓN',
                icon: Icon(
                  _linkedParticipant != null ? Icons.person_outline : Icons.badge_outlined,
                ),
              ),
            ],
          ),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<NotificationsBloc, NotificationsState>(
              listener: (context, state) {
                state.maybeWhen(
                  registered: (res) {
                    // Token registered successfully in background
                  },
                  error: (msg) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error de Token Push: $msg'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  orElse: () {},
                );
              },
            ),
            BlocListener<ParticipantBloc, ParticipantState>(
              listener: (context, state) {
                state.maybeWhen(
                  detailLoaded: (detail) async {
                    await getIt<HiveService>().put<Map>(
                      'participant_box',
                      'cached_participant',
                      detail.rawJson,
                    );
                    if (mounted) {
                      setState(() {
                        _linkedParticipant = detail;
                        _discountCodeController.text = detail.insCodDesc;
                        _isDiscountCodeValid = null;
                        _discountCodeErrorMessage = null;
                        _verificandoPago = false;
                        _shouldSkipRefresh = true;
                        _tabController.index = 1;
                      });
                      _checkLocalKitStatus(detail.id);
                    }

                    try {
                      final token = await FirebaseMessaging.instance.getToken();
                      if (token != null && token.isNotEmpty) {
                        _notificationsBloc.add(
                          NotificationsEvent.registerToken(
                            documento: detail.dni,
                            idEvento: '1',
                            idOrg: '1',
                            token: token,
                          ),
                        );
                      } else {
                        debugPrint('FCM Token returned null or empty');
                      }
                    } catch (e) {
                      debugPrint('Error getting Firebase token: $e');
                    }
                  },
                  error: (msg) {
                    if (mounted) {
                      setState(() {
                        _verificandoPago = false;
                      });
                    }
                  },
                  orElse: () {},
                );
              },
            ),
            BlocListener<RegistrationBloc, RegistrationState>(
              listener: (context, state) {
                state.maybeWhen(
                  loading: () {
                    if (mounted) {
                      setState(() {
                        _isValidatingDiscountCode = true;
                        _isDiscountCodeValid = null;
                        _discountCodeSuccessMessage = null;
                      });
                    }
                  },
                  discountValidated: (result) {
                    final json = result.rawJson;
                    final dispoCod = json['dispo_cod'] as String?;
                    final isVigente = dispoCod == 'VIGENTE';

                    if (mounted) {
                      setState(() {
                        _isValidatingDiscountCode = false;
                        _isDiscountCodeValid = isVigente;
                        if (!isVigente) {
                          _discountCodeErrorMessage = json['dispo_msg'] as String? ?? 'Código no validado';
                        } else {
                          _discountCodeSuccessMessage = 'Código de descuento válido';
                        }
                      });
                    }

                    if (isVigente) {
                      final inicio = json['locd_fecha_inicio'] as String? ?? '';
                      final fin = json['locd_fecha_fin'] as String? ?? '';
                      AppAlertDialog.show(
                        context: context,
                        type: AppDialogType.success,
                        title: 'Código Confirmado',
                        message: 'El código fue confirmado y tiene fecha vigente desde $inicio hasta $fin.',
                        primaryButtonText: 'ACEPTAR',
                      ).then((_) {
                        if (mounted) {
                          setState(() {
                            _discountCodeSuccessMessage = 'Disponible hasta $fin';
                          });
                        }
                      });
                    } else {
                      final errorMsg = json['dispo_msg'] as String? ?? 'Código no validado';
                      AppAlertDialog.show(
                        context: context,
                        type: AppDialogType.error,
                        title: 'Código No Validado',
                        message: errorMsg,
                        primaryButtonText: 'ACEPTAR',
                      );
                    }
                  },
                  error: (msg) {
                    if (mounted) {
                      setState(() {
                        _isValidatingDiscountCode = false;
                        _isDiscountCodeValid = false;
                        _discountCodeErrorMessage = msg;
                      });
                    }
                  },
                  orElse: () {},
                );
              },
            ),
          ],
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
    if (_checkingCache) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    if (_linkedParticipant != null) {
      final cachedSettings = getIt<SettingsRepository>().getCachedSettings();
      final fechaAcreditacion =
          cachedSettings?.getSetting('FECHA_ACREDITACION') ?? '5 y 6 de Junio';
      final detail = _linkedParticipant!;

      return Stack(
        children: [
          SingleChildScrollView(
            controller: _profileScrollController,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Corredor Vinculado',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildParticipantCard(
                  detail,
                  fechaAcreditacion,
                  activeTenant,
                ),
                if (detail.nroPlaca == '0') ...[
                  const SizedBox(height: 16),
                  _buildDiscountCodeSection(detail, activeTenant),
                ],
                const SizedBox(height: 24),
                if (detail.nroPlaca == '0') ...[
                  AppButton(
                    text: _verificandoPago ? 'VERIFICANDO PAGO...' : 'PAGAR',
                    textColor: Colors.white,
                    icon: _verificandoPago ? Icons.sync : Icons.payment_rounded,
                    onPressed: _verificandoPago
                        ? null
                        : () {
                            if (detail.linkPago.isNotEmpty) {
                              _launchURL(detail.linkPago);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'No hay link de pago disponible para este participante.',
                                  ),
                                ),
                              );
                            }
                          },
                  ),
                  if (!_verificandoPago) ...[
                    const SizedBox(height: 8),
                    TextButton.icon(
                      icon: Icon(Icons.refresh, size: 16, color: activeTenant.primaryColorRef),
                      label: Text(
                        '¿Ya pagaste? Verificar estado',
                        style: TextStyle(
                          color: activeTenant.primaryColorRef,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _verificarPagoServidor,
                    ),
                  ],
                ] else ...[
                  AppButton(
                    text: 'ENVIAR CERTIFICADO',
                    textColor: Colors.white,
                    icon: Icons.description_rounded,
                    onPressed: () {
                      context.push('/inscripciones/documentacion', extra: detail);
                    },
                  ),
                  const SizedBox(height: 12),
                  if (_yoRetiroKitLocal) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.green.withValues(alpha: 0.4),
                          width: 1.2,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle_rounded,
                            color: Colors.green,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Retiro personal confirmado',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Confirmaste que retirarás el kit personalmente.',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: _isCheckingKitAuth
                                ? null
                                : () => _handleKitAuthorization(detail),
                            child: Text(
                              'CAMBIAR',
                              style: TextStyle(
                                color: activeTenant.primaryColorRef,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    AppButton(
                      text: 'RETIRAR KIT',
                      textColor: Colors.white,
                      icon: Icons.assignment_turned_in_rounded,
                      isLoading: _isCheckingKitAuth,
                      onPressed: _isCheckingKitAuth
                          ? null
                          : () => _handleKitAuthorization(detail),
                    ),
                  ],
                ],
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        text: 'DESVINCULAR',
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () async {
                          final confirm = await AppAlertDialog.show<bool>(
                            context: context,
                            type: AppDialogType.danger,
                            title: '¿Desvincular corredor?',
                            message: '¿Estás seguro de que deseas desvincular este corredor de la aplicación?',
                            secondaryButtonText: 'CANCELAR',
                            primaryButtonText: 'DESVINCULAR',
                            primaryButtonColor: Colors.red,
                          );
                          if (confirm != true) return;

                          await getIt<HiveService>().delete<Map>(
                            'participant_box',
                            'cached_participant',
                          );
                          _dniController.clear();
                          if (mounted) {
                            setState(() {
                              _linkedParticipant = null;
                              _discountCodeController.clear();
                              _isDiscountCodeValid = null;
                              _discountCodeErrorMessage = null;
                            });
                            _dniFocusNode.requestFocus();
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppButton(
                        text: 'EDITAR DATOS',
                        color: activeTenant.primaryColorRef,
                        textColor: Colors.white,
                        onPressed: () async {
                          final result = await context.push<bool>(
                            '/inscripciones/editar-datos',
                            extra: detail,
                          );
                          if (result == true) {
                            _participantBloc.add(
                              ParticipantEvent.getDetail(
                                dni:
                                    detail.dni.isNotEmpty
                                        ? detail.dni
                                        : _dniController.text,
                                idOrg: '1',
                                eventoId: '1',
                                roundId: '1',
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: IgnorePointer(
              ignoring: !_showProfileScrollIndicator,
              child: AnimatedOpacity(
                opacity: _showProfileScrollIndicator ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_profileScrollController.hasClients) {
                        final maxScroll = _profileScrollController.position.maxScrollExtent;
                        final target = (_profileScrollController.offset + 250.0).clamp(0.0, maxScroll);
                        _profileScrollController.animateTo(
                          target,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
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
                          const Text(
                            'DESLIZA PARA VER MÁS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                          const SizedBox(width: 6),
                          AnimatedBuilder(
                            animation: _bounceAnimation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0.0, _bounceAnimation.value),
                                child: child,
                              );
                            },
                            child: Icon(
                              Icons.keyboard_double_arrow_down_rounded,
                              color: activeTenant.accentColorRef,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Buscar Corredor',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Verifica tu estado de inscripción o vincula tu cuenta.',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: AppTextField(
                  label: '',
                  hint: 'Ingresa DNI del corredor',
                  prefixIcon: Icons.search_rounded,
                  controller: _dniController,
                  focusNode: _dniFocusNode,
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (_) {
                    if (_dniController.text.isNotEmpty) {
                      _participantBloc.add(
                        ParticipantEvent.getDetail(
                          dni: _dniController.text,
                          idOrg: '1',
                          eventoId: '1',
                          roundId: '1',
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 100,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: activeTenant.primaryColorRef,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_dniController.text.isNotEmpty) {
                      _participantBloc.add(
                        ParticipantEvent.getDetail(
                          dni: _dniController.text,
                          idOrg: '1',
                          eventoId: '1',
                          roundId: '1',
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Buscar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<ParticipantBloc, ParticipantState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading:
                    () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
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
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantCard(
    ParticipantDetail detail,
    String fechaAcreditacion,
    TenantConfig activeTenant,
  ) {
    final bool isPreInscripto = detail.nroPlaca == '0';

    return AppCard(
      style: AppCardStyle.glassmorphic,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail.fullName.isNotEmpty
                          ? detail.fullName
                          : 'Corredor Encontrado',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (!isPreInscripto)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.green.withValues(alpha: 0.5),
                            width: 1.2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check_circle_rounded,
                              color: Colors.green,
                              size: 14,
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'PAGO CONFIRMADO',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.orange.withValues(alpha: 0.5),
                            width: 1.2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.info_rounded,
                              color: Colors.orange,
                              size: 14,
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'PRE-INSCRIPTO',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              if (!isPreInscripto) ...[
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: activeTenant.primaryColorRef,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: activeTenant.primaryColorRef.withValues(
                          alpha: 0.3,
                        ),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        activeTenant.name.toLowerCase().contains('21k')
                            ? 'DORSAL'
                            : 'PLACA',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        detail.nroPlaca.isNotEmpty ? detail.nroPlaca : '---',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.white.withValues(alpha: 0.1)),
          const SizedBox(height: 8),
          _buildInfoRow(
            'Nombre:',
            detail.fullName.isNotEmpty ? detail.fullName : 'No especificado',
          ),
          _buildInfoRow(
            'DNI:',
            detail.dni.isNotEmpty ? detail.dni : _dniController.text,
          ),
          _buildInfoRow(
            'Circuito:',
            detail.circuito.isNotEmpty ? detail.circuito : 'No especificado',
          ),
          _buildInfoRow(
            'Categoría:',
            detail.categoria.isNotEmpty ? detail.categoria : 'No especificado',
          ),
          _buildInfoRow(
            'Hora de Agrupamiento:',
            detail.agrupamiento.isNotEmpty
                ? detail.agrupamiento
                : 'No especificado',
          ),
          _buildInfoRow(
            'Largada:',
            detail.largada.isNotEmpty ? detail.largada : 'No especificado',
          ),
          if (activeTenant.tenantId == 2) ...[
            _buildInfoColumn(
              'Grupo de Entrenamiento:',
              detail.grupoEntrenamiento.isNotEmpty
                  ? detail.grupoEntrenamiento
                  : 'No especificado',
            ),
            _buildInfoColumn(
              'Centro de Acreditación:',
              detail.centroAcreditacion.isNotEmpty
                  ? detail.centroAcreditacion
                  : 'No especificado',
            ),
            _buildInfoRow(
              'Marca de Zapatillas:',
              detail.marcaZapatillas.isNotEmpty
                  ? detail.marcaZapatillas
                  : 'No especificado',
            ),
          ],
          if (detail.articulos.isNotEmpty) ...[
            const SizedBox(height: 16),
            Divider(color: Colors.white.withValues(alpha: 0.1)),
            const SizedBox(height: 8),
            const Text(
              'Artículos Adicionales:',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...detail.articulos.map(
              (art) => Padding(
                padding: const EdgeInsets.only(left: 4.0, bottom: 6.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: activeTenant.primaryColorRef,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      art,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '* Estos artículos se entregan durante la acreditación.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
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
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountCodeSection(
    ParticipantDetail detail,
    TenantConfig activeTenant,
  ) {
    return AppCard(
      style: AppCardStyle.glassmorphic,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.confirmation_number_outlined,
                color: activeTenant.primaryColorRef,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Código de Descuento',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: AppTextField(
                  controller: _discountCodeController,
                  hint: 'Ingresa tu código de descuento',
                  enabled: !_isValidatingDiscountCode,
                  onChanged: (val) {
                    if (_isDiscountCodeValid != null) {
                      setState(() {
                        _isDiscountCodeValid = null;
                        _discountCodeErrorMessage = null;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: activeTenant.primaryColorRef,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: _isValidatingDiscountCode
                      ? null
                      : () => _validateDiscountCode(detail.id),
                  child:
                      _isValidatingDiscountCode
                          ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                          : const Text(
                            'Validar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                ),
              ),
            ],
          ),
          if (_isDiscountCodeValid != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    _isDiscountCodeValid!
                        ? Colors.green.withValues(alpha: 0.1)
                        : Colors.redAccent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color:
                      _isDiscountCodeValid!
                          ? Colors.green.withValues(alpha: 0.4)
                          : Colors.redAccent.withValues(alpha: 0.4),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _isDiscountCodeValid!
                        ? Icons.check_circle_rounded
                        : Icons.error_rounded,
                    color:
                        _isDiscountCodeValid! ? Colors.green : Colors.redAccent,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _isDiscountCodeValid!
                          ? (_discountCodeSuccessMessage ?? 'Código de descuento válido')
                          : (_discountCodeErrorMessage ?? 'Código inválido'),
                      style: TextStyle(
                        color:
                            _isDiscountCodeValid!
                                ? Colors.green
                                : Colors.redAccent,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _validateDiscountCode(String insId) {
    final code = _discountCodeController.text.trim();
    if (code.isEmpty) {
      setState(() {
        _isDiscountCodeValid = false;
        _discountCodeErrorMessage = 'El código no puede estar vacío';
      });
      return;
    }

    _registrationBloc.add(
      RegistrationEvent.validateDiscount(
        insId: insId,
        code: code,
      ),
    );
  }

  void _handleKitAuthorization(ParticipantDetail detail) {
    context.push('/inscripciones/autorizar-kit', extra: detail).then((_) {
      _checkLocalKitStatus(detail.id);
    });
  }
}

class RegistrationWebView extends StatefulWidget {
  final TenantConfig activeTenant;

  const RegistrationWebView({super.key, required this.activeTenant});

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
    final urlString =
        cachedSettings?.urlInscripciones ?? 'https://juna.net.ar/desafio2026/';
    _url = urlString;

    _controller =
        WebViewController()
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
        WebViewWidget(
          controller: _controller,
          gestureRecognizers: {
            Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ),
            Factory<HorizontalDragGestureRecognizer>(
              () => HorizontalDragGestureRecognizer(),
            ),
          },
        ),
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

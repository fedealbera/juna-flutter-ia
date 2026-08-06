import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/storage/hive_service.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../../shared/design_system/text_fields/app_text_field.dart';
import '../../domain/entities/participant_detail.dart';
import '../../domain/repositories/participant_repository.dart';

class KitAuthorizationScreen extends StatefulWidget {
  final ParticipantDetail participant;

  const KitAuthorizationScreen({
    super.key,
    required this.participant,
  });

  @override
  State<KitAuthorizationScreen> createState() => _KitAuthorizationScreenState();
}

class _KitAuthorizationScreenState extends State<KitAuthorizationScreen> {
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  bool _yoRetiro = false;
  bool _envioAOtro = false;

  @override
  void initState() {
    super.initState();
    _loadLocalKitStatus();
  }

  @override
  void dispose() {
    _dniController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _loadLocalKitStatus() async {
    try {
      final hiveService = getIt<HiveService>();
      final isYoRetiro = await hiveService.get<bool>(
        'kit_box',
        'yo_retiro_kit_${widget.participant.id}',
      );
      if (mounted && isYoRetiro == true) {
        setState(() {
          _yoRetiro = true;
          _envioAOtro = false;
        });
      }
    } catch (_) {
      // Ignorar errores de lectura local
    }
  }

  Future<void> _onSaveYoRetiro() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final hiveService = getIt<HiveService>();
      await hiveService.put<bool>(
        'kit_box',
        'yo_retiro_kit_${widget.participant.id}',
        true,
      );

      if (mounted) {
        context.pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Guardado localmente de forma exitosa'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al guardar localmente: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _onAuthorize() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final repository = getIt<ParticipantRepository>();
        final insId = int.tryParse(widget.participant.insId);

        await repository.authorizeKit(
          dni: widget.participant.dni,
          insId: insId,
          idEvento: '1',
          idOrg: '1',
          autorizadoDni: _dniController.text.trim(),
          autorizadoNombre: _nameController.text.trim(),
        );

        // Limpiar el estado local si se autoriza a otra persona en el backend
        final hiveService = getIt<HiveService>();
        await hiveService.delete<bool>(
          'kit_box',
          'yo_retiro_kit_${widget.participant.id}',
        );

        if (mounted) {
          context.pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Autorización registrada exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al registrar autorización: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = getIt<TenantManager>().value;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Color(0xFF121212)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom AppBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                      onPressed: () => context.pop(),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'RETIRAR KIT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white10, height: 1),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Selecciona una opción para el retiro de tu kit:',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Card 1: Yo retiro el kit
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _yoRetiro = !_yoRetiro;
                              if (_yoRetiro) _envioAOtro = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: _yoRetiro
                                  ? activeTenant.primaryColorRef.withValues(alpha: 0.05)
                                  : Colors.white.withValues(alpha: 0.03),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: _yoRetiro
                                    ? activeTenant.primaryColorRef
                                    : Colors.white10,
                                width: _yoRetiro ? 1.5 : 1.0,
                              ),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _yoRetiro,
                                  activeColor: activeTenant.primaryColorRef,
                                  checkColor: Colors.white,
                                  side: const BorderSide(color: Colors.white30, width: 1.5),
                                  onChanged: (val) {
                                    setState(() {
                                      _yoRetiro = val ?? false;
                                      if (_yoRetiro) _envioAOtro = false;
                                    });
                                  },
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Yo retiro el kit',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Indica que te presentarás personalmente a retirar tu kit en los centros habilitados.',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Card 2: ¿Envías a otra persona?
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _envioAOtro = !_envioAOtro;
                              if (_envioAOtro) _yoRetiro = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: _envioAOtro
                                  ? activeTenant.primaryColorRef.withValues(alpha: 0.05)
                                  : Colors.white.withValues(alpha: 0.03),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: _envioAOtro
                                    ? activeTenant.primaryColorRef
                                    : Colors.white10,
                                width: _envioAOtro ? 1.5 : 1.0,
                              ),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _envioAOtro,
                                      activeColor: activeTenant.primaryColorRef,
                                      checkColor: Colors.white,
                                      side: const BorderSide(color: Colors.white30, width: 1.5),
                                      onChanged: (val) {
                                        setState(() {
                                          _envioAOtro = val ?? false;
                                          if (_envioAOtro) _yoRetiro = false;
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 12),
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '¿Envías a otra persona?',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Autoriza a un tercero a retirar el kit en tu nombre completando sus datos.',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                if (_envioAOtro) ...[
                                  const SizedBox(height: 16),
                                  const Divider(color: Colors.white10, height: 1),
                                  const SizedBox(height: 16),
                                  AppTextField(
                                    label: 'DNI',
                                    hint: 'Ingresa DNI del autorizado',
                                    prefixIcon: Icons.badge_rounded,
                                    controller: _dniController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'El DNI es obligatorio';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  AppTextField(
                                    label: 'Nombre y Apellido',
                                    hint: 'Ingresa nombre y apellido del autorizado',
                                    prefixIcon: Icons.person_rounded,
                                    controller: _nameController,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'El nombre y apellido son obligatorios';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Action Buttons based on selection
                        if (_yoRetiro)
                          AppButton(
                            text: 'ACEPTAR',
                            icon: Icons.check_circle_outline_rounded,
                            textColor: Colors.white,
                            isLoading: _isLoading,
                            onPressed: _isLoading ? null : _onSaveYoRetiro,
                          )
                        else if (_envioAOtro)
                          AppButton(
                            text: 'AUTORIZAR',
                            icon: Icons.check_circle_outline_rounded,
                            textColor: Colors.white,
                            isLoading: _isLoading,
                            onPressed: _isLoading ? null : _onAuthorize,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

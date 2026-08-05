import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
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

  @override
  void dispose() {
    _dniController.dispose();
    _nameController.dispose();
    super.dispose();
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

        if (mounted) {
          context.pop();
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
                      'AUTORIZAR RETIRO',
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
              
              // Form Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.03),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white10, width: 1),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
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
                                hint: 'Ingresa nombre y apellido',
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
                          ),
                        ),
                        const SizedBox(height: 40),
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

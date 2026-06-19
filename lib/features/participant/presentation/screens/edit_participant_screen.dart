import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/text_fields/app_text_field.dart';
import '../../domain/entities/participant_detail.dart';
import '../bloc/participant_bloc.dart';
import '../bloc/participant_event.dart';
import '../bloc/participant_state.dart';

class EditParticipantScreen extends StatefulWidget {
  final ParticipantDetail participant;

  const EditParticipantScreen({
    super.key,
    required this.participant,
  });

  @override
  State<EditParticipantScreen> createState() => _EditParticipantScreenState();
}

class _EditParticipantScreenState extends State<EditParticipantScreen> {
  final ParticipantBloc _participantBloc = getIt<ParticipantBloc>();
  final TenantManager _tenantManager = getIt<TenantManager>();

  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _instagramController;
  late final TextEditingController _emergencyNameController;
  late final TextEditingController _emergencyPhoneController;

  bool _isLoading = false;
  late final bool _hasNoPlaca;

  @override
  void initState() {
    super.initState();
    final p = widget.participant;
    _phoneController = TextEditingController(text: p.contCelular);
    _emailController = TextEditingController(text: p.contEmail);
    _instagramController = TextEditingController(text: p.contInstagram);
    _emergencyNameController = TextEditingController(text: p.contNombre);
    _emergencyPhoneController = TextEditingController(text: p.contTel);

    // Checks if nroPlaca is zero (meaning no plate)
    final placaStr = p.nroPlaca.trim();
    _hasNoPlaca = placaStr == '0' || placaStr.isEmpty || placaStr.toLowerCase() == 'cero';
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    _instagramController.dispose();
    _emergencyNameController.dispose();
    _emergencyPhoneController.dispose();
    _participantBloc.close();
    super.dispose();
  }

  void _onSave() {
    setState(() {
      _isLoading = true;
    });

    // Start with updateContact
    _participantBloc.add(ParticipantEvent.updateContact(
      partiId: widget.participant.id,
      domCiudad: widget.participant.domCiudad.isNotEmpty ? widget.participant.domCiudad : null,
      domCiudadNombre: widget.participant.domCiudadNombre.isNotEmpty ? widget.participant.domCiudadNombre : null,
      domProvincia: widget.participant.domProvincia.isNotEmpty ? widget.participant.domProvincia : null,
      domPais: widget.participant.domPais.isNotEmpty ? widget.participant.domPais : null,
      contInstagram: _instagramController.text,
      contCelular: _phoneController.text,
      contEmail: _emailController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;
    final primaryColor = activeTenant.primaryColorRef;

    return BlocProvider<ParticipantBloc>.value(
      value: _participantBloc,
      child: BlocListener<ParticipantBloc, ParticipantState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () {
              setState(() {
                _isLoading = true;
              });
            },
            contactUpdated: (result) {
              if (_hasNoPlaca) {
                // Done!
                setState(() {
                  _isLoading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Datos de contacto actualizados correctamente'),
                    backgroundColor: Colors.green,
                  ),
                );
                context.pop(true);
              } else {
                // Now update emergency
                _participantBloc.add(ParticipantEvent.updateEmergency(
                  partiId: widget.participant.id,
                  contNombre: _emergencyNameController.text,
                  contTel: _emergencyPhoneController.text,
                ));
              }
            },
            emergencyUpdated: (result) {
              setState(() {
                _isLoading = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Datos actualizados correctamente'),
                  backgroundColor: Colors.green,
                ),
              );
              context.pop(true);
            },
            error: (message) {
              setState(() {
                _isLoading = false;
              });
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.grey[900],
                  title: const Text('Error', style: TextStyle(color: Colors.white)),
                  content: Text(
                    message.contains('Exception:') ? message.replaceFirst('Exception: ', '') : message,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text('Aceptar', style: TextStyle(color: primaryColor)),
                    ),
                  ],
                ),
              );
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Color(0xFF121212)],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      // Custom AppBar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                              onPressed: () => context.pop(false),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'EDITAR DATOS',
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
                      // Form
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Section: Datos de Contacto
                              _buildSectionTitle('DATOS DE CONTACTO', primaryColor),
                              const SizedBox(height: 16),
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
                                      label: 'Teléfono',
                                      hint: 'Ingresa teléfono',
                                      prefixIcon: Icons.phone_android_rounded,
                                      controller: _phoneController,
                                      keyboardType: TextInputType.phone,
                                    ),
                                    const SizedBox(height: 16),
                                    AppTextField(
                                      label: 'Email',
                                      hint: 'Ingresa correo electrónico',
                                      prefixIcon: Icons.email_rounded,
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    const SizedBox(height: 16),
                                    AppTextField(
                                      label: 'Instagram',
                                      hint: 'Ingresa usuario de instagram',
                                      prefixIcon: Icons.camera_alt_rounded,
                                      controller: _instagramController,
                                    ),
                                  ],
                                ),
                              ),
                              if (!_hasNoPlaca) ...[
                                const SizedBox(height: 28),
                                // Section: Contacto de Emergencia
                                _buildSectionTitle('CONTACTOS DE EMERGENCIA', primaryColor),
                                const SizedBox(height: 16),
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
                                        label: 'Nombre de Contacto',
                                        hint: 'Nombre del contacto de emergencia',
                                        prefixIcon: Icons.person_outline_rounded,
                                        controller: _emergencyNameController,
                                      ),
                                      const SizedBox(height: 16),
                                      AppTextField(
                                        label: 'Teléfono de Contacto',
                                        hint: 'Teléfono del contacto de emergencia',
                                        prefixIcon: Icons.phone_enabled_rounded,
                                        controller: _emergencyPhoneController,
                                        keyboardType: TextInputType.phone,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              const SizedBox(height: 40),
                              // General Button
                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                  onPressed: _isLoading ? null : _onSave,
                                  child: const Text(
                                    'Guardar Cambios',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_isLoading)
                    Container(
                      color: Colors.black54,
                      child: Center(
                        child: CircularProgressIndicator(color: primaryColor),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color primaryColor) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}

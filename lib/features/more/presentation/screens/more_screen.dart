import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../../../shared/design_system/text_fields/app_text_field.dart';
import '../../../documents/presentation/bloc/documents_bloc.dart';
import '../../../documents/presentation/bloc/documents_event.dart';
import '../../../documents/presentation/bloc/documents_state.dart';
import '../../../about/presentation/bloc/about_bloc.dart';
import '../../../about/presentation/bloc/about_event.dart';
import '../../../about/presentation/bloc/about_state.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  late final DocumentsBloc _documentsBloc;
  late final AboutBloc _aboutBloc;

  // Contact form fields controllers
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactEmailController = TextEditingController();
  final TextEditingController _contactMsgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _documentsBloc = getIt<DocumentsBloc>();
    _aboutBloc = getIt<AboutBloc>();

    _loadData();
    _tenantManager.addListener(_onTenantChanged);
  }

  void _loadData() {
    final activeTenant = _tenantManager.value;
    _documentsBloc.add(DocumentsEvent.getDocuments(partiId: 'parti_v3_${activeTenant.id}'));
    _aboutBloc.add(const AboutEvent.loadAboutInfo());
  }

  void _onTenantChanged() {
    _loadData();
    setState(() {});
  }

  @override
  void dispose() {
    _tenantManager.removeListener(_onTenantChanged);
    _contactNameController.dispose();
    _contactEmailController.dispose();
    _contactMsgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;
    final theme = Theme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentsBloc>.value(value: _documentsBloc),
        BlocProvider<AboutBloc>.value(value: _aboutBloc),
      ],
      child: Scaffold(
        backgroundColor: activeTenant.backgroundColorRef,
        body: BlocListener<DocumentsBloc, DocumentsState>(
          listener: (context, state) {
            state.maybeWhen(
              uploaded: (res) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Documento/Deslinde cargado con éxito!'),
                    backgroundColor: Colors.green,
                  ),
                );
                // Reload documents list
                _documentsBloc.add(DocumentsEvent.getDocuments(partiId: 'parti_v3_${activeTenant.id}'));
              },
              error: (msg) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error al cargar documento: $msg'), backgroundColor: Colors.red),
                );
              },
              orElse: () {},
            );
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Important Documents Section (using DocumentsBloc)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Documentos y Descargas',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
                    ),
                    IconButton(
                      icon: Icon(Icons.upload_file_rounded, color: activeTenant.primaryColorRef),
                      onPressed: () => _simulateFileUpload(context),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                BlocBuilder<DocumentsBloc, DocumentsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
                      loaded: (files) {
                        if (files.isEmpty) {
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text('No hay archivos cargados.', style: TextStyle(color: Colors.grey)),
                            ),
                          );
                        }
                        return Column(
                          children: files.map((file) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: AppCard(
                                style: AppCardStyle.glassmorphic,
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Icon(Icons.picture_as_pdf_outlined, color: activeTenant.primaryColorRef, size: 28),
                                  title: Text(
                                    file.name.isNotEmpty ? file.name : 'Deslinde Obligatorio.pdf',
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                  subtitle: const Text('Haga clic para descargar / ver', style: TextStyle(color: Colors.grey, fontSize: 11)),
                                  trailing: Icon(Icons.download_for_offline_outlined, color: activeTenant.accentColorRef),
                                  onTap: () {},
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // 2. Contact form section
                Text(
                  'Contacto / Soporte',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
                ),
                const SizedBox(height: 8),
                AppCard(
                  style: AppCardStyle.normal,
                  child: Column(
                    children: [
                      AppTextField(
                        label: 'Nombre completo',
                        hint: 'Ingresa tu nombre',
                        prefixIcon: Icons.person_outline_rounded,
                        controller: _contactNameController,
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        label: 'Correo Electrónico',
                        hint: 'Ingresa tu email',
                        prefixIcon: Icons.email_outlined,
                        controller: _contactEmailController,
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        label: 'Mensaje / Consulta',
                        hint: 'Escribe tu consulta aquí...',
                        prefixIcon: Icons.chat_bubble_outline_rounded,
                        controller: _contactMsgController,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 16),
                      AppButton(
                        text: 'Enviar Mensaje',
                        onPressed: () {
                          if (_contactNameController.text.isNotEmpty && _contactEmailController.text.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('¡Mensaje enviado con éxito! Nos comunicaremos contigo.'), backgroundColor: Colors.green),
                            );
                            _contactNameController.clear();
                            _contactEmailController.clear();
                            _contactMsgController.clear();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 3. Social actions (Share)
                AppButton(
                  text: 'Compartir esta App con amigos',
                  icon: Icons.share_rounded,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: activeTenant.backgroundColorRef,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        title: const Text('Compartir App', style: TextStyle(color: Colors.white)),
                        content: Text('¡Comparte la aplicación de ${activeTenant.name} en tus redes sociales!', style: const TextStyle(color: Colors.white70)),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('CERRAR', style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    );
                  },
                  type: AppButtonType.outlined,
                ),
                const SizedBox(height: 24),

                // 4. Platform Specifications (using AboutBloc)
                BlocBuilder<AboutBloc, AboutState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
                      loaded: (info) {
                        return AppCard(
                          style: AppCardStyle.glassmorphic,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.info_outline, color: activeTenant.primaryColorRef),
                                  const SizedBox(width: 8),
                                  Text(
                                    info.appName,
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Divider(color: Colors.white.withValues(alpha: 0.1)),
                              const SizedBox(height: 8),
                              _buildSpecsRow('Versión de App:', info.appVersion),
                              _buildSpecsRow('Build:', info.buildNumber),
                              _buildSpecsRow('Descripción:', info.platformDescription),
                            ],
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // 5. Logout Action
                AppButton(
                  text: 'Salir / Cerrar Sesión',
                  icon: Icons.logout_rounded,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sesión cerrada correctamente.')),
                    );
                  },
                  type: AppButtonType.outlined,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecsRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  void _simulateFileUpload(BuildContext context) {
    final activeTenant = _tenantManager.value;
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: activeTenant.backgroundColorRef,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Subir Deslinde / Certificado', style: TextStyle(color: Colors.white)),
          content: const Text(
            '¿Desea subir su certificado de aptitud física firmado por su médico de cabecera?',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('CANCELAR', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: activeTenant.primaryColorRef),
              onPressed: () {
                Navigator.pop(dialogContext);
                _documentsBloc.add(DocumentsEvent.uploadDocument(
                  tipo: 'Certificado Medico',
                  partiId: 'parti_v3_${activeTenant.id}',
                  file: File('/mock/path/certificado.pdf'),
                ));
              },
              child: const Text('SELECCIONAR Y SUBIR', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}

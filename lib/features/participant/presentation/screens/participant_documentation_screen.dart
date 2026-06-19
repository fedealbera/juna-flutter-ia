import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../domain/entities/participant_detail.dart';
import '../../domain/repositories/participant_repository.dart';

class ParticipantDocumentationScreen extends StatefulWidget {
  final ParticipantDetail participant;

  const ParticipantDocumentationScreen({
    super.key,
    required this.participant,
  });

  @override
  State<ParticipantDocumentationScreen> createState() => _ParticipantDocumentationScreenState();
}

class _ParticipantDocumentationScreenState extends State<ParticipantDocumentationScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  final ParticipantRepository _repository = getIt<ParticipantRepository>();
  final ImagePicker _picker = ImagePicker();

  bool _isLoading = true;
  bool _isUploading = false;
  String? _errorMessage;
  Map<String, dynamic> _documents = {};

  @override
  void initState() {
    super.initState();
    _loadDocuments();
  }

  Future<void> _loadDocuments() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await _repository.getParticipantDocuments(widget.participant.id);
      if (response['success'] == true && response['archivos'] is Map) {
        setState(() {
          _documents = Map<String, dynamic>.from(response['archivos'] as Map);
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'No se pudo cargar la lista de documentos.';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al conectar con el servidor: $e';
        _isLoading = false;
      });
    }
  }

  String _getDocumentTitle(String key) {
    switch (key) {
      case 'CERTIFICADO_MEDICO':
        return 'Apto médico';
      case 'DESLINDE_RESPONSABILIDAD':
        return 'Deslinde firmado';
      case 'AUTORIZACION_MENORES':
        return 'Autorización Menores';
      default:
        return key.split('_').map((str) {
          if (str.isEmpty) return '';
          return str[0].toUpperCase() + str.substring(1).toLowerCase();
        }).join(' ');
    }
  }

  Future<void> _handleUpload(String docKey) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (image == null) return;

      if (!mounted) return;

      setState(() {
        _isUploading = true;
      });

      final bool isSuccess = await _repository.uploadParticipantDocument(
        partiId: widget.participant.id,
        tipo: docKey,
        filePath: image.path,
      );

      if (!mounted) return;
      setState(() {
        _isUploading = false;
      });

      if (isSuccess) {
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('¡Éxito!'),
            content: const Text('Se subió correctamente el archivo.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );

        setState(() {
          final doc = Map<String, dynamic>.from(_documents[docKey] as Map? ?? {});
          doc['estado'] = 'PE';
          _documents[docKey] = doc;
        });
      } else {
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Ocurrió un error al subir el archivo. Por favor intente nuevamente más tarde.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('Error'),
            content: Text('Error al acceder a la cámara o cargar la imagen: $e'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<void> _viewDocument(String url) async {
    if (url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('El enlace al documento no está disponible.')),
      );
      return;
    }

    final uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No se pudo abrir la imagen del documento.')),
          );
        }
      }
    }
  }

  Widget _buildStatusBadge(String estado) {
    Color color;
    String text;
    IconData icon;

    switch (estado) {
      case 'AP':
        color = Colors.green;
        text = 'Aprobado';
        icon = Icons.check_circle_rounded;
        break;
      case 'PE':
        color = Colors.amber;
        text = 'En Revisión';
        icon = Icons.pending_actions_rounded;
        break;
      case 'OB':
        color = Colors.redAccent;
        text = 'Observado';
        icon = Icons.warning_amber_rounded;
        break;
      case 'SD':
      default:
        color = Colors.grey;
        text = 'Sin Entregar';
        icon = Icons.insert_drive_file_outlined;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 12),
          const SizedBox(width: 4),
          Text(
            text.toUpperCase(),
            style: TextStyle(
              color: color,
              fontSize: 9,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;

    return Scaffold(
      backgroundColor: activeTenant.backgroundColorRef,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Documentación del Corredor',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  activeTenant.primaryColorRef.withValues(alpha: 0.15),
                  activeTenant.secondaryColorRef.withValues(alpha: 0.05),
                  Colors.black,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: _isLoading
                ? const Center(child: CircularProgressIndicator.adaptive())
                : _errorMessage != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 48),
                              const SizedBox(height: 16),
                              Text(
                                _errorMessage!,
                                style: const TextStyle(color: Colors.grey, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              AppButton(
                                text: 'Reintentar',
                                onPressed: _loadDocuments,
                                width: 150,
                              ),
                            ],
                          ),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: _loadDocuments,
                        color: activeTenant.primaryColorRef,
                        backgroundColor: Colors.grey.shade900,
                        child: ListView(
                          padding: const EdgeInsets.all(20.0),
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            AppCard(
                              style: AppCardStyle.glassmorphic,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: activeTenant.primaryColorRef.withValues(alpha: 0.2),
                                    child: Icon(Icons.person_rounded, color: activeTenant.primaryColorRef),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.participant.fullName,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'DNI: ${widget.participant.dni}',
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.6),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'LISTA DE REQUISITOS',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 12),
                            if (_documents.isEmpty)
                              Container(
                                padding: const EdgeInsets.all(32),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Text(
                                    'No se requieren documentos para este corredor.',
                                    style: TextStyle(color: Colors.grey, fontSize: 14),
                                  ),
                                ),
                              )
                            else
                              ..._documents.keys.map((key) {
                                final doc = _documents[key] as Map? ?? {};
                                final String estado = doc['estado']?.toString() ?? 'SD';
                                final String descripcion = doc['descripcion']?.toString() ?? '';
                                final String publicUrl = doc['public']?.toString() ?? '';
                                final String title = _getDocumentTitle(key);

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: AppCard(
                                    style: AppCardStyle.glassmorphic,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                title,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            _buildStatusBadge(estado),
                                          ],
                                        ),
                                        if (estado == 'OB' && descripcion.isNotEmpty) ...[
                                          const SizedBox(height: 12),
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: Colors.redAccent.withValues(alpha: 0.1),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Colors.redAccent.withValues(alpha: 0.25),
                                                width: 1,
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'MOTIVO DEL RECHAZO:',
                                                  style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  descripcion,
                                                  style: TextStyle(
                                                    color: Colors.white.withValues(alpha: 0.8),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            if (estado == 'SD' || estado == 'OB')
                                              AppButton(
                                                text: 'Subir',
                                                icon: Icons.photo_camera_rounded,
                                                onPressed: () => _handleUpload(key),
                                                width: 140,
                                              ),
                                            if (estado == 'AP')
                                              AppButton(
                                                text: 'VER',
                                                icon: Icons.visibility_rounded,
                                                onPressed: () => _viewDocument(publicUrl),
                                                type: AppButtonType.outlined,
                                                width: 120,
                                              ),
                                            if (estado == 'PE')
                                              const Padding(
                                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                                child: Text(
                                                  'En espera de validación...',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          ],
                        ),
                      ),
          ),
          if (_isUploading)
            Container(
              color: Colors.black.withValues(alpha: 0.6),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: activeTenant.primaryColorRef,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Subiendo documento...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

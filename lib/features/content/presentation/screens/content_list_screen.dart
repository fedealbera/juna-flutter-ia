import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../maps/presentation/screens/maps_screen.dart';
import '../bloc/content_bloc.dart';
import '../bloc/content_event.dart';
import '../bloc/content_state.dart';
import 'image_viewer_screen.dart';
import 'video_player_screen.dart';

class ContentListScreen extends StatefulWidget {
  final String title;
  final int tipoContenido;

  const ContentListScreen({
    super.key,
    required this.title,
    required this.tipoContenido,
  });

  @override
  State<ContentListScreen> createState() => _ContentListScreenState();
}

class _ContentListScreenState extends State<ContentListScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  late final ContentBloc _contentBloc;

  @override
  void initState() {
    super.initState();
    _contentBloc = getIt<ContentBloc>();
    _loadContent();
  }

  void _loadContent() {
    _contentBloc.add(ContentEvent.getEventContent(
      eventId: '1',
      idOrg: '1',
    ));
  }

  String _resolveUrl(String link) {
    if (link.isEmpty) return '';
    if (link.startsWith('http://') || link.startsWith('https://')) return link;
    const prefix = '/website/juna.net.ar/site/public_html';
    if (link.startsWith(prefix)) {
      return 'https://juna.net.ar${link.substring(prefix.length)}';
    }
    if (link.startsWith('/')) {
      return 'https://juna.net.ar$link';
    }
    return 'https://juna.net.ar/$link';
  }

  Future<void> _handlePdfLaunch(String relativeUrl) async {
    final absoluteUrl = _resolveUrl(relativeUrl);
    if (absoluteUrl.isEmpty) return;
    final uri = Uri.parse(absoluteUrl);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No se pudo abrir el PDF.')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;

    return BlocProvider<ContentBloc>.value(
      value: _contentBloc,
      child: Scaffold(
        backgroundColor: activeTenant.backgroundColorRef,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded, color: Colors.white),
              onPressed: _loadContent,
            ),
          ],
        ),
        body: Container(
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
          child: BlocBuilder<ContentBloc, ContentState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator.adaptive()),
                loading: () => const Center(child: CircularProgressIndicator.adaptive()),
                error: (message) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error_outline_rounded, color: Colors.redAccent, size: 48),
                        const SizedBox(height: 16),
                        Text(
                          'Error al cargar contenidos:\n$message',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 24),
                        AppButton(
                          text: 'REINTENTAR',
                          textColor: Colors.white,
                          onPressed: _loadContent,
                          width: 160,
                        ),
                      ],
                    ),
                  ),
                ),
                loaded: (content) {
                  final List<dynamic> archivos = content.rawJson['archivos'] ?? [];
                  final filtered = archivos.where((item) {
                    final tc = item['tipoContenido'];
                    final tcInt = int.tryParse(tc?.toString() ?? '');
                    return tcInt == widget.tipoContenido;
                  }).toList();

                  return RefreshIndicator(
                    onRefresh: () async => _loadContent(),
                    color: activeTenant.primaryColorRef,
                    backgroundColor: Colors.grey.shade900,
                    child: filtered.isEmpty
                        ? ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.7,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Glowing Icon Container
                                        Container(
                                          padding: const EdgeInsets.all(24),
                                          decoration: BoxDecoration(
                                            color: activeTenant.primaryColorRef.withValues(alpha: 0.1),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: activeTenant.primaryColorRef.withValues(alpha: 0.25),
                                              width: 2,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: activeTenant.primaryColorRef.withValues(alpha: 0.15),
                                                blurRadius: 24,
                                                spreadRadius: 2,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            widget.tipoContenido == 2
                                                ? Icons.newspaper_rounded
                                                : Icons.info_outline_rounded,
                                            color: activeTenant.primaryColorRef,
                                            size: 64,
                                          ),
                                        ),
                                        const SizedBox(height: 32),
                                        // Title
                                        Text(
                                          (widget.tipoContenido == 2
                                              ? 'Sin novedades por el momento'
                                              : 'Sin información disponible').toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        // Subtitle
                                        Text(
                                          widget.tipoContenido == 2
                                              ? 'Las últimas noticias y anuncios de la carrera aparecerán aquí.'
                                              : 'Reglamentos, cronogramas y accesos importantes se publicarán en esta sección.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white.withValues(alpha: 0.6),
                                            fontSize: 14,
                                            height: 1.5,
                                          ),
                                        ),
                                        const SizedBox(height: 32),
                                        // Action Button
                                        AppButton(
                                          text: 'ACTUALIZAR',
                                          icon: Icons.refresh_rounded,
                                          textColor: Colors.white,
                                          onPressed: _loadContent,
                                          width: 180,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                            itemCount: filtered.length,
                            itemBuilder: (context, index) {
                              final item = filtered[index];
                              final String name = item['nombre']?.toString() ?? 'Sin título';
                              final String desc = item['descripcion']?.toString() ?? '';
                              final String tipo = item['tipoArchivo']?.toString() ?? '';
                              final String link = item['link']?.toString() ?? '';
                              final String extLink = item['extLink']?.toString() ?? '';

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: AppCard(
                                  style: AppCardStyle.glassmorphic,
                                  padding: EdgeInsets.zero,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: () {
                                      final resolvedUrl = _resolveUrl(link);
                                      if (tipo == 'IMG') {
                                        if (extLink.isNotEmpty) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CircuitWebViewScreen(
                                                title: name,
                                                url: _resolveUrl(extLink),
                                              ),
                                            ),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ImageViewerScreen(
                                                title: name,
                                                imageUrl: resolvedUrl,
                                              ),
                                            ),
                                          );
                                        }
                                      } else if (tipo == 'VID') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VideoPlayerScreen(
                                              title: name,
                                              videoUrl: resolvedUrl,
                                            ),
                                          ),
                                        );
                                      } else if (tipo == 'PDF') {
                                        _handlePdfLaunch(link);
                                      } else if (tipo == 'URL') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CircuitWebViewScreen(
                                              title: name,
                                              url: resolvedUrl,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Row(
                                        children: [
                                          // Thumbnail / Media Badge on the Left
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Container(
                                              width: 56,
                                              height: 56,
                                              color: Colors.white.withValues(alpha: 0.05),
                                              child: _buildMediaPreview(tipo, link),
                                            ),
                                          ),
                                          const SizedBox(width: 14),

                                          // Text contents
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  name,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                if (desc.isNotEmpty) ...[
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    desc,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.white.withValues(alpha: 0.5),
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10),

                                          // Play or Open chevron icon indicator
                                          Icon(
                                            tipo == 'VID'
                                                ? Icons.play_arrow_rounded
                                                : Icons.arrow_forward_ios_rounded,
                                            color: Colors.white.withValues(alpha: 0.4),
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMediaPreview(String tipo, String link) {
    if (tipo == 'IMG' && link.isNotEmpty) {
      return Image.network(
        _resolveUrl(link),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.image_rounded,
          color: Colors.white24,
          size: 24,
        ),
      );
    }

    IconData iconData;
    Color iconColor;

    switch (tipo) {
      case 'PDF':
        iconData = Icons.picture_as_pdf_outlined;
        iconColor = Colors.redAccent;
        break;
      case 'VID':
        iconData = Icons.play_circle_outline_rounded;
        iconColor = Colors.blueAccent;
        break;
      case 'URL':
        iconData = Icons.link_rounded;
        iconColor = Colors.tealAccent;
        break;
      default:
        iconData = Icons.description_outlined;
        iconColor = Colors.white54;
    }

    return Icon(
      iconData,
      color: iconColor,
      size: 26,
    );
  }
}

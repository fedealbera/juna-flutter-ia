import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_config.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/buttons/app_button.dart';
import '../../../../shared/design_system/cards/app_card.dart';
import '../../../../shared/design_system/text_fields/app_text_field.dart';
import '../../../social/presentation/bloc/social_bloc.dart';
import '../../../social/presentation/bloc/social_event.dart';
import '../../../social/presentation/bloc/social_state.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> with SingleTickerProviderStateMixin {
  final TenantManager _tenantManager = getIt<TenantManager>();
  late TabController _tabController;
  late final SocialBloc _socialBloc;

  // Search input for results leaderboard
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Mock Leaderboard Data
  final List<Map<String, dynamic>> _mockResults = [
    {'rank': '1', 'name': 'Federico Albera', 'time': '04:12:43', 'category': 'Caballeros 80K A', 'status': 'Finalizado'},
    {'rank': '2', 'name': 'Juan Gomez', 'time': '04:18:12', 'category': 'Caballeros 80K B', 'status': 'Finalizado'},
    {'rank': '3', 'name': 'Sofia Perez', 'time': '04:22:50', 'category': 'Damas 80K A', 'status': 'Finalizado'},
    {'rank': '4', 'name': 'Matias Diaz', 'time': '04:29:10', 'category': 'Caballeros 80K A', 'status': 'En Carrera'},
    {'rank': '5', 'name': 'Camila Luna', 'time': '04:35:15', 'category': 'Damas 80K B', 'status': 'En Carrera'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _socialBloc = getIt<SocialBloc>();
    _loadSocial();

    _tenantManager.addListener(_onTenantChanged);
  }

  void _loadSocial() {
    _socialBloc.add(const SocialEvent.loadSocialLinks());
  }

  void _onTenantChanged() {
    _loadSocial();
    setState(() {});
  }

  @override
  void dispose() {
    _tenantManager.removeListener(_onTenantChanged);
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;
    final theme = Theme.of(context);

    // Filtered list according to search term
    final filteredResults = _mockResults.where((r) {
      return r['name'].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
          r['category'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return BlocProvider<SocialBloc>.value(
      value: _socialBloc,
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
              Tab(text: 'RESULTADOS', icon: Icon(Icons.leaderboard_rounded)),
              Tab(text: 'NOVEDADES', icon: Icon(Icons.feed_outlined)),
              Tab(text: 'SOCIAL', icon: Icon(Icons.share_outlined)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            // Tab 1: Leaderboard results
            _buildResultsTab(activeTenant, theme, filteredResults),
            // Tab 2: Live text updates
            _buildLiveUpdatesTab(activeTenant),
            // Tab 3: Social channels integrations
            _buildSocialTab(activeTenant, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsTab(TenantConfig activeTenant, ThemeData theme, List<Map<String, dynamic>> results) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AppTextField(
            label: 'Buscar Corredor / Categoría',
            hint: 'Escribe nombre o categoría...',
            prefixIcon: Icons.search_rounded,
            controller: _searchController,
            onChanged: (val) {
              setState(() {
                _searchQuery = val;
              });
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final item = results[index];
                final isFinished = item['status'] == 'Finalizado';
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: AppCard(
                    style: AppCardStyle.glassmorphic,
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: activeTenant.primaryColorRef.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '#${item['rank']}',
                              style: TextStyle(
                                color: activeTenant.primaryColorRef,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['category'],
                                style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item['time'],
                              style: TextStyle(
                                color: activeTenant.accentColorRef,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: 'Courier',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['status'].toString().toUpperCase(),
                              style: TextStyle(
                                color: isFinished ? Colors.green : Colors.orange,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveUpdatesTab(TenantConfig activeTenant) {
    final List<Map<String, String>> mockBroadcasts = [
      {'time': 'Hace 5 min', 'msg': 'Puntero Federico Albera cruza el puesto de control PC3 con un tiempo de 03:45:12.'},
      {'time': 'Hace 22 min', 'msg': 'El clima en la cumbre mejora. Temperatura actual: 12°C. Rutas en estado óptimo.'},
      {'time': 'Hace 1 hora', 'msg': 'Señales SOS de corredor PC12 fueron atendidas con éxito por personal médico.'},
      {'time': 'Hace 2 horas', 'msg': 'Inicia la largada de la categoría 80K Damas en el pórtico principal.'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: mockBroadcasts.length,
      itemBuilder: (context, index) {
        final item = mockBroadcasts[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: AppCard(
            style: AppCardStyle.normal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: activeTenant.primaryColorRef.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'OFICIAL',
                        style: TextStyle(color: activeTenant.primaryColorRef, fontWeight: FontWeight.bold, fontSize: 9),
                      ),
                    ),
                    Text(
                      item['time']!,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  item['msg']!,
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSocialTab(TenantConfig activeTenant, ThemeData theme) {
    return BlocBuilder<SocialBloc, SocialState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator.adaptive()),
          loaded: (links) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppCard(
                    style: AppCardStyle.gradient,
                    child: const Column(
                      children: [
                        Icon(Icons.diversity_3_rounded, color: Colors.white, size: 40),
                        SizedBox(height: 12),
                        Text(
                          'Nuestras Redes Sociales',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Sigue las transmisiones, fotos oficiales y comentarios de la comunidad.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    text: 'Instagram Oficial',
                    icon: Icons.camera_alt_outlined,
                    onPressed: () {},
                    type: AppButtonType.primary,
                  ),
                  const SizedBox(height: 14),
                  AppButton(
                    text: 'Facebook Fanpage',
                    icon: Icons.facebook_rounded,
                    onPressed: () {},
                    type: AppButtonType.outlined,
                  ),
                  const SizedBox(height: 14),
                  AppButton(
                    text: 'Visitar Web Oficial',
                    icon: Icons.language_rounded,
                    onPressed: () {},
                    type: AppButtonType.outlined,
                  ),
                ],
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

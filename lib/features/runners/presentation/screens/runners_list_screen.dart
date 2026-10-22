import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/storage/hive_service.dart';
import '../../../../core/theme/tenant_config.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../participant/domain/entities/participant_detail.dart';
import '../../domain/entities/runner_item.dart';
import '../bloc/runners_bloc.dart';
import '../bloc/runners_event.dart';
import '../bloc/runners_state.dart';
import '../widgets/runner_card.dart';

class RunnersListScreen extends StatefulWidget {
  const RunnersListScreen({super.key});

  @override
  State<RunnersListScreen> createState() => _RunnersListScreenState();
}

class _RunnersListScreenState extends State<RunnersListScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  late final RunnersBloc _runnersBloc;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  String _selectedCircuit = 'TODOS';
  String _searchQuery = '';
  ParticipantDetail? _linkedParticipant;

  @override
  void initState() {
    super.initState();
    _runnersBloc = getIt<RunnersBloc>();
    _loadLinkedParticipant();
    _runnersBloc.add(const RunnersEvent.getRunners(eventId: '1', orgId: '1'));
    _searchController.addListener(_onSearchChanged);
    _tenantManager.addListener(_onTenantChanged);
  }

  void _onTenantChanged() {
    if (mounted) setState(() {});
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.trim().toLowerCase();
    });
  }

  Future<void> _loadLinkedParticipant() async {
    final hiveService = getIt<HiveService>();
    final cacheKey = 'cached_participant_${_tenantManager.value.tenantId}';
    final Map? cachedJson = await hiveService.get<Map>('participant_box', cacheKey);
    if (cachedJson != null && mounted) {
      setState(() {
        _linkedParticipant = ParticipantDetail(cachedJson.cast<String, dynamic>());
      });
    }
  }

  @override
  void dispose() {
    _tenantManager.removeListener(_onTenantChanged);
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  List<String> _extractCircuits(List<RunnerItem> allRunners) {
    final circuits = <String>{'TODOS'};
    for (final runner in allRunners) {
      if (runner.circuito.trim().isNotEmpty) {
        circuits.add(runner.circuito.trim().toUpperCase());
      }
    }
    return circuits.toList();
  }

  List<RunnerItem> _filterRunners(List<RunnerItem> allRunners) {
    return allRunners.where((runner) {
      // 1. Filter by Circuit
      if (_selectedCircuit != 'TODOS') {
        if (runner.circuito.trim().toUpperCase() != _selectedCircuit) {
          return false;
        }
      }

      // 2. Filter by Search Query
      if (_searchQuery.isNotEmpty) {
        final nameMatch = runner.fullName.toLowerCase().contains(_searchQuery);
        final dorsalMatch = runner.dorsal.toLowerCase().contains(_searchQuery);
        final categoryMatch = runner.categoria.toLowerCase().contains(_searchQuery);
        final teamMatch = runner.grupoEntrenamiento?.toLowerCase().contains(_searchQuery) ?? false;
        final cityMatch = runner.ciudad?.toLowerCase().contains(_searchQuery) ?? false;

        return nameMatch || dorsalMatch || categoryMatch || teamMatch || cityMatch;
      }

      return true;
    }).toList();
  }

  Map<String, List<RunnerItem>> _groupByCategory(List<RunnerItem> runners) {
    final Map<String, List<RunnerItem>> grouped = {};
    for (final runner in runners) {
      final key = runner.categoria.isNotEmpty ? runner.categoria : 'General';
      grouped.putIfAbsent(key, () => []).add(runner);
    }
    return grouped;
  }

  void _handleBack() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;

    return BlocProvider<RunnersBloc>.value(
      value: _runnersBloc,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          _handleBack();
        },
        child: Scaffold(
          backgroundColor: activeTenant.backgroundColorRef,
          appBar: AppBar(
            backgroundColor: activeTenant.backgroundColorRef,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
              onPressed: _handleBack,
            ),
            centerTitle: true,
          title: const Column(
            children: [
              Text(
                'Listado de Corredores',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Nómina oficial de inscriptos',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<RunnersBloc, RunnersState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(
                    color: activeTenant.primaryColorRef,
                  ),
                ),
                error: (message) => _buildErrorState(activeTenant, message),
                loaded: (allRunners) => _buildLoadedContent(activeTenant, allRunners),
              );
            },
          ),
        ),
      ),
    ),
  );
}

  Widget _buildErrorState(TenantConfig activeTenant, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: activeTenant.primaryColorRef,
              size: 56,
            ),
            const SizedBox(height: 16),
            const Text(
              'No pudimos cargar la lista',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Por favor verifica tu conexión y vuelve a intentar.',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                _runnersBloc.add(const RunnersEvent.getRunners(eventId: '1', orgId: '1'));
              },
              icon: const Icon(Icons.refresh_rounded, color: Colors.white),
              label: const Text('Reintentar', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: activeTenant.primaryColorRef,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedContent(TenantConfig activeTenant, List<RunnerItem> allRunners) {
    final circuits = _extractCircuits(allRunners);
    final filteredRunners = _filterRunners(allRunners);
    final groupedByCategory = _groupByCategory(filteredRunners);

    return Column(
      children: [
        // 1. Search Box
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _searchFocusNode.hasFocus
                    ? activeTenant.primaryColorRef
                    : Colors.white.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Buscar por nombre, apellido o dorsal...',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.4),
                  fontSize: 13,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: _searchFocusNode.hasFocus
                      ? activeTenant.primaryColorRef
                      : Colors.white54,
                  size: 20,
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close_rounded, color: Colors.white54, size: 18),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),
        ),

        // 2. Circuit Filters Chips
        if (circuits.length > 2)
          SizedBox(
            height: 38,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: circuits.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final circuit = circuits[index];
                final isSelected = _selectedCircuit == circuit;
                final count = circuit == 'TODOS'
                    ? allRunners.length
                    : allRunners.where((r) => r.circuito.toUpperCase() == circuit).length;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCircuit = circuit;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? activeTenant.primaryColorRef
                          : const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? activeTenant.primaryColorRef
                            : Colors.white.withValues(alpha: 0.1),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          circuit,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white70,
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.black.withValues(alpha: 0.25)
                                : Colors.white.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '$count',
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.white54,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

        const SizedBox(height: 10),

        // 3. Status Count Indicator & My Category Shortcut
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${filteredRunners.length} ${filteredRunners.length == 1 ? "corredor encontrado" : "corredores encontrados"}',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (_linkedParticipant != null && _linkedParticipant!.circuito.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCircuit = _linkedParticipant!.circuito.toUpperCase();
                      _searchController.text = _linkedParticipant!.name;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person_pin_circle_rounded, size: 14, color: activeTenant.primaryColorRef),
                      const SizedBox(width: 4),
                      Text(
                        'Mi Circuito',
                        style: TextStyle(
                          color: activeTenant.primaryColorRef,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),

        // 4. Grouped Runner List
        Expanded(
          child: filteredRunners.isEmpty
              ? _buildEmptyResultsState(activeTenant)
              : RefreshIndicator(
                  color: activeTenant.primaryColorRef,
                  backgroundColor: const Color(0xFF1E1E1E),
                  onRefresh: () async {
                    _runnersBloc.add(const RunnersEvent.refresh(eventId: '1', orgId: '1'));
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 24),
                    itemCount: groupedByCategory.keys.length,
                    itemBuilder: (context, index) {
                      final categoryName = groupedByCategory.keys.elementAt(index);
                      final runnersInCategory = groupedByCategory[categoryName]!;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category Header
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
                            child: Row(
                              children: [
                                Container(
                                  width: 3,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: activeTenant.primaryColorRef,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    categoryName.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 0.8,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.08),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '${runnersInCategory.length}',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Runner Cards
                          ...runnersInCategory.map((runner) {
                            final isMe = _linkedParticipant != null &&
                                ((runner.dorsal.isNotEmpty &&
                                        runner.dorsal == _linkedParticipant!.nroPlaca) ||
                                    (runner.fullName.toLowerCase() ==
                                        _linkedParticipant!.fullName.toLowerCase()));

                            return RunnerCard(
                              runner: runner,
                              tenant: activeTenant,
                              isCurrentRunner: isMe,
                            );
                          }),
                        ],
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildEmptyResultsState(TenantConfig activeTenant) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 52,
              color: Colors.white.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            const Text(
              'No se encontraron corredores',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Prueba buscando con otro término o seleccionando otro circuito.',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            TextButton(
              onPressed: () {
                setState(() {
                  _searchController.clear();
                  _selectedCircuit = 'TODOS';
                });
              },
              child: Text(
                'Restablecer filtros',
                style: TextStyle(
                  color: activeTenant.primaryColorRef,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

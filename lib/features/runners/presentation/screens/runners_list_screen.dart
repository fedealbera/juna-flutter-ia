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
    _searchFocusNode.addListener(_onFocusChanged);
    _tenantManager.addListener(_onTenantChanged);
  }

  void _onFocusChanged() {
    if (mounted) setState(() {});
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
    _searchFocusNode.removeListener(_onFocusChanged);
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  List<String> _extractCircuits(List<RunnerItem> allRunners) {
    final circuitSet = <String>{};
    for (final runner in allRunners) {
      if (runner.circuito.trim().isNotEmpty) {
        circuitSet.add(runner.circuito.trim().toUpperCase());
      }
    }
    final sorted = circuitSet.toList()
      ..sort((a, b) {
        final aNum = int.tryParse(a.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
        final bNum = int.tryParse(b.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
        if (aNum != 0 && bNum != 0) return bNum.compareTo(aNum);
        return a.compareTo(b);
      });
    return ['TODOS', ...sorted];
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
        final provMatch = runner.provincia?.toLowerCase().contains(_searchQuery) ?? false;

        return nameMatch || dorsalMatch || categoryMatch || teamMatch || cityMatch || provMatch;
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
        // 1. Sleek Glassmorphic Search Box
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: const Color(0xFF141414),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _searchFocusNode.hasFocus
                    ? activeTenant.primaryColorRef
                    : Colors.white.withValues(alpha: 0.08),
                width: _searchFocusNode.hasFocus ? 1.4 : 1.0,
              ),
              boxShadow: [
                if (_searchFocusNode.hasFocus)
                  BoxShadow(
                    color: activeTenant.primaryColorRef.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  )
                else
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Buscar por corredor, dorsal o provincia...',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.38),
                  fontSize: 13,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: _searchFocusNode.hasFocus
                      ? activeTenant.primaryColorRef
                      : Colors.white38,
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              ),
            ),
          ),
        ),

        // 2. Segmented Circuit Selector Pills
        if (circuits.length > 2)
          Container(
            height: 40,
            margin: const EdgeInsets.only(bottom: 6),
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
                      gradient: isSelected
                          ? LinearGradient(
                              colors: [
                                activeTenant.primaryColorRef,
                                activeTenant.secondaryColorRef,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      color: isSelected ? null : const Color(0xFF141414),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? activeTenant.primaryColorRef
                            : Colors.white.withValues(alpha: 0.08),
                        width: 1,
                      ),
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: activeTenant.primaryColorRef.withValues(alpha: 0.35),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          circuit,
                          style: TextStyle(
                            color: isSelected
                                ? (activeTenant.primaryColorRef.computeLuminance() < 0.15
                                    ? Colors.white
                                    : Colors.white)
                                : Colors.white70,
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.black.withValues(alpha: 0.28)
                                : Colors.white.withValues(alpha: 0.06),
                            borderRadius: BorderRadius.circular(8),
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

        // 3. Stats & Quick Shortcut Bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.how_to_reg_rounded,
                    size: 14,
                    color: activeTenant.primaryColorRef,
                  ),
                  const SizedBox(width: 6),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${filteredRunners.length} ',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: filteredRunners.length == 1
                              ? 'corredor acreditado'
                              : 'corredores acreditados',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.5),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_linkedParticipant != null && _linkedParticipant!.circuito.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCircuit = _linkedParticipant!.circuito.toUpperCase();
                      _searchController.text = _linkedParticipant!.name;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: activeTenant.primaryColorRef.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: activeTenant.primaryColorRef.withValues(alpha: 0.35),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person_pin_circle_rounded,
                          size: 13,
                          color: activeTenant.primaryColorRef.computeLuminance() < 0.15
                              ? Colors.white
                              : activeTenant.primaryColorRef,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Mi Circuito',
                          style: TextStyle(
                            color: activeTenant.primaryColorRef.computeLuminance() < 0.15
                                ? Colors.white
                                : activeTenant.primaryColorRef,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                  backgroundColor: const Color(0xFF141414),
                  onRefresh: () async {
                    _runnersBloc.add(const RunnersEvent.refresh(eventId: '1', orgId: '1'));
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 24),
                    itemCount: groupedByCategory.keys.length,
                    itemBuilder: (context, index) {
                      final categoryName = groupedByCategory.keys.elementAt(index);
                      final runnersInCategory = groupedByCategory[categoryName]!;
                      final lowerCat = categoryName.toLowerCase();
                      final IconData categoryIcon = lowerCat.contains('mujer') || lowerCat.contains('femenin')
                          ? Icons.female_rounded
                          : (lowerCat.contains('hombre') || lowerCat.contains('masculin')
                              ? Icons.male_rounded
                              : Icons.emoji_events_rounded);

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Sleek Category Header Capsule
                          Container(
                            margin: const EdgeInsets.fromLTRB(16, 14, 16, 4),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                            decoration: BoxDecoration(
                              color: const Color(0xFF181818),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.05),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  categoryIcon,
                                  size: 15,
                                  color: activeTenant.primaryColorRef,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    categoryName.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 0.8,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: activeTenant.primaryColorRef.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '${runnersInCategory.length} ${runnersInCategory.length == 1 ? "inscripto" : "inscriptos"}',
                                    style: TextStyle(
                                      color: activeTenant.primaryColorRef.computeLuminance() < 0.15
                                          ? Colors.white
                                          : activeTenant.primaryColorRef,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
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

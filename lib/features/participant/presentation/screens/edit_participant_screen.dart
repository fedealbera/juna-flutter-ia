import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/tenant_manager.dart';
import '../../../../shared/design_system/text_fields/app_text_field.dart';
import '../../../../shared/design_system/dialogs/app_dialog.dart';
import '../../../catalog/data/datasource/catalog_remote_datasource.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../categories/domain/entities/size_entity.dart';
import '../../../categories/domain/repositories/categories_repository.dart';
import '../../../event/domain/entities/circuit.dart';
import '../../../event/domain/repositories/event_repository.dart';
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
  late final TextEditingController _trainingGroupController;

  bool _isLoading = false;

  // Dropdown list data
  List<Circuit> _circuits = [];
  List<Category> _categories = [];
  List<SizeEntity> _sizes = [];
  List<Map<String, dynamic>> _accreditationCenters = [];
  List<Map<String, dynamic>> _brands = [];
  List<Map<String, dynamic>> _trainingGroups = [];

  String? _selectedCircuitId;
  String? _selectedCategoryId;
  String? _selectedSizeId;
  String? _selectedCacreId;
  String? _selectedMarcbId;
  String? _selectedTrainingGroup;

  bool _loadingCatalogs = false;
  bool _loadingCategories = false;
  bool _loadingAdditionalCatalogs = false;

  @override
  void initState() {
    super.initState();
    final p = widget.participant;
    _phoneController = TextEditingController(text: p.contCelular);
    _emailController = TextEditingController(text: p.contEmail);
    _instagramController = TextEditingController(text: p.contInstagram);
    _emergencyNameController = TextEditingController(text: p.contNombre);
    _emergencyPhoneController = TextEditingController(text: p.contTel);
    _trainingGroupController = TextEditingController(text: p.grupoEntrenamiento);

    _selectedCacreId = p.cacreId.isNotEmpty ? p.cacreId : null;
    _selectedMarcbId = p.marcbId.isNotEmpty ? p.marcbId : null;
    _selectedTrainingGroup = p.grupoEntrenamiento.isNotEmpty ? p.grupoEntrenamiento : null;

    final showRegistrationModifications = p.nroPlaca == '0' || p.nroPlaca.isEmpty;
    if (showRegistrationModifications) {
      _selectedCircuitId = p.idCircuito.isNotEmpty ? p.idCircuito : null;
      _selectedCategoryId = p.idCategoria.isNotEmpty ? p.idCategoria : null;
      _selectedSizeId = p.partTalleId.isNotEmpty ? p.partTalleId : null;
      _loadCatalogs();
    }

    _loadAdditionalCatalogs();
  }

  Future<void> _loadCatalogs() async {
    setState(() {
      _loadingCatalogs = true;
    });
    try {
      final circuitsFuture = getIt<EventRepository>().getCircuits();
      final sizesFuture = getIt<CategoriesRepository>().getSizes();

      final results = await Future.wait([circuitsFuture, sizesFuture]);
      _circuits = results[0] as List<Circuit>;
      _sizes = results[1] as List<SizeEntity>;

      debugPrint('Catalogs loaded successfully. Circuits: ${_circuits.length}, Sizes: ${_sizes.length}');

      if (_selectedCircuitId != null) {
        await _loadCategories(_selectedCircuitId!);
      }
    } catch (e) {
      debugPrint('Error loading catalogs: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al cargar catálogos: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _loadingCatalogs = false;
        });
      }
    }
  }

  Future<void> _loadAdditionalCatalogs() async {
    if (mounted) {
      setState(() {
        _loadingAdditionalCatalogs = true;
      });
    }
    try {
      final remoteDataSource = getIt<CatalogRemoteDataSource>();
      final centersFuture = remoteDataSource.getCentrosAcreditacion();
      
      final tipoCarrera = widget.participant.tipoCarrera;
      final brandsFuture = remoteDataSource.getMarcas(tipoCarrera.isNotEmpty ? tipoCarrera : null);

      final tenantId = _tenantManager.value.tenantId;
      final queryTipoCarrera = tenantId == 2 ? 'RUNNING' : 'BICICLETA';
      final trainingGroupsFuture = remoteDataSource.getGruposEntrenamiento(queryTipoCarrera);

      final results = await Future.wait([centersFuture, brandsFuture, trainingGroupsFuture]);
      _accreditationCenters = results[0];
      _brands = results[1];
      _trainingGroups = List<Map<String, dynamic>>.from(results[2] as List);

      if (_selectedTrainingGroup != null && _selectedTrainingGroup!.isNotEmpty) {
        final hasSelected = _trainingGroups.any(
          (g) => g['gent_nombre']?.toString().trim().toLowerCase() == _selectedTrainingGroup!.trim().toLowerCase()
        );
        if (!hasSelected) {
          _trainingGroups.insert(0, {
            'gent_id': -1,
            'gent_nombre': _selectedTrainingGroup,
            'tipo_carrera': queryTipoCarrera,
          });
        }
      }

      debugPrint('Loaded ${_accreditationCenters.length} centers, ${_brands.length} brands, and ${_trainingGroups.length} training groups.');
    } catch (e) {
      debugPrint('Error loading additional catalogs: $e');
    } finally {
      if (mounted) {
        setState(() {
          _loadingAdditionalCatalogs = false;
        });
      }
    }
  }

  Future<void> _loadCategories(String circuitId) async {
    setState(() {
      _loadingCategories = true;
    });
    try {
      final categories = await getIt<CategoriesRepository>().getCategories(
        circuitId,
        widget.participant.dni,
      );
      _categories = categories;

      debugPrint('Categories loaded successfully for circuit $circuitId: ${_categories.length}');

      // Adjust selected category if not present in the loaded categories
      final hasSelected = _categories.any((c) => c.id == _selectedCategoryId);
      if (!hasSelected) {
        if (_categories.isNotEmpty) {
          if (_categories.length > 1) {
            // Default to the first non-special category if multiple exist
            final defaultCat = _categories.firstWhere(
              (c) => c.categEspecial != 1,
              orElse: () => _categories.first,
            );
            _selectedCategoryId = defaultCat.id;
          } else {
            _selectedCategoryId = _categories.first.id;
          }
        } else {
          _selectedCategoryId = null;
        }
      }
    } catch (e) {
      debugPrint('Error loading categories: $e');
      _categories = [];
      _selectedCategoryId = null;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al cargar categorías: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _loadingCategories = false;
        });
      }
    }
  }

  void _onCircuitChanged(String? newCircuitId) {
    if (newCircuitId == null || newCircuitId == _selectedCircuitId) return;
    setState(() {
      _selectedCircuitId = newCircuitId;
      _selectedCategoryId = null;
      _categories = [];
    });
    _loadCategories(newCircuitId);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    _instagramController.dispose();
    _emergencyNameController.dispose();
    _emergencyPhoneController.dispose();
    _trainingGroupController.dispose();
    _participantBloc.close();
    super.dispose();
  }

  void _onSave() async {
    debugPrint('EditParticipantScreen: _onSave button clicked!');
    setState(() {
      _isLoading = true;
    });

    final p = widget.participant;
    final showRegistrationModifications = p.nroPlaca == '0' || p.nroPlaca.isEmpty;

    debugPrint('EditParticipantScreen: Dispatching ParticipantEvent.updateParticipant for partiId: ${p.id}');
    final selectedBrand = _brands.firstWhere(
      (b) => b['marca_id']?.toString() == _selectedMarcbId,
      orElse: () => <String, dynamic>{},
    );
    final marcbLabel = selectedBrand['marca_nombre']?.toString();

    String? finalTrainingGroupName = _selectedTrainingGroup;

    if (_selectedTrainingGroup == '__other__') {
      final customName = _trainingGroupController.text.trim();
      if (customName.isEmpty) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Por favor, ingresa el nombre de tu grupo de entrenamiento.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      try {
        final tenantId = _tenantManager.value.tenantId;
        final queryTipoCarrera = tenantId == 2 ? 'RUNNING' : 'BICICLETA';
        
        final result = await getIt<CatalogRemoteDataSource>().createGrupoEntrenamiento(
          customName,
          queryTipoCarrera,
        );

        finalTrainingGroupName = result['gent_nombre']?.toString() ?? customName;
      } catch (e) {
        debugPrint('Error creating training group during save: $e');
        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al registrar grupo de entrenamiento: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }
    }

    _participantBloc.add(ParticipantEvent.updateParticipant(
      partiId: p.id,
      domCiudad: p.domCiudad,
      domCiudadNombre: p.domCiudadNombre,
      domProvincia: p.domProvincia,
      domPais: p.domPais,
      contInstagram: _instagramController.text,
      contCelular: _phoneController.text,
      contEmail: _emailController.text,
      contNombre: _emergencyNameController.text,
      contTel: _emergencyPhoneController.text,
      insId: p.insId,
      circuitoId: showRegistrationModifications ? _selectedCircuitId : p.idCircuito,
      categoriaId: showRegistrationModifications ? _selectedCategoryId : p.idCategoria,
      talleId: showRegistrationModifications ? _selectedSizeId : p.partTalleId,
      cacreId: widget.participant.tipoCarrera == 'BICICLETA' ? null : _selectedCacreId,
      marcbId: _selectedMarcbId,
      marcbLabel: marcbLabel,
      grupoEntrenamiento: finalTrainingGroupName != null && finalTrainingGroupName.trim().isNotEmpty
          ? finalTrainingGroupName.trim()
          : null,
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
            participantUpdated: (result) {
              setState(() {
                _isLoading = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    '¡Listo! Datos actualizados.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                  duration: Duration(milliseconds: 1500),
                ),
              );
              context.pop(true);
            },
            error: (message) {
              setState(() {
                _isLoading = false;
              });
              AppAlertDialog.show(
                context: context,
                type: AppDialogType.error,
                title: 'Error',
                message: message.contains('Exception:') ? message.replaceFirst('Exception: ', '') : message,
                primaryButtonText: 'ACEPTAR',
                onPrimaryPressed: () => context.pop(),
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

                              // Section: Datos de la Carrera (only if pre-inscripto / no dorsal)
                              if (widget.participant.nroPlaca == '0' || widget.participant.nroPlaca.isEmpty) ...[
                                const SizedBox(height: 28),
                                _buildSectionTitle('DATOS DE LA CARRERA', primaryColor),
                                const SizedBox(height: 16),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.03),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: Colors.white10, width: 1),
                                  ),
                                  padding: const EdgeInsets.all(16.0),
                                  child: _loadingCatalogs
                                      ? const Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: 20),
                                            child: CircularProgressIndicator.adaptive(),
                                          ),
                                        )
                                      : Column(
                                          children: [
                                            _buildDropdownField(
                                              label: 'Circuito',
                                              hint: 'Selecciona circuito',
                                              value: _circuits.any((c) => c.id == _selectedCircuitId) ? _selectedCircuitId : null,
                                              prefixIcon: Icons.route_outlined,
                                              items: _circuits.map((c) {
                                                return DropdownMenuItem<String>(
                                                  value: c.id,
                                                  child: Text(
                                                    c.name,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: _onCircuitChanged,
                                            ),
                                            const SizedBox(height: 16),
                                            _buildDropdownField(
                                              label: 'Categoría',
                                              hint: _selectedCircuitId == null
                                                  ? 'Selecciona circuito primero'
                                                  : 'Selecciona categoría',
                                              value: _categories.any((c) => c.id == _selectedCategoryId) ? _selectedCategoryId : null,
                                              prefixIcon: Icons.emoji_events_outlined,
                                              items: _categories.map((c) {
                                                return DropdownMenuItem<String>(
                                                  value: c.id,
                                                  child: Text(
                                                    c.name,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (val) {
                                                setState(() {
                                                  _selectedCategoryId = val;
                                                });
                                                if (val != null) {
                                                  final selectedCat = _categories.firstWhere(
                                                    (c) => c.id == val,
                                                    orElse: () => _categories.first,
                                                  );
                                                  if (selectedCat.categEspecial == 1) {
                                                    AppAlertDialog.show(
                                                      context: context,
                                                      title: 'Categoría Especial',
                                                      message: 'Categoría para corredores con capacidades diferentes',
                                                      type: AppDialogType.info,
                                                      primaryButtonText: 'ACEPTAR',
                                                    );
                                                  }
                                                }
                                              },
                                              isLoading: _loadingCategories,
                                            ),
                                            const SizedBox(height: 16),
                                            _buildDropdownField(
                                              label: 'Talle de Remera',
                                              hint: 'Selecciona talle',
                                              value: _sizes.any((s) => s.id == _selectedSizeId) ? _selectedSizeId : null,
                                              prefixIcon: Icons.checkroom_rounded,
                                              items: _sizes.map((s) {
                                                return DropdownMenuItem<String>(
                                                  value: s.id,
                                                  child: Text(
                                                    s.name,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (val) {
                                                setState(() {
                                                  _selectedSizeId = val;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                ),
                              ],

                              // Section: Información Adicional
                              const SizedBox(height: 28),
                              _buildSectionTitle('INFORMACIÓN ADICIONAL', primaryColor),
                              const SizedBox(height: 16),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.03),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.white10, width: 1),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: _loadingAdditionalCatalogs
                                    ? const Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: 20),
                                          child: CircularProgressIndicator.adaptive(),
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          if (widget.participant.tipoCarrera != 'BICICLETA') ...[
                                            _buildDropdownField(
                                              label: 'Centro de Acreditación',
                                              hint: 'Selecciona centro de acreditación',
                                              value: _accreditationCenters.any((c) => c['id_ca']?.toString() == _selectedCacreId) 
                                                  ? _selectedCacreId 
                                                  : null,
                                              prefixIcon: Icons.location_on_outlined,
                                              items: _accreditationCenters.map((c) {
                                                return DropdownMenuItem<String>(
                                                  value: c['id_ca']?.toString(),
                                                  child: Text(
                                                    c['nombre_ca']?.toString() ?? '',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (val) {
                                                setState(() {
                                                  _selectedCacreId = val;
                                                });
                                              },
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                          _buildDropdownField(
                                            label: 'Grupo de Entrenamiento',
                                            hint: 'Selecciona grupo de entrenamiento',
                                            value: (_selectedTrainingGroup == '__other__' || _trainingGroups.any((g) => g['gent_nombre']?.toString() == _selectedTrainingGroup))
                                                ? _selectedTrainingGroup 
                                                : null,
                                            prefixIcon: Icons.groups_outlined,
                                            items: [
                                              ..._trainingGroups.map((g) {
                                                return DropdownMenuItem<String>(
                                                  value: g['gent_nombre']?.toString(),
                                                  child: Text(
                                                    g['gent_nombre']?.toString() ?? '',
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                );
                                              }),
                                              DropdownMenuItem<String>(
                                                value: '__other__',
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.add_circle_outline_rounded, color: primaryColor),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      'OTRO',
                                                      style: TextStyle(color: primaryColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                            onChanged: (val) {
                                              setState(() {
                                                _selectedTrainingGroup = val;
                                                if (val == '__other__') {
                                                  _trainingGroupController.clear();
                                                }
                                              });
                                            },
                                          ),
                                          const SizedBox(height: 16),
                                          if (_selectedTrainingGroup == '__other__') ...[
                                            AppTextField(
                                              label: 'Nombre del Grupo de Entrenamiento',
                                              hint: 'Ingresa nombre de tu grupo',
                                              prefixIcon: Icons.edit_outlined,
                                              controller: _trainingGroupController,
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                          _buildDropdownField(
                                            label: widget.participant.tipoCarrera == 'BICICLETA' ? 'Bicicleta' : 'Zapatillas / Calzado',
                                            hint: widget.participant.tipoCarrera == 'BICICLETA' 
                                                ? 'Selecciona marca de bicicleta' 
                                                : 'Selecciona marca de zapatillas',
                                            value: _brands.any((b) => b['marca_id']?.toString() == _selectedMarcbId) 
                                                ? _selectedMarcbId 
                                                : null,
                                            prefixIcon: widget.participant.tipoCarrera == 'BICICLETA' ? Icons.directions_bike_rounded : Icons.directions_run_outlined,
                                            items: _brands.map((b) {
                                              return DropdownMenuItem<String>(
                                                value: b['marca_id']?.toString(),
                                                child: Text(
                                                  b['marca_nombre']?.toString() ?? '',
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                _selectedMarcbId = val;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                              ),

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


  Widget _buildDropdownField({
    required String label,
    required String hint,
    required String? value,
    required IconData prefixIcon,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
    bool isLoading = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          isExpanded: true,
          hint: Text(
            isLoading ? 'Cargando...' : hint,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 14,
            ),
          ),
          dropdownColor: const Color(0xFF1E1E1E),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon, color: Colors.white.withValues(alpha: 0.4)),
            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.02),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: _tenantManager.value.primaryColorRef),
            ),
          ),
          items: isLoading ? null : items,
          onChanged: isLoading ? null : onChanged,
          iconEnabledColor: Colors.white.withValues(alpha: 0.6),
          iconDisabledColor: Colors.white.withValues(alpha: 0.2),
        ),
      ],
    );
  }
}

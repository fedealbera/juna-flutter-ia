import 'package:flutter/material.dart';
import '../../core/di/injection.dart';
import '../../core/theme/branding_manager.dart';
import '../../core/theme/tenant_config.dart';
import '../../core/theme/tenant_manager.dart';
import 'buttons/app_button.dart';
import 'cards/app_card.dart';
import 'loaders/app_loader.dart';
import 'text_fields/app_text_field.dart';

class HomeDemoScreen extends StatefulWidget {
  const HomeDemoScreen({super.key});

  @override
  State<HomeDemoScreen> createState() => _HomeDemoScreenState();
}

class _HomeDemoScreenState extends State<HomeDemoScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  final BrandingManager _brandingManager = getIt<BrandingManager>();

  // Mock list of Tenants/Organizations
  final List<TenantConfig> _mockTenants = [
    const TenantConfig(
      id: 'patagonia_trail',
      name: 'Patagonia Trail Run',
      primaryColor: Color(0xFF2E7D32), // Forest Green
      secondaryColor: Color(0xFF1B5E20), // Dark Green
      accentColor: Color(0xFFFF8F00), // Amber
      backgroundColor: Color(0xFFF1F8E9), // Light Green Tint
      logoUrl: 'https://images.unsplash.com/photo-1551632879-6dfc301c3490?w=150&q=80', // Mock Net Logo
      supportedSports: [SportType.trailRunning, SportType.running],
      enableLiveTracking: true,
    ),
    const TenantConfig(
      id: 'velo_mtb',
      name: 'Velo MTB Challenge',
      primaryColor: Color(0xFFE65100), // Orange
      secondaryColor: Color(0xFFBF360C), // Deep Red-Orange
      accentColor: Color(0xFF29B6F6), // Sky Blue
      backgroundColor: Color(0xFFFFF3E0), // Light Orange Tint
      logoUrl: 'https://images.unsplash.com/photo-1544192240-4a34feb0104a?w=150&q=80', // Mock Net Logo
      supportedSports: [SportType.mtb],
      enableLiveTracking: false,
    ),
    const TenantConfig(
      id: 'ba_marathon',
      name: 'Buenos Aires Marathon',
      primaryColor: Color(0xFF1565C0), // Blue
      secondaryColor: Color(0xFF0D47A1), // Dark Blue
      accentColor: Color(0xFFEC407A), // Hot Pink
      backgroundColor: Color(0xFFE3F2FD), // Light Blue Tint
      logoUrl: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?w=150&q=80', // Mock Net Logo
      supportedSports: [SportType.running, SportType.duathlon],
      enableLiveTracking: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: _brandingManager.getLogo(_tenantManager.value, height: 36),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton<TenantConfig>(
            icon: Icon(Icons.business_rounded, color: theme.colorScheme.primary),
            onSelected: (TenantConfig tenant) {
              _tenantManager.changeTenant(tenant);
              setState(() {});
            },
            itemBuilder: (context) {
              return _mockTenants.map((tenant) {
                return PopupMenuItem<TenantConfig>(
                  value: tenant,
                  child: Text(
                    tenant.name,
                    style: TextStyle(
                      color: tenant.id == _tenantManager.value.id 
                          ? tenant.primaryColor 
                          : null,
                      fontWeight: tenant.id == _tenantManager.value.id 
                          ? FontWeight.bold 
                          : null,
                    ),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card with Gradient
            AppCard(
              style: AppCardStyle.gradient,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¡Bienvenido a ${_tenantManager.value.name}!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Esta es la fundación de la aplicación en Flutter. Selecciona diferentes organizaciones en la parte superior derecha para ver cómo cambian los colores, fuentes, assets y lógica de negocio (White Label Multi-Tenant).',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Supported Sports Section
            Text(
              'Deportes Disponibles',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: _tenantManager.value.supportedSports.map((sport) {
                IconData icon;
                switch (sport) {
                  case SportType.running:
                    icon = Icons.directions_run_rounded;
                    break;
                  case SportType.trailRunning:
                    icon = Icons.terrain_rounded;
                    break;
                  case SportType.mtb:
                    icon = Icons.directions_bike_rounded;
                    break;
                  case SportType.duathlon:
                    icon = Icons.run_circle_outlined;
                    break;
                }
                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    children: [
                      Icon(icon, size: 18, color: theme.colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(
                        sport.displayName,
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 28),

            // Design System Showcase
            Text(
              'Design System (Material 3 Adaptive)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            
            AppCard(
              style: AppCardStyle.normal,
              child: Column(
                children: [
                  const AppTextField(
                    label: 'Email de Registro',
                    hint: 'nombre@correo.com',
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 16),
                  const AppTextField(
                    label: 'Contraseña',
                    hint: '••••••••',
                    prefixIcon: Icons.lock_outline_rounded,
                    isPassword: true,
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    text: 'Continuar Registro',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    text: 'Ver Resultados Anteriores',
                    type: AppButtonType.outlined,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Shimmer / Loaders section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const AppLoader(size: 28),
                AppShimmer(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

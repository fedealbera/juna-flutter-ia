import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/di/injection.dart';
import '../../../core/theme/branding_manager.dart';
import '../../../core/theme/tenant_config.dart';
import '../../../core/theme/tenant_manager.dart';
import '../../../core/firebase/tenant_firebase_config.dart';

class MainShellScreen extends StatefulWidget {
  final Widget child;

  const MainShellScreen({super.key, required this.child});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  final BrandingManager _brandingManager = getIt<BrandingManager>();

  final List<TenantConfig> _mockTenants = [
    TenantConfig(
      tenantId: 1,
      tenantName: 'Sport Event Platform',
      logoUrl: 'assets/images/default_logo.png',
      primaryColor: '#1E88E5',
      secondaryColor: '#1565C0',
      accentColor: '#FFFFB3',
      firebase: DefaultFirebaseConfig.ddln(),
      featureFlags: const FeatureFlags(enableRegistration: true, enableLiveTracking: true),
    ),
    TenantConfig(
      tenantId: 2,
      tenantName: 'DDLN - Desafío de la Naturaleza',
      logoUrl: 'https://images.unsplash.com/photo-1551632879-6dfc301c3490?w=150&q=80',
      primaryColor: '#FF7043',
      secondaryColor: '#D84315',
      accentColor: '#00E676',
      firebase: DefaultFirebaseConfig.ddln(),
      featureFlags: const FeatureFlags(enableRegistration: true, enableLiveTracking: true),
      baseUrl: 'https://juna.net.ar/desafio2026_testtt/api',
    ),
    TenantConfig(
      tenantId: 3,
      tenantName: 'Patagonia Trail Run',
      logoUrl: 'https://images.unsplash.com/photo-1551632879-6dfc301c3490?w=150&q=80',
      primaryColor: '#43A047',
      secondaryColor: '#2E7D32',
      accentColor: '#FFFFB3',
      firebase: DefaultFirebaseConfig.ddln(),
      featureFlags: const FeatureFlags(enableRegistration: true, enableLiveTracking: true),
    ),
    TenantConfig(
      tenantId: 4,
      tenantName: 'Velo MTB Challenge',
      logoUrl: 'https://images.unsplash.com/photo-1544192240-4a34feb0104a?w=150&q=80',
      primaryColor: '#FB8C00',
      secondaryColor: '#EF6C00',
      accentColor: '#00E5FF',
      firebase: DefaultFirebaseConfig.ddln(),
      featureFlags: const FeatureFlags(enableRegistration: true, enableLiveTracking: false),
    ),
    TenantConfig(
      tenantId: 5,
      tenantName: 'Buenos Aires Marathon',
      logoUrl: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?w=150&q=80',
      primaryColor: '#D81B60',
      secondaryColor: '#8E24AA',
      accentColor: '#00E676',
      firebase: DefaultFirebaseConfig.ddln(),
      featureFlags: const FeatureFlags(enableRegistration: true, enableLiveTracking: true),
    ),
  ];

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/inscripciones')) return 1;
    if (location.startsWith('/mapas')) return 2;
    if (location.startsWith('/vivo')) return 3;
    if (location.startsWith('/mas')) return 4;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/inscripciones');
        break;
      case 2:
        context.go('/mapas');
        break;
      case 3:
        context.go('/vivo');
        break;
      case 4:
        context.go('/mas');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeTenant = _tenantManager.value;
    final isWideScreen = MediaQuery.of(context).size.width >= 768;
    final selectedIndex = _calculateSelectedIndex(context);

    final navigationItems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home_rounded),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.app_registration_rounded),
        activeIcon: Icon(Icons.app_registration_sharp),
        label: 'Inscripciones',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.map_outlined),
        activeIcon: Icon(Icons.map_rounded),
        label: 'Mapas',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.sensors_rounded),
        activeIcon: Icon(Icons.sensors_sharp),
        label: 'Vivo',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.more_horiz_rounded),
        activeIcon: Icon(Icons.more_horiz_rounded),
        label: 'Más',
      ),
    ];

    Widget buildDrawerContent() {
      return Container(
        color: const Color(0xFF1E1E1E),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Org Logo
            DrawerHeader(
              decoration: BoxDecoration(
                color: activeTenant.primaryColorRef.withValues(alpha: 0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _brandingManager.getLogo(activeTenant, height: 50),
                  const SizedBox(height: 12),
                  Text(
                    activeTenant.tenantName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Navigation list items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                children: [
                  _buildDrawerItem(
                    icon: Icons.home_rounded,
                    title: 'Inicio',
                    selected: selectedIndex == 0,
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(0, context);
                    },
                    tenant: activeTenant,
                  ),
                  _buildDrawerItem(
                    icon: Icons.app_registration_rounded,
                    title: 'Inscripciones',
                    selected: selectedIndex == 1,
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(1, context);
                    },
                    tenant: activeTenant,
                  ),
                  _buildDrawerItem(
                    icon: Icons.map_rounded,
                    title: 'Mapas de Circuitos',
                    selected: selectedIndex == 2,
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(2, context);
                    },
                    tenant: activeTenant,
                  ),
                  _buildDrawerItem(
                    icon: Icons.sensors_rounded,
                    title: 'Vivo / Tracking',
                    selected: selectedIndex == 3,
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(3, context);
                    },
                    tenant: activeTenant,
                  ),
                  _buildDrawerItem(
                    icon: Icons.settings_accessibility_rounded,
                    title: 'Más opciones',
                    selected: selectedIndex == 4,
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(4, context);
                    },
                    tenant: activeTenant,
                  ),
                ],
              ),
            ),
            // Footer Tenant Swapping Tool
            Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Cambiar Organización (White Label Demo)',
                    style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<TenantConfig>(
                        value: _mockTenants.firstWhere((t) => t.tenantId == activeTenant.tenantId, orElse: () => _mockTenants.first),
                        dropdownColor: activeTenant.backgroundColorRef,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        items: _mockTenants.map((t) {
                          return DropdownMenuItem<TenantConfig>(
                            value: t,
                            child: Text(t.tenantName),
                          );
                        }).toList(),
                        onChanged: (TenantConfig? val) {
                          if (val != null) {
                            _tenantManager.changeTenant(val);
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: _brandingManager.getLogo(activeTenant, height: 32),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (!isWideScreen)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                width: 150,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<TenantConfig>(
                    isExpanded: true,
                    value: _mockTenants.firstWhere((t) => t.tenantId == activeTenant.tenantId, orElse: () => _mockTenants.first),
                    dropdownColor: activeTenant.backgroundColorRef,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white70, size: 18),
                    items: _mockTenants.map((t) {
                      return DropdownMenuItem<TenantConfig>(
                        value: t,
                        child: Text(
                          t.tenantName,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: (TenantConfig? val) {
                      if (val != null) {
                        _tenantManager.changeTenant(val);
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
      body: Row(
        children: [
          if (isWideScreen)
            SizedBox(
              width: 280,
              child: buildDrawerContent(),
            ),
          Expanded(child: widget.child),
        ],
      ),
      bottomNavigationBar: isWideScreen
          ? null
          : BottomNavigationBar(
              items: navigationItems,
              currentIndex: selectedIndex,
              onTap: (index) => _onItemTapped(index, context),
              type: BottomNavigationBarType.fixed,
              backgroundColor: activeTenant.backgroundColorRef,
              selectedItemColor: activeTenant.primaryColorRef,
              unselectedItemColor: Colors.grey.shade600,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 8,
            ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required bool selected,
    required VoidCallback onTap,
    required TenantConfig tenant,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: selected ? tenant.primaryColorRef.withValues(alpha: 0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: selected ? tenant.primaryColorRef : Colors.grey.shade400,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.grey.shade300,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: onTap,
      ),
    );
  }
}

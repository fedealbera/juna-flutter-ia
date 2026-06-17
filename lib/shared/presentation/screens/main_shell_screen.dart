import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/di/injection.dart';
import '../../../core/theme/branding_manager.dart';
import '../../../core/theme/tenant_config.dart';
import '../../../core/theme/tenant_manager.dart';

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
    const TenantConfig(
      id: 'default',
      name: 'Sport Event Platform',
      primaryColor: Color(0xFF1E88E5), // Material Blue
      secondaryColor: Color(0xFF1565C0), // Blue
      accentColor: Color(0xFFFFB300), // Yellow Accent
      backgroundColor: Color(0xFF121212),
      logoUrl: 'assets/images/default_logo.png',
      supportedSports: [SportType.running, SportType.trailRunning, SportType.mtb, SportType.duathlon],
      enableLiveTracking: true,
    ),
    const TenantConfig(
      id: 'patagonia_trail',
      name: 'Patagonia Trail Run',
      primaryColor: Color(0xFF43A047), // Vibrant Green
      secondaryColor: Color(0xFF2E7D32), // Dark Green
      accentColor: Color(0xFFFFB300), // Gold Accent
      backgroundColor: Color(0xFF0F140F),
      logoUrl: 'https://images.unsplash.com/photo-1551632879-6dfc301c3490?w=150&q=80',
      supportedSports: [SportType.trailRunning, SportType.running],
      enableLiveTracking: true,
    ),
    const TenantConfig(
      id: 'velo_mtb',
      name: 'Velo MTB Challenge',
      primaryColor: Color(0xFFFB8C00), // Orange
      secondaryColor: Color(0xFFEF6C00), // Deep Orange
      accentColor: Color(0xFF00E5FF), // Neon Cyan Accent
      backgroundColor: Color(0xFF14110F),
      logoUrl: 'https://images.unsplash.com/photo-1544192240-4a34feb0104a?w=150&q=80',
      supportedSports: [SportType.mtb],
      enableLiveTracking: false,
    ),
    const TenantConfig(
      id: 'ba_marathon',
      name: 'Buenos Aires Marathon',
      primaryColor: Color(0xFFD81B60), // NRC Hot Pink style
      secondaryColor: Color(0xFF8E24AA), // Purple
      accentColor: Color(0xFF00E676), // Neon Green Accent
      backgroundColor: Color(0xFF140F11),
      logoUrl: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?w=150&q=80',
      supportedSports: [SportType.running, SportType.duathlon],
      enableLiveTracking: true,
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
        icon: Icon(Icons.menu_rounded),
        activeIcon: Icon(Icons.menu_open_rounded),
        label: 'Más',
      ),
    ];

    Widget buildDrawerContent() {
      return Container(
        color: Color.alphaBlend(Colors.black.withValues(alpha: 0.4), activeTenant.backgroundColor),
        child: Column(
          children: [
            // Drawer Header with Tenant configuration
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: _brandingManager.getPrimaryGradient(activeTenant),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _brandingManager.getLogo(activeTenant, height: 50),
                    const SizedBox(height: 12),
                    Text(
                      activeTenant.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
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
                        value: _mockTenants.firstWhere((t) => t.id == activeTenant.id, orElse: () => _mockTenants.first),
                        dropdownColor: activeTenant.backgroundColor,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        items: _mockTenants.map((t) {
                          return DropdownMenuItem<TenantConfig>(
                            value: t,
                            child: Text(t.name),
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
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: isWideScreen ? null : Drawer(child: buildDrawerContent()),
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
              backgroundColor: activeTenant.backgroundColor,
              selectedItemColor: activeTenant.primaryColor,
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
        color: selected ? tenant.primaryColor.withValues(alpha: 0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: selected ? tenant.primaryColor : Colors.grey.shade400,
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

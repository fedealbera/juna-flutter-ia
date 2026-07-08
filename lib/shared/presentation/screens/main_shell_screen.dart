import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/di/injection.dart';
import '../../../core/theme/branding_manager.dart';
import '../../../core/theme/tenant_config.dart';
import '../../../core/theme/tenant_manager.dart';
import '../../../core/firebase/notification_service.dart';

class MainShellScreen extends StatefulWidget {
  final Widget child;

  const MainShellScreen({super.key, required this.child});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  final TenantManager _tenantManager = getIt<TenantManager>();
  final BrandingManager _brandingManager = getIt<BrandingManager>();
  final NotificationService _notificationService = getIt<NotificationService>();

  @override
  void initState() {
    super.initState();
    _notificationService.addListener(_onNotificationsChanged);
  }

  @override
  void dispose() {
    _notificationService.removeListener(_onNotificationsChanged);
    super.dispose();
  }

  void _onNotificationsChanged() {
    if (mounted) {
      setState(() {});
    }
  }

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
        label: 'Registro',
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
            Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Event Platform © 2026',
                style: TextStyle(color: Colors.grey, fontSize: 11),
                textAlign: TextAlign.center,
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
          _buildNotificationBell(activeTenant),
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

  Widget _buildNotificationBell(TenantConfig tenant) {
    final unreadCount = _notificationService.unreadCount;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white, size: 26),
            onPressed: () {
              context.go('/notificaciones');
            },
          ),
          if (unreadCount > 0)
            Positioned(
              right: 6,
              top: 6,
              child: IgnorePointer(
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Center(
                    child: Text(
                      unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

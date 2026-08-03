import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_admin_kit/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:flutter_admin_kit/core/theme/theme_cubit.dart';
class AdminLayout extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AdminLayout({
    super.key,
    required this.navigationShell,
  });

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  bool _isSidebarCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 768;
    final isTablet = mediaQuery.size.width >= 768 && mediaQuery.size.width < 1200;
    final isDesktop = mediaQuery.size.width >= 1200;

    final theme = Theme.of(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: (isMobile || isTablet)
          ? Drawer(
              child: _SidebarContent(
                navigationShell: widget.navigationShell,
                isCollapsed: false,
                onSelect: () => scaffoldKey.currentState?.closeDrawer(),
              ),
            )
          : null,
      body: Row(
        children: [
          // Sidebar on Desktop / Tablet (if not collapsed)
          if (isDesktop || (isTablet && !_isSidebarCollapsed))
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isSidebarCollapsed ? 80 : 260,
              child: _SidebarContent(
                navigationShell: widget.navigationShell,
                isCollapsed: _isSidebarCollapsed,
              ),
            ),
          
          // Main content area
          Expanded(
            child: Column(
              children: [
                // Top Navbar
                _Navbar(
                  isMobile: isMobile,
                  isTablet: isTablet,
                  isSidebarCollapsed: _isSidebarCollapsed,
                  onToggleSidebar: () {
                    if (isMobile || isTablet) {
                      scaffoldKey.currentState?.openDrawer();
                    } else {
                      setState(() {
                        _isSidebarCollapsed = !_isSidebarCollapsed;
                      });
                    }
                  },
                ),
                
                // Nested view content
                Expanded(
                  child: Container(
                    color: theme.scaffoldBackgroundColor,
                    child: widget.navigationShell,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarContent extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final bool isCollapsed;
  final VoidCallback? onSelect;

  const _SidebarContent({
    required this.navigationShell,
    required this.isCollapsed,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeIndex = navigationShell.currentIndex;

    final items = [
      _NavigationItem('Dashboard', Icons.dashboard_outlined, Icons.dashboard),
      _NavigationItem('Users', Icons.people_outline, Icons.people),
      _NavigationItem('Products', Icons.shopping_bag_outlined, Icons.shopping_bag),
      _NavigationItem('Orders', Icons.receipt_long_outlined, Icons.receipt_long),
      _NavigationItem('Analytics', Icons.bar_chart_outlined, Icons.bar_chart),
      _NavigationItem('Settings', Icons.settings_outlined, Icons.settings),
    ];

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          right: BorderSide(color: theme.colorScheme.outline),
        ),
      ),
      child: Column(
        children: [
          // Logo / Header area
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: theme.colorScheme.outline),
              ),
            ),
            child: Row(
              mainAxisAlignment: isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.admin_panel_settings_rounded,
                  color: theme.colorScheme.primary,
                  size: 32,
                ),
                if (!isCollapsed) ...[
                  const SizedBox(width: 12),
                  Text(
                    'AdminKit',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Menu list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isSelected = activeIndex == index;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    onTap: () {
                      navigationShell.goBranch(index);
                      if (onSelect != null) onSelect!();
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? theme.colorScheme.primaryContainer : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
                        children: [
                          Icon(
                            isSelected ? item.selectedIcon : item.icon,
                            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
                            size: 22,
                          ),
                          if (!isCollapsed) ...[
                            const SizedBox(width: 12),
                            Text(
                              item.label,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Footer / User Profile shortcut
          if (!isCollapsed)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: theme.colorScheme.outline),
                ),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=256'),
                    radius: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Jane Doe',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Super Admin',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Navbar extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final bool isSidebarCollapsed;
  final VoidCallback onToggleSidebar;

  const _Navbar({
    required this.isMobile,
    required this.isTablet,
    required this.isSidebarCollapsed,
    required this.onToggleSidebar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.outline),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Sidebar menu trigger
          IconButton(
            icon: Icon(
              (isMobile || isTablet)
                  ? Icons.menu
                  : (isSidebarCollapsed ? Icons.menu_open : Icons.menu),
            ),
            onPressed: onToggleSidebar,
          ),
          const SizedBox(width: 8),

          // Title / Dynamic text based on current route
          Text(
            'Admin Dashboard',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),

          // Actions: Notification, Theme Toggle, Profile
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              theme.brightness == Brightness.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme(context);
            },
          ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            onSelected: (val) {
              if (val == 'logout') {
                context.read<AuthCubit>().logout();
              }
            },
            offset: const Offset(0, 48),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person_outline, size: 20),
                    SizedBox(width: 8),
                    Text('My Profile'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 20, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Logout', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=256'),
              radius: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationItem {
  final String label;
  final IconData icon;
  final IconData selectedIcon;

  _NavigationItem(this.label, this.icon, this.selectedIcon);
}

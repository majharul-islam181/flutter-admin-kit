import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_admin_kit/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:flutter_admin_kit/core/theme/theme_cubit.dart';
import 'package:flutter_admin_kit/core/theme/app_colors.dart';

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
              backgroundColor: AppColors.tailAdminSidebar,
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
              color: AppColors.tailAdminSidebar,
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
                    color: theme.brightness == Brightness.light ? const Color(0xFFF1F5F9) : theme.scaffoldBackgroundColor,
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
    final activeIndex = navigationShell.currentIndex;

    final items = [
      _NavigationItem('Dashboard', Icons.dashboard_outlined, Icons.dashboard, hasSubmenu: true),
      _NavigationItem('Calendar', Icons.calendar_today_outlined, Icons.calendar_today),
      _NavigationItem('Profile', Icons.person_outline, Icons.person),
      _NavigationItem('Task', Icons.task_outlined, Icons.task, hasSubmenu: true),
      _NavigationItem('Forms', Icons.edit_note_outlined, Icons.edit_note, hasSubmenu: true),
      _NavigationItem('Tables', Icons.table_chart_outlined, Icons.table_chart),
      _NavigationItem('Pages', Icons.pages_outlined, Icons.pages, hasSubmenu: true),
    ];
    
    final supportItems = [
      _NavigationItem('Messages', Icons.mail_outline, Icons.mail, badge: '5'),
      _NavigationItem('Inbox', Icons.inbox_outlined, Icons.inbox),
      _NavigationItem('Invoice', Icons.receipt_outlined, Icons.receipt),
    ];

    return Container(
      color: AppColors.tailAdminSidebar,
      child: Column(
        children: [
          // Logo / Header area
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.tailAdminPrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.bar_chart,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                if (!isCollapsed) ...[
                  const SizedBox(width: 12),
                  const Text(
                    'TailAdmin',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Menu list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              children: [
                if (!isCollapsed)
                  const Padding(
                    padding: EdgeInsets.only(left: 8, bottom: 16),
                    child: Text(
                      'MENU',
                      style: TextStyle(color: Color(0xFF8A99AF), fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ...items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  // Map the index to our actual routes if possible. Let's just use index 0 for Dashboard.
                  final actualBranchIndex = index < 6 ? index : 0;
                  final isSelected = activeIndex == actualBranchIndex;
                  
                  if (item.label == 'Dashboard') {
                     return _buildSubMenu(context, item, isSelected, actualBranchIndex, ['eCommerce', 'Analytics', 'Marketing', 'CRM']);
                  }

                  return _buildMenuItem(context, item, isSelected, () {
                    navigationShell.goBranch(actualBranchIndex);
                    if (onSelect != null) onSelect!();
                  });
                }),
                
                const SizedBox(height: 24),
                
                if (!isCollapsed)
                  const Padding(
                    padding: EdgeInsets.only(left: 8, bottom: 16),
                    child: Text(
                      'SUPPORT',
                      style: TextStyle(color: Color(0xFF8A99AF), fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                  
                 ...supportItems.map((item) {
                   return _buildMenuItem(context, item, false, () {}, isPro: true);
                 }),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSubMenu(BuildContext context, _NavigationItem item, bool isSelected, int branchIndex, List<String> subItems) {
    if (isCollapsed) return _buildMenuItem(context, item, isSelected, () {
        navigationShell.goBranch(branchIndex);
        if (onSelect != null) onSelect!();
    });
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
             navigationShell.goBranch(branchIndex);
             if (onSelect != null) onSelect!();
          },
          borderRadius: BorderRadius.circular(4),
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF333A48) : Colors.transparent, // tailAdminSidebarHover
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Icon(item.icon, color: Colors.white, size: 20),
                const SizedBox(width: 12),
                Text(item.label, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                const Spacer(),
                const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
        if (isSelected)
          Padding(
            padding: const EdgeInsets.only(left: 36, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: subItems.map((subItem) {
                final isSubSelected = subItem == 'eCommerce';
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Text(
                        subItem,
                        style: TextStyle(
                          color: isSubSelected ? Colors.white : const Color(0xFF8A99AF),
                          fontSize: 15,
                        ),
                      ),
                      if (subItem != 'eCommerce') ...[
                         const Spacer(),
                         Container(
                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                           decoration: BoxDecoration(color: AppColors.tailAdminPrimary, borderRadius: BorderRadius.circular(12)),
                           child: const Text('Pro', style: TextStyle(color: Colors.white, fontSize: 10)),
                         ),
                         const SizedBox(width: 12),
                      ]
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, _NavigationItem item, bool isSelected, VoidCallback onTap, {bool isPro = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF333A48) : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Icon(
                item.icon,
                color: isSelected ? Colors.white : const Color(0xFF8A99AF),
                size: 20,
              ),
              if (!isCollapsed) ...[
                const SizedBox(width: 12),
                Text(
                  item.label,
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF8A99AF),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                if (item.badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: AppColors.tailAdminPrimary, borderRadius: BorderRadius.circular(12)),
                    child: Text(item.badge!, style: const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                if (isPro)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: AppColors.tailAdminPrimary, borderRadius: BorderRadius.circular(12)),
                    child: const Text('Pro', style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                if (item.hasSubmenu)
                   const Icon(Icons.keyboard_arrow_right, color: Color(0xFF8A99AF), size: 20),
              ],
            ],
          ),
        ),
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
      height: 80,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 1),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // Sidebar menu trigger
          IconButton(
            icon: Icon(
              (isMobile || isTablet)
                  ? Icons.menu
                  : (isSidebarCollapsed ? Icons.menu_open : Icons.menu),
              color: theme.colorScheme.onSurfaceVariant,
            ),
            onPressed: onToggleSidebar,
          ),
          const SizedBox(width: 16),
          
          // Search bar
          if (!isMobile)
            Expanded(
              child: Row(
                children: [
                  Icon(Icons.search, color: theme.colorScheme.onSurfaceVariant, size: 20),
                  const SizedBox(width: 12),
                  const Text(
                    'Type to search...',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
            ),
          if (isMobile) const Spacer(),
          
          // Actions
          // Theme Toggle Switch
          Container(
             width: 50,
             height: 26,
             decoration: BoxDecoration(
               color: const Color(0xFFE2E8F0),
               borderRadius: BorderRadius.circular(20),
             ),
             child: Stack(
               children: [
                 Align(
                   alignment: theme.brightness == Brightness.light ? Alignment.centerLeft : Alignment.centerRight,
                   child: GestureDetector(
                     onTap: () => context.read<ThemeCubit>().toggleTheme(context),
                     child: Container(
                       width: 22,
                       height: 22,
                       margin: const EdgeInsets.all(2),
                       decoration: const BoxDecoration(
                         color: Colors.white,
                         shape: BoxShape.circle,
                         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
                       ),
                       child: Icon(
                         theme.brightness == Brightness.light ? Icons.light_mode : Icons.dark_mode,
                         size: 14,
                         color: theme.colorScheme.onSurface,
                       ),
                     ),
                   ),
                 ),
               ],
             ),
          ),
          
          const SizedBox(width: 16),
          // Notification Bell
          Stack(
            children: [
               Container(
                 padding: const EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
                 ),
                 child: Icon(Icons.notifications_none_outlined, size: 20, color: theme.colorScheme.onSurfaceVariant),
               ),
               Positioned(
                 top: 6,
                 right: 8,
                 child: Container(
                   width: 6,
                   height: 6,
                   decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                 ),
               )
            ],
          ),
          const SizedBox(width: 12),
          // Message Chat
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
            ),
            child: Icon(Icons.chat_bubble_outline, size: 20, color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(width: 24),
          
          // Profile
          Row(
            children: [
              if (!isMobile)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Thomas Anree', style: TextStyle(fontWeight: FontWeight.w600, color: theme.colorScheme.onSurface, fontSize: 14)),
                    const Text('UX Designer', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              const SizedBox(width: 12),
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
                  radius: 20,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.keyboard_arrow_down, color: theme.colorScheme.onSurfaceVariant, size: 20),
            ],
          )
        ],
      ),
    );
  }
}

class _NavigationItem {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final bool hasSubmenu;
  final String? badge;

  _NavigationItem(this.label, this.icon, this.selectedIcon, {this.hasSubmenu = false, this.badge});
}

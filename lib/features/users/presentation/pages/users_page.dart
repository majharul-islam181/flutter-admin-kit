import 'package:flutter/material.dart';
import 'package:flutter_admin_kit/core/widgets/app_card.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Management',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Manage your customers, roles, and administrative users.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 24),
            const AppCard(
              title: 'Customer Directory',
              child: Text(
                'This section will house a responsive search/filter/sort data-table representing user accounts, actions to add or disable users, and pagination controls.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

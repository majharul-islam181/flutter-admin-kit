import 'package:flutter/material.dart';
import 'package:flutter_admin_kit/core/widgets/app_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
              'Dashboard Overview',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Welcome back! Here is what is happening with your store today.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 24),
            const AppCard(
              title: 'Welcome to AdminKit',
              child: Text(
                'This is the default dashboard view. In subsequent phases, we will add live KPI cards (revenue, orders, growth) and beautiful charts (sales, traffic trends).',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

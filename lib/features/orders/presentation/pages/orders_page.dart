import 'package:flutter/material.dart';
import 'package:flutter_admin_kit/core/widgets/app_card.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

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
              'Order Registry',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Review transactions, statuses, shipping updates, and timeline history.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 24),
            const AppCard(
              title: 'Purchase Orders',
              child: Text(
                'This section will list e-commerce transactions, state/payment filters, status chips, order history timelines, and detailed invoices.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

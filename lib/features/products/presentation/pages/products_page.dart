import 'package:flutter/material.dart';
import 'package:flutter_admin_kit/core/widgets/app_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

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
              'Product Catalog',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Monitor inventory, categories, price points, and status listings.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 24),
            const AppCard(
              title: 'Inventory Listing',
              child: Text(
                'This section will present product inventory, category grids, search boxes, filters, and full CRUD creation tools for stock items.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

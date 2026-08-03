import 'package:flutter/material.dart';
import 'package:flutter_admin_kit/core/widgets/app_card.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

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
              'Business Intelligence & Analytics',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Deep dive metrics, session stats, sales funnels, and customer conversions.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 24),
            const AppCard(
              title: 'Performance Insights',
              child: Text(
                'This section will present multi-line growth metrics, interactive conversion charts, regional purchase layouts, and device metrics maps.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

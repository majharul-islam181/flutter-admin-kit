import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_admin_kit/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter_admin_kit/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:flutter_admin_kit/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:flutter_admin_kit/features/dashboard/presentation/widgets/stat_card.dart';
import 'package:flutter_admin_kit/features/dashboard/presentation/widgets/revenue_sales_chart.dart';
import 'package:flutter_admin_kit/features/dashboard/presentation/widgets/profit_bar_chart.dart';
import 'package:flutter_admin_kit/injection/injection.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashboardBloc>()..add(const FetchDashboardData()),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading || state is DashboardInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DashboardError) {
            return Center(child: Text('Error: \${state.message}'));
          } else if (state is DashboardLoaded) {
            final data = state.data;
            final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
            final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

            int crossAxisCount = 1;
            if (isDesktop) {
              crossAxisCount = 4;
            } else if (isTablet) {
              crossAxisCount = 2;
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stat Cards Grid
                  GridView.count(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: isDesktop ? 2.2 : 2.5,
                    children: [
                      StatCard(stat: data.totalViews, icon: Icons.remove_red_eye_outlined),
                      StatCard(stat: data.totalProfit, icon: Icons.shopping_cart_outlined),
                      StatCard(stat: data.totalProduct, icon: Icons.shopping_bag_outlined),
                      StatCard(stat: data.totalUsers, icon: Icons.group_outlined),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Charts
                  if (isDesktop)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: RevenueSalesChart(data: data.revenueAndSales),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          flex: 1,
                          child: ProfitBarChart(data: data.profitThisWeek),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        RevenueSalesChart(data: data.revenueAndSales),
                        const SizedBox(height: 24),
                        ProfitBarChart(data: data.profitThisWeek),
                      ],
                    ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

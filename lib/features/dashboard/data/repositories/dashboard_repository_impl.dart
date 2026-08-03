import 'package:dartz/dartz.dart';
import 'package:flutter_admin_kit/core/errors/failures.dart';
import 'package:flutter_admin_kit/features/dashboard/data/models/dashboard_models.dart';
import 'package:flutter_admin_kit/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<Either<Failure, DashboardData>> getDashboardData() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    try {
      final mockData = DashboardData(
        totalViews: const DashboardStat(
          title: 'Total views',
          value: '\$3.456K',
          percentageChange: 0.43,
          isPositive: true,
        ),
        totalProfit: const DashboardStat(
          title: 'Total Profit',
          value: '\$45,2K',
          percentageChange: 4.35,
          isPositive: true,
        ),
        totalProduct: const DashboardStat(
          title: 'Total Product',
          value: '2.450',
          percentageChange: 2.59,
          isPositive: true,
        ),
        totalUsers: const DashboardStat(
          title: 'Total Users',
          value: '3.456',
          percentageChange: 0.95,
          isPositive: false,
        ),
        revenueAndSales: const [
          ChartDataPoint(label: 'Sep', revenue: 20, sales: 30),
          ChartDataPoint(label: 'Oct', revenue: 10, sales: 25),
          ChartDataPoint(label: 'Nov', revenue: 20, sales: 35),
          ChartDataPoint(label: 'Dec', revenue: 30, sales: 30),
          ChartDataPoint(label: 'Jan', revenue: 15, sales: 45),
          ChartDataPoint(label: 'Feb', revenue: 25, sales: 35),
          ChartDataPoint(label: 'Mar', revenue: 35, sales: 65),
          ChartDataPoint(label: 'Apr', revenue: 20, sales: 50),
          ChartDataPoint(label: 'May', revenue: 45, sales: 60),
          ChartDataPoint(label: 'Jun', revenue: 20, sales: 35),
          ChartDataPoint(label: 'Jul', revenue: 30, sales: 40),
          ChartDataPoint(label: 'Aug', revenue: 45, sales: 50),
        ],
        profitThisWeek: const [
          ProfitDataPoint(day: 'M', salesProfit: 42, revenueProfit: 15),
          ProfitDataPoint(day: 'T', salesProfit: 55, revenueProfit: 25),
          ProfitDataPoint(day: 'W', salesProfit: 40, revenueProfit: 20),
          ProfitDataPoint(day: 'T', salesProfit: 68, revenueProfit: 8),
          ProfitDataPoint(day: 'F', salesProfit: 20, revenueProfit: 15),
          ProfitDataPoint(day: 'S', salesProfit: 42, revenueProfit: 28),
          ProfitDataPoint(day: 'S', salesProfit: 65, revenueProfit: 15),
        ],
      );

      return Right(mockData);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

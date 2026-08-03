import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_models.freezed.dart';
part 'dashboard_models.g.dart';

@freezed
class DashboardStat with _$DashboardStat {
  const factory DashboardStat({
    required String title,
    required String value,
    required double percentageChange,
    required bool isPositive,
  }) = _DashboardStat;

  factory DashboardStat.fromJson(Map<String, dynamic> json) => _$DashboardStatFromJson(json);
}

@freezed
class ChartDataPoint with _$ChartDataPoint {
  const factory ChartDataPoint({
    required String label,
    required double revenue,
    required double sales,
  }) = _ChartDataPoint;

  factory ChartDataPoint.fromJson(Map<String, dynamic> json) => _$ChartDataPointFromJson(json);
}

@freezed
class ProfitDataPoint with _$ProfitDataPoint {
  const factory ProfitDataPoint({
    required String day,
    required double salesProfit,
    required double revenueProfit,
  }) = _ProfitDataPoint;

  factory ProfitDataPoint.fromJson(Map<String, dynamic> json) => _$ProfitDataPointFromJson(json);
}

@freezed
class DashboardData with _$DashboardData {
  const factory DashboardData({
    required DashboardStat totalViews,
    required DashboardStat totalProfit,
    required DashboardStat totalProduct,
    required DashboardStat totalUsers,
    required List<ChartDataPoint> revenueAndSales,
    required List<ProfitDataPoint> profitThisWeek,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, dynamic> json) => _$DashboardDataFromJson(json);
}

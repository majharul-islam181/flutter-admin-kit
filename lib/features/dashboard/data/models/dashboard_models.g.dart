// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardStatImpl _$$DashboardStatImplFromJson(Map<String, dynamic> json) =>
    _$DashboardStatImpl(
      title: json['title'] as String,
      value: json['value'] as String,
      percentageChange: (json['percentageChange'] as num).toDouble(),
      isPositive: json['isPositive'] as bool,
    );

Map<String, dynamic> _$$DashboardStatImplToJson(_$DashboardStatImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'value': instance.value,
      'percentageChange': instance.percentageChange,
      'isPositive': instance.isPositive,
    };

_$ChartDataPointImpl _$$ChartDataPointImplFromJson(Map<String, dynamic> json) =>
    _$ChartDataPointImpl(
      label: json['label'] as String,
      revenue: (json['revenue'] as num).toDouble(),
      sales: (json['sales'] as num).toDouble(),
    );

Map<String, dynamic> _$$ChartDataPointImplToJson(
  _$ChartDataPointImpl instance,
) => <String, dynamic>{
  'label': instance.label,
  'revenue': instance.revenue,
  'sales': instance.sales,
};

_$ProfitDataPointImpl _$$ProfitDataPointImplFromJson(
  Map<String, dynamic> json,
) => _$ProfitDataPointImpl(
  day: json['day'] as String,
  salesProfit: (json['salesProfit'] as num).toDouble(),
  revenueProfit: (json['revenueProfit'] as num).toDouble(),
);

Map<String, dynamic> _$$ProfitDataPointImplToJson(
  _$ProfitDataPointImpl instance,
) => <String, dynamic>{
  'day': instance.day,
  'salesProfit': instance.salesProfit,
  'revenueProfit': instance.revenueProfit,
};

_$DashboardDataImpl _$$DashboardDataImplFromJson(Map<String, dynamic> json) =>
    _$DashboardDataImpl(
      totalViews: DashboardStat.fromJson(
        json['totalViews'] as Map<String, dynamic>,
      ),
      totalProfit: DashboardStat.fromJson(
        json['totalProfit'] as Map<String, dynamic>,
      ),
      totalProduct: DashboardStat.fromJson(
        json['totalProduct'] as Map<String, dynamic>,
      ),
      totalUsers: DashboardStat.fromJson(
        json['totalUsers'] as Map<String, dynamic>,
      ),
      revenueAndSales: (json['revenueAndSales'] as List<dynamic>)
          .map((e) => ChartDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      profitThisWeek: (json['profitThisWeek'] as List<dynamic>)
          .map((e) => ProfitDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardDataImplToJson(_$DashboardDataImpl instance) =>
    <String, dynamic>{
      'totalViews': instance.totalViews,
      'totalProfit': instance.totalProfit,
      'totalProduct': instance.totalProduct,
      'totalUsers': instance.totalUsers,
      'revenueAndSales': instance.revenueAndSales,
      'profitThisWeek': instance.profitThisWeek,
    };

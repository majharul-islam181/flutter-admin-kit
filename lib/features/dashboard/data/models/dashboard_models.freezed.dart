// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DashboardStat _$DashboardStatFromJson(Map<String, dynamic> json) {
  return _DashboardStat.fromJson(json);
}

/// @nodoc
mixin _$DashboardStat {
  String get title => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  double get percentageChange => throw _privateConstructorUsedError;
  bool get isPositive => throw _privateConstructorUsedError;

  /// Serializes this DashboardStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStatCopyWith<DashboardStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatCopyWith<$Res> {
  factory $DashboardStatCopyWith(
    DashboardStat value,
    $Res Function(DashboardStat) then,
  ) = _$DashboardStatCopyWithImpl<$Res, DashboardStat>;
  @useResult
  $Res call({
    String title,
    String value,
    double percentageChange,
    bool isPositive,
  });
}

/// @nodoc
class _$DashboardStatCopyWithImpl<$Res, $Val extends DashboardStat>
    implements $DashboardStatCopyWith<$Res> {
  _$DashboardStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? percentageChange = null,
    Object? isPositive = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            percentageChange: null == percentageChange
                ? _value.percentageChange
                : percentageChange // ignore: cast_nullable_to_non_nullable
                      as double,
            isPositive: null == isPositive
                ? _value.isPositive
                : isPositive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardStatImplCopyWith<$Res>
    implements $DashboardStatCopyWith<$Res> {
  factory _$$DashboardStatImplCopyWith(
    _$DashboardStatImpl value,
    $Res Function(_$DashboardStatImpl) then,
  ) = __$$DashboardStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String value,
    double percentageChange,
    bool isPositive,
  });
}

/// @nodoc
class __$$DashboardStatImplCopyWithImpl<$Res>
    extends _$DashboardStatCopyWithImpl<$Res, _$DashboardStatImpl>
    implements _$$DashboardStatImplCopyWith<$Res> {
  __$$DashboardStatImplCopyWithImpl(
    _$DashboardStatImpl _value,
    $Res Function(_$DashboardStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? percentageChange = null,
    Object? isPositive = null,
  }) {
    return _then(
      _$DashboardStatImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        percentageChange: null == percentageChange
            ? _value.percentageChange
            : percentageChange // ignore: cast_nullable_to_non_nullable
                  as double,
        isPositive: null == isPositive
            ? _value.isPositive
            : isPositive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatImpl implements _DashboardStat {
  const _$DashboardStatImpl({
    required this.title,
    required this.value,
    required this.percentageChange,
    required this.isPositive,
  });

  factory _$DashboardStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatImplFromJson(json);

  @override
  final String title;
  @override
  final String value;
  @override
  final double percentageChange;
  @override
  final bool isPositive;

  @override
  String toString() {
    return 'DashboardStat(title: $title, value: $value, percentageChange: $percentageChange, isPositive: $isPositive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.percentageChange, percentageChange) ||
                other.percentageChange == percentageChange) &&
            (identical(other.isPositive, isPositive) ||
                other.isPositive == isPositive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, value, percentageChange, isPositive);

  /// Create a copy of DashboardStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatImplCopyWith<_$DashboardStatImpl> get copyWith =>
      __$$DashboardStatImplCopyWithImpl<_$DashboardStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatImplToJson(this);
  }
}

abstract class _DashboardStat implements DashboardStat {
  const factory _DashboardStat({
    required final String title,
    required final String value,
    required final double percentageChange,
    required final bool isPositive,
  }) = _$DashboardStatImpl;

  factory _DashboardStat.fromJson(Map<String, dynamic> json) =
      _$DashboardStatImpl.fromJson;

  @override
  String get title;
  @override
  String get value;
  @override
  double get percentageChange;
  @override
  bool get isPositive;

  /// Create a copy of DashboardStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStatImplCopyWith<_$DashboardStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartDataPoint _$ChartDataPointFromJson(Map<String, dynamic> json) {
  return _ChartDataPoint.fromJson(json);
}

/// @nodoc
mixin _$ChartDataPoint {
  String get label => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  double get sales => throw _privateConstructorUsedError;

  /// Serializes this ChartDataPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartDataPointCopyWith<ChartDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataPointCopyWith<$Res> {
  factory $ChartDataPointCopyWith(
    ChartDataPoint value,
    $Res Function(ChartDataPoint) then,
  ) = _$ChartDataPointCopyWithImpl<$Res, ChartDataPoint>;
  @useResult
  $Res call({String label, double revenue, double sales});
}

/// @nodoc
class _$ChartDataPointCopyWithImpl<$Res, $Val extends ChartDataPoint>
    implements $ChartDataPointCopyWith<$Res> {
  _$ChartDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? revenue = null,
    Object? sales = null,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            revenue: null == revenue
                ? _value.revenue
                : revenue // ignore: cast_nullable_to_non_nullable
                      as double,
            sales: null == sales
                ? _value.sales
                : sales // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChartDataPointImplCopyWith<$Res>
    implements $ChartDataPointCopyWith<$Res> {
  factory _$$ChartDataPointImplCopyWith(
    _$ChartDataPointImpl value,
    $Res Function(_$ChartDataPointImpl) then,
  ) = __$$ChartDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double revenue, double sales});
}

/// @nodoc
class __$$ChartDataPointImplCopyWithImpl<$Res>
    extends _$ChartDataPointCopyWithImpl<$Res, _$ChartDataPointImpl>
    implements _$$ChartDataPointImplCopyWith<$Res> {
  __$$ChartDataPointImplCopyWithImpl(
    _$ChartDataPointImpl _value,
    $Res Function(_$ChartDataPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? revenue = null,
    Object? sales = null,
  }) {
    return _then(
      _$ChartDataPointImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        revenue: null == revenue
            ? _value.revenue
            : revenue // ignore: cast_nullable_to_non_nullable
                  as double,
        sales: null == sales
            ? _value.sales
            : sales // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartDataPointImpl implements _ChartDataPoint {
  const _$ChartDataPointImpl({
    required this.label,
    required this.revenue,
    required this.sales,
  });

  factory _$ChartDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartDataPointImplFromJson(json);

  @override
  final String label;
  @override
  final double revenue;
  @override
  final double sales;

  @override
  String toString() {
    return 'ChartDataPoint(label: $label, revenue: $revenue, sales: $sales)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDataPointImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.sales, sales) || other.sales == sales));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, revenue, sales);

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartDataPointImplCopyWith<_$ChartDataPointImpl> get copyWith =>
      __$$ChartDataPointImplCopyWithImpl<_$ChartDataPointImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartDataPointImplToJson(this);
  }
}

abstract class _ChartDataPoint implements ChartDataPoint {
  const factory _ChartDataPoint({
    required final String label,
    required final double revenue,
    required final double sales,
  }) = _$ChartDataPointImpl;

  factory _ChartDataPoint.fromJson(Map<String, dynamic> json) =
      _$ChartDataPointImpl.fromJson;

  @override
  String get label;
  @override
  double get revenue;
  @override
  double get sales;

  /// Create a copy of ChartDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartDataPointImplCopyWith<_$ChartDataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfitDataPoint _$ProfitDataPointFromJson(Map<String, dynamic> json) {
  return _ProfitDataPoint.fromJson(json);
}

/// @nodoc
mixin _$ProfitDataPoint {
  String get day => throw _privateConstructorUsedError;
  double get salesProfit => throw _privateConstructorUsedError;
  double get revenueProfit => throw _privateConstructorUsedError;

  /// Serializes this ProfitDataPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfitDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfitDataPointCopyWith<ProfitDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitDataPointCopyWith<$Res> {
  factory $ProfitDataPointCopyWith(
    ProfitDataPoint value,
    $Res Function(ProfitDataPoint) then,
  ) = _$ProfitDataPointCopyWithImpl<$Res, ProfitDataPoint>;
  @useResult
  $Res call({String day, double salesProfit, double revenueProfit});
}

/// @nodoc
class _$ProfitDataPointCopyWithImpl<$Res, $Val extends ProfitDataPoint>
    implements $ProfitDataPointCopyWith<$Res> {
  _$ProfitDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfitDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? salesProfit = null,
    Object? revenueProfit = null,
  }) {
    return _then(
      _value.copyWith(
            day: null == day
                ? _value.day
                : day // ignore: cast_nullable_to_non_nullable
                      as String,
            salesProfit: null == salesProfit
                ? _value.salesProfit
                : salesProfit // ignore: cast_nullable_to_non_nullable
                      as double,
            revenueProfit: null == revenueProfit
                ? _value.revenueProfit
                : revenueProfit // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfitDataPointImplCopyWith<$Res>
    implements $ProfitDataPointCopyWith<$Res> {
  factory _$$ProfitDataPointImplCopyWith(
    _$ProfitDataPointImpl value,
    $Res Function(_$ProfitDataPointImpl) then,
  ) = __$$ProfitDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String day, double salesProfit, double revenueProfit});
}

/// @nodoc
class __$$ProfitDataPointImplCopyWithImpl<$Res>
    extends _$ProfitDataPointCopyWithImpl<$Res, _$ProfitDataPointImpl>
    implements _$$ProfitDataPointImplCopyWith<$Res> {
  __$$ProfitDataPointImplCopyWithImpl(
    _$ProfitDataPointImpl _value,
    $Res Function(_$ProfitDataPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfitDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? salesProfit = null,
    Object? revenueProfit = null,
  }) {
    return _then(
      _$ProfitDataPointImpl(
        day: null == day
            ? _value.day
            : day // ignore: cast_nullable_to_non_nullable
                  as String,
        salesProfit: null == salesProfit
            ? _value.salesProfit
            : salesProfit // ignore: cast_nullable_to_non_nullable
                  as double,
        revenueProfit: null == revenueProfit
            ? _value.revenueProfit
            : revenueProfit // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfitDataPointImpl implements _ProfitDataPoint {
  const _$ProfitDataPointImpl({
    required this.day,
    required this.salesProfit,
    required this.revenueProfit,
  });

  factory _$ProfitDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfitDataPointImplFromJson(json);

  @override
  final String day;
  @override
  final double salesProfit;
  @override
  final double revenueProfit;

  @override
  String toString() {
    return 'ProfitDataPoint(day: $day, salesProfit: $salesProfit, revenueProfit: $revenueProfit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitDataPointImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.salesProfit, salesProfit) ||
                other.salesProfit == salesProfit) &&
            (identical(other.revenueProfit, revenueProfit) ||
                other.revenueProfit == revenueProfit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, salesProfit, revenueProfit);

  /// Create a copy of ProfitDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitDataPointImplCopyWith<_$ProfitDataPointImpl> get copyWith =>
      __$$ProfitDataPointImplCopyWithImpl<_$ProfitDataPointImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfitDataPointImplToJson(this);
  }
}

abstract class _ProfitDataPoint implements ProfitDataPoint {
  const factory _ProfitDataPoint({
    required final String day,
    required final double salesProfit,
    required final double revenueProfit,
  }) = _$ProfitDataPointImpl;

  factory _ProfitDataPoint.fromJson(Map<String, dynamic> json) =
      _$ProfitDataPointImpl.fromJson;

  @override
  String get day;
  @override
  double get salesProfit;
  @override
  double get revenueProfit;

  /// Create a copy of ProfitDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfitDataPointImplCopyWith<_$ProfitDataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) {
  return _DashboardData.fromJson(json);
}

/// @nodoc
mixin _$DashboardData {
  DashboardStat get totalViews => throw _privateConstructorUsedError;
  DashboardStat get totalProfit => throw _privateConstructorUsedError;
  DashboardStat get totalProduct => throw _privateConstructorUsedError;
  DashboardStat get totalUsers => throw _privateConstructorUsedError;
  List<ChartDataPoint> get revenueAndSales =>
      throw _privateConstructorUsedError;
  List<ProfitDataPoint> get profitThisWeek =>
      throw _privateConstructorUsedError;

  /// Serializes this DashboardData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
    DashboardData value,
    $Res Function(DashboardData) then,
  ) = _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call({
    DashboardStat totalViews,
    DashboardStat totalProfit,
    DashboardStat totalProduct,
    DashboardStat totalUsers,
    List<ChartDataPoint> revenueAndSales,
    List<ProfitDataPoint> profitThisWeek,
  });

  $DashboardStatCopyWith<$Res> get totalViews;
  $DashboardStatCopyWith<$Res> get totalProfit;
  $DashboardStatCopyWith<$Res> get totalProduct;
  $DashboardStatCopyWith<$Res> get totalUsers;
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalViews = null,
    Object? totalProfit = null,
    Object? totalProduct = null,
    Object? totalUsers = null,
    Object? revenueAndSales = null,
    Object? profitThisWeek = null,
  }) {
    return _then(
      _value.copyWith(
            totalViews: null == totalViews
                ? _value.totalViews
                : totalViews // ignore: cast_nullable_to_non_nullable
                      as DashboardStat,
            totalProfit: null == totalProfit
                ? _value.totalProfit
                : totalProfit // ignore: cast_nullable_to_non_nullable
                      as DashboardStat,
            totalProduct: null == totalProduct
                ? _value.totalProduct
                : totalProduct // ignore: cast_nullable_to_non_nullable
                      as DashboardStat,
            totalUsers: null == totalUsers
                ? _value.totalUsers
                : totalUsers // ignore: cast_nullable_to_non_nullable
                      as DashboardStat,
            revenueAndSales: null == revenueAndSales
                ? _value.revenueAndSales
                : revenueAndSales // ignore: cast_nullable_to_non_nullable
                      as List<ChartDataPoint>,
            profitThisWeek: null == profitThisWeek
                ? _value.profitThisWeek
                : profitThisWeek // ignore: cast_nullable_to_non_nullable
                      as List<ProfitDataPoint>,
          )
          as $Val,
    );
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardStatCopyWith<$Res> get totalViews {
    return $DashboardStatCopyWith<$Res>(_value.totalViews, (value) {
      return _then(_value.copyWith(totalViews: value) as $Val);
    });
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardStatCopyWith<$Res> get totalProfit {
    return $DashboardStatCopyWith<$Res>(_value.totalProfit, (value) {
      return _then(_value.copyWith(totalProfit: value) as $Val);
    });
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardStatCopyWith<$Res> get totalProduct {
    return $DashboardStatCopyWith<$Res>(_value.totalProduct, (value) {
      return _then(_value.copyWith(totalProduct: value) as $Val);
    });
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardStatCopyWith<$Res> get totalUsers {
    return $DashboardStatCopyWith<$Res>(_value.totalUsers, (value) {
      return _then(_value.copyWith(totalUsers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
    _$DashboardDataImpl value,
    $Res Function(_$DashboardDataImpl) then,
  ) = __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DashboardStat totalViews,
    DashboardStat totalProfit,
    DashboardStat totalProduct,
    DashboardStat totalUsers,
    List<ChartDataPoint> revenueAndSales,
    List<ProfitDataPoint> profitThisWeek,
  });

  @override
  $DashboardStatCopyWith<$Res> get totalViews;
  @override
  $DashboardStatCopyWith<$Res> get totalProfit;
  @override
  $DashboardStatCopyWith<$Res> get totalProduct;
  @override
  $DashboardStatCopyWith<$Res> get totalUsers;
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
    _$DashboardDataImpl _value,
    $Res Function(_$DashboardDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalViews = null,
    Object? totalProfit = null,
    Object? totalProduct = null,
    Object? totalUsers = null,
    Object? revenueAndSales = null,
    Object? profitThisWeek = null,
  }) {
    return _then(
      _$DashboardDataImpl(
        totalViews: null == totalViews
            ? _value.totalViews
            : totalViews // ignore: cast_nullable_to_non_nullable
                  as DashboardStat,
        totalProfit: null == totalProfit
            ? _value.totalProfit
            : totalProfit // ignore: cast_nullable_to_non_nullable
                  as DashboardStat,
        totalProduct: null == totalProduct
            ? _value.totalProduct
            : totalProduct // ignore: cast_nullable_to_non_nullable
                  as DashboardStat,
        totalUsers: null == totalUsers
            ? _value.totalUsers
            : totalUsers // ignore: cast_nullable_to_non_nullable
                  as DashboardStat,
        revenueAndSales: null == revenueAndSales
            ? _value._revenueAndSales
            : revenueAndSales // ignore: cast_nullable_to_non_nullable
                  as List<ChartDataPoint>,
        profitThisWeek: null == profitThisWeek
            ? _value._profitThisWeek
            : profitThisWeek // ignore: cast_nullable_to_non_nullable
                  as List<ProfitDataPoint>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataImpl implements _DashboardData {
  const _$DashboardDataImpl({
    required this.totalViews,
    required this.totalProfit,
    required this.totalProduct,
    required this.totalUsers,
    required final List<ChartDataPoint> revenueAndSales,
    required final List<ProfitDataPoint> profitThisWeek,
  }) : _revenueAndSales = revenueAndSales,
       _profitThisWeek = profitThisWeek;

  factory _$DashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataImplFromJson(json);

  @override
  final DashboardStat totalViews;
  @override
  final DashboardStat totalProfit;
  @override
  final DashboardStat totalProduct;
  @override
  final DashboardStat totalUsers;
  final List<ChartDataPoint> _revenueAndSales;
  @override
  List<ChartDataPoint> get revenueAndSales {
    if (_revenueAndSales is EqualUnmodifiableListView) return _revenueAndSales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_revenueAndSales);
  }

  final List<ProfitDataPoint> _profitThisWeek;
  @override
  List<ProfitDataPoint> get profitThisWeek {
    if (_profitThisWeek is EqualUnmodifiableListView) return _profitThisWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profitThisWeek);
  }

  @override
  String toString() {
    return 'DashboardData(totalViews: $totalViews, totalProfit: $totalProfit, totalProduct: $totalProduct, totalUsers: $totalUsers, revenueAndSales: $revenueAndSales, profitThisWeek: $profitThisWeek)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            (identical(other.totalViews, totalViews) ||
                other.totalViews == totalViews) &&
            (identical(other.totalProfit, totalProfit) ||
                other.totalProfit == totalProfit) &&
            (identical(other.totalProduct, totalProduct) ||
                other.totalProduct == totalProduct) &&
            (identical(other.totalUsers, totalUsers) ||
                other.totalUsers == totalUsers) &&
            const DeepCollectionEquality().equals(
              other._revenueAndSales,
              _revenueAndSales,
            ) &&
            const DeepCollectionEquality().equals(
              other._profitThisWeek,
              _profitThisWeek,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalViews,
    totalProfit,
    totalProduct,
    totalUsers,
    const DeepCollectionEquality().hash(_revenueAndSales),
    const DeepCollectionEquality().hash(_profitThisWeek),
  );

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataImplToJson(this);
  }
}

abstract class _DashboardData implements DashboardData {
  const factory _DashboardData({
    required final DashboardStat totalViews,
    required final DashboardStat totalProfit,
    required final DashboardStat totalProduct,
    required final DashboardStat totalUsers,
    required final List<ChartDataPoint> revenueAndSales,
    required final List<ProfitDataPoint> profitThisWeek,
  }) = _$DashboardDataImpl;

  factory _DashboardData.fromJson(Map<String, dynamic> json) =
      _$DashboardDataImpl.fromJson;

  @override
  DashboardStat get totalViews;
  @override
  DashboardStat get totalProfit;
  @override
  DashboardStat get totalProduct;
  @override
  DashboardStat get totalUsers;
  @override
  List<ChartDataPoint> get revenueAndSales;
  @override
  List<ProfitDataPoint> get profitThisWeek;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

import 'package:flutter_admin_kit/core/errors/failures.dart';
import 'package:flutter_admin_kit/features/dashboard/data/models/dashboard_models.dart';
import 'package:dartz/dartz.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardData>> getDashboardData();
}

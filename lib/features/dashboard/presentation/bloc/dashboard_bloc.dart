import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_admin_kit/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:flutter_admin_kit/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:flutter_admin_kit/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository _repository;

  DashboardBloc(this._repository) : super(DashboardInitial()) {
    on<FetchDashboardData>(_onFetchDashboardData);
  }

  Future<void> _onFetchDashboardData(
    FetchDashboardData event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());

    final result = await _repository.getDashboardData();

    result.fold(
      (failure) => emit(DashboardError(failure.message)),
      (data) => emit(DashboardLoaded(data)),
    );
  }
}

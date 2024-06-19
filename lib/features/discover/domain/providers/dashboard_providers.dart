import 'package:flutter_project/features/discover/data/datasource/dashboard_remote_datasource.dart';
import 'package:flutter_project/features/discover/data/repositories/dashboard_repository.dart';
import 'package:flutter_project/features/discover/domain/repositories/dashboard_repository.dart';
import 'package:flutter_project/shared/data/remote/network_service.dart';
import 'package:flutter_project/shared/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final discoverDatasourceProvider =
    Provider.family<DashboardDatasource, NetworkService>(
  (_, networkService) => DashboardRemoteDatasource(networkService),
);

final dashboardDatasourceProvider =
Provider.family<DashboardDatasource, NetworkService>(
      (_, networkService) => DashboardRemoteDatasource(networkService),
);

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(dashboardDatasourceProvider(networkService));
  final repository = DashboardRepositoryImpl(datasource);

  return repository;
});
//
import 'package:flutter_project/features/discover/domain/providers/dashboard_providers.dart';
import 'package:flutter_project/features/discover/presentation/providers/state/dashboard_notifier.dart';
import 'package:flutter_project/features/discover/presentation/providers/state/dashboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return DashboardNotifier(repository)..fetchProducts();
});

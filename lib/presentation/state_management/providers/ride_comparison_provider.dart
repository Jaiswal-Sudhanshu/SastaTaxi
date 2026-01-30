import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sasta_taxi/data/models/comparison_result_model.dart';
import 'package:sasta_taxi/data/models/ride_provider_model.dart';
import 'package:sasta_taxi/data/repositories/ride_comparison_repository.dart';

/// State for ride comparison
class RideComparisonState {
  final bool isLoading;
  final ComparisonResultModel? comparisonResult;
  final List<RideProviderModel> filteredRides;
  final String? error;
  final String? sortBy;
  
  RideComparisonState({
    this.isLoading = false,
    this.comparisonResult,
    this.filteredRides = const [],
    this.error,
    this.sortBy = 'price_low',
  });
  
  RideComparisonState copyWith({
    bool? isLoading,
    ComparisonResultModel? comparisonResult,
    List<RideProviderModel>? filteredRides,
    String? error,
    String? sortBy,
  }) {
    return RideComparisonState(
      isLoading: isLoading ?? this.isLoading,
      comparisonResult: comparisonResult ?? this.comparisonResult,
      filteredRides: filteredRides ?? this.filteredRides,
      error: error,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}

/// Provider for ride comparison
class RideComparisonNotifier extends StateNotifier<RideComparisonState> {
  final RideComparisonRepository _repository;
  
  RideComparisonNotifier(this._repository) : super(RideComparisonState());
  
  /// Fetch ride prices for a route
  Future<void> fetchRidePrices({
    required String source,
    required String destination,
    required String city,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final result = await _repository.fetchRidePrices(
        source: source,
        destination: destination,
        city: city,
      );
      
      // Sort by default sort option
      final sorted = _repository.sortRides(
        rides: result.rideOptions,
        sortBy: state.sortBy ?? 'price_low',
      );
      
      state = state.copyWith(
        isLoading: false,
        comparisonResult: result,
        filteredRides: sorted,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
  
  /// Apply filters to ride options
  void applyFilters({
    double? minPrice,
    double? maxPrice,
    List<String>? providers,
    List<String>? vehicleCategories,
  }) {
    if (state.comparisonResult == null) return;
    
    var filtered = _repository.filterRides(
      rides: state.comparisonResult!.rideOptions,
      minPrice: minPrice,
      maxPrice: maxPrice,
      providers: providers,
      vehicleCategories: vehicleCategories,
    );
    
    // Apply current sort
    filtered = _repository.sortRides(
      rides: filtered,
      sortBy: state.sortBy ?? 'price_low',
    );
    
    state = state.copyWith(filteredRides: filtered);
  }
  
  /// Sort ride options
  void sortRides(String sortBy) {
    if (state.filteredRides.isEmpty) return;
    
    final sorted = _repository.sortRides(
      rides: state.filteredRides,
      sortBy: sortBy,
    );
    
    state = state.copyWith(
      filteredRides: sorted,
      sortBy: sortBy,
    );
  }
  
  /// Reset filters
  void resetFilters() {
    if (state.comparisonResult == null) return;
    
    final sorted = _repository.sortRides(
      rides: state.comparisonResult!.rideOptions,
      sortBy: state.sortBy ?? 'price_low',
    );
    
    state = state.copyWith(filteredRides: sorted);
  }
}

/// Providers
final rideComparisonRepositoryProvider = Provider<RideComparisonRepository>((ref) {
  return RideComparisonRepository();
});

final rideComparisonProvider =
    StateNotifierProvider<RideComparisonNotifier, RideComparisonState>((ref) {
  final repository = ref.watch(rideComparisonRepositoryProvider);
  return RideComparisonNotifier(repository);
});

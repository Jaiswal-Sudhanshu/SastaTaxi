import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sasta_taxi/data/models/city_model.dart';
import 'package:sasta_taxi/data/repositories/city_data_repository.dart';

/// State for city selection
class CitySelectionState {
  final List<CityModel> allCities;
  final List<CityModel> metroCities;
  final List<CityModel> nonMetroCities;
  final List<CityModel> searchResults;
  final CityModel? selectedCity;
  final bool isLoading;
  final String? error;
  
  CitySelectionState({
    this.allCities = const [],
    this.metroCities = const [],
    this.nonMetroCities = const [],
    this.searchResults = const [],
    this.selectedCity,
    this.isLoading = false,
    this.error,
  });
  
  CitySelectionState copyWith({
    List<CityModel>? allCities,
    List<CityModel>? metroCities,
    List<CityModel>? nonMetroCities,
    List<CityModel>? searchResults,
    CityModel? selectedCity,
    bool? isLoading,
    String? error,
  }) {
    return CitySelectionState(
      allCities: allCities ?? this.allCities,
      metroCities: metroCities ?? this.metroCities,
      nonMetroCities: nonMetroCities ?? this.nonMetroCities,
      searchResults: searchResults ?? this.searchResults,
      selectedCity: selectedCity ?? this.selectedCity,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Notifier for city selection
class CitySelectionNotifier extends StateNotifier<CitySelectionState> {
  final CityDataRepository _repository;
  
  CitySelectionNotifier(this._repository) : super(CitySelectionState()) {
    _loadCities();
  }
  
  Future<void> _loadCities() async {
    state = state.copyWith(isLoading: true);
    
    try {
      final allCities = await _repository.getAllCities();
      final metroCities = await _repository.getMetroCities();
      final nonMetroCities = await _repository.getNonMetroCities();
      
      state = state.copyWith(
        allCities: allCities,
        metroCities: metroCities,
        nonMetroCities: nonMetroCities,
        searchResults: allCities,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
  
  /// Search cities
  Future<void> searchCities(String query) async {
    if (query.isEmpty) {
      state = state.copyWith(searchResults: state.allCities);
      return;
    }
    
    try {
      final results = await _repository.searchCities(query);
      state = state.copyWith(searchResults: results);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
  
  /// Select a city
  void selectCity(CityModel city) {
    state = state.copyWith(selectedCity: city);
  }
  
  /// Clear selection
  void clearSelection() {
    state = state.copyWith(selectedCity: null);
  }
}

/// Providers
final cityDataRepositoryProvider = Provider<CityDataRepository>((ref) {
  return CityDataRepository();
});

final citySelectionProvider =
    StateNotifierProvider<CitySelectionNotifier, CitySelectionState>((ref) {
  final repository = ref.watch(cityDataRepositoryProvider);
  return CitySelectionNotifier(repository);
});

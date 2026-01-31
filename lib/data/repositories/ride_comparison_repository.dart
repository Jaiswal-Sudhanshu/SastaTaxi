import 'package:sasta_taxi/data/models/ride_provider_model.dart';
import 'package:sasta_taxi/data/models/comparison_result_model.dart';
import 'package:sasta_taxi/data/models/route_info_model.dart';
import 'package:sasta_taxi/data/data_sources/local/mock_ride_data.dart';
import 'package:sasta_taxi/core/utils/city_classifier.dart';
import 'package:sasta_taxi/core/utils/distance_estimator.dart';

/// Repository for ride comparison operations
class RideComparisonRepository {
  /// Fetch ride prices for a given route
  Future<ComparisonResultModel> fetchRidePrices({
    required String source,
    required String destination,
    required String city,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    final isMetroCity = CityClassifier.isMetroCity(city);
    
    final rideOptions = MockRideData.generateRideOptions(
      source: source,
      destination: destination,
      isMetroCity: isMetroCity,
    );
    
    return ComparisonResultModel.fromRideOptions(rideOptions);
  }
  
  /// Filter ride options based on criteria
  List<RideProviderModel> filterRides({
    required List<RideProviderModel> rides,
    double? minPrice,
    double? maxPrice,
    List<String>? providers,
    List<String>? vehicleCategories,
  }) {
    var filtered = rides;
    
    // Filter by price range
    if (minPrice != null) {
      filtered = filtered.where((ride) => ride.price >= minPrice).toList();
    }
    if (maxPrice != null) {
      filtered = filtered.where((ride) => ride.price <= maxPrice).toList();
    }
    
    // Filter by providers
    if (providers != null && providers.isNotEmpty) {
      filtered = filtered
          .where((ride) => providers.contains(ride.providerName))
          .toList();
    }
    
    // Filter by vehicle categories
    if (vehicleCategories != null && vehicleCategories.isNotEmpty) {
      filtered = filtered
          .where((ride) => vehicleCategories.contains(ride.vehicleCategory))
          .toList();
    }
    
    return filtered;
  }
  
  /// Sort ride options
  List<RideProviderModel> sortRides({
    required List<RideProviderModel> rides,
    required String sortBy,
  }) {
    final sorted = List<RideProviderModel>.from(rides);
    
    switch (sortBy.toLowerCase()) {
      case 'price_low':
        sorted.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'price_high':
        sorted.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'time':
        sorted.sort((a, b) => a.estimatedTime.compareTo(b.estimatedTime));
        break;
      case 'rating':
        sorted.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      default:
        // Default: sort by price low to high
        sorted.sort((a, b) => a.price.compareTo(b.price));
    }
    
    return sorted;
  }
  
  /// Save ride search to history
  Future<void> saveToHistory(RouteInfoModel route) async {
    // In real app, this would save to shared preferences
    await Future.delayed(const Duration(milliseconds: 100));
    // Implementation would use shared_preferences
  }
  
  /// Get search history
  Future<List<RouteInfoModel>> getSearchHistory() async {
    await Future.delayed(const Duration(milliseconds: 100));
    // Would retrieve from shared preferences
    return [];
  }
}

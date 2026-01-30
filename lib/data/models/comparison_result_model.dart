import 'package:sasta_taxi/data/models/ride_provider_model.dart';

/// Model for comparison results with analysis
class ComparisonResultModel {
  final List<RideProviderModel> rideOptions;
  final RideProviderModel? cheapestOption;
  final RideProviderModel? fastestOption;
  final RideProviderModel? recommendedOption;
  final double averagePrice;
  final double maxSavings;
  
  ComparisonResultModel({
    required this.rideOptions,
    this.cheapestOption,
    this.fastestOption,
    this.recommendedOption,
    required this.averagePrice,
    required this.maxSavings,
  });
  
  /// Calculate comparison statistics
  factory ComparisonResultModel.fromRideOptions(
    List<RideProviderModel> options,
  ) {
    if (options.isEmpty) {
      return ComparisonResultModel(
        rideOptions: [],
        averagePrice: 0,
        maxSavings: 0,
      );
    }
    
    // Find cheapest option
    final cheapest = options.reduce(
      (a, b) => a.price < b.price ? a : b,
    );
    
    // Find fastest option
    final fastest = options.reduce(
      (a, b) => a.estimatedTime < b.estimatedTime ? a : b,
    );
    
    // Calculate average price
    final totalPrice = options.fold<double>(
      0,
      (sum, option) => sum + option.price,
    );
    final avgPrice = totalPrice / options.length;
    
    // Find most expensive
    final mostExpensive = options.reduce(
      (a, b) => a.price > b.price ? a : b,
    );
    
    // Max savings
    final maxSave = mostExpensive.price - cheapest.price;
    
    // Recommended option (best value: balance of price and rating)
    final recommended = _findRecommendedOption(options);
    
    return ComparisonResultModel(
      rideOptions: options,
      cheapestOption: cheapest,
      fastestOption: fastest,
      recommendedOption: recommended,
      averagePrice: avgPrice,
      maxSavings: maxSave,
    );
  }
  
  /// Find recommended option based on value score
  static RideProviderModel? _findRecommendedOption(
    List<RideProviderModel> options,
  ) {
    if (options.isEmpty) return null;
    
    // Calculate value score for each option
    // Lower price is better, higher rating is better
    final maxPrice = options.map((o) => o.price).reduce((a, b) => a > b ? a : b);
    final minPrice = options.map((o) => o.price).reduce((a, b) => a < b ? a : b);
    
    RideProviderModel? best;
    double bestScore = -1;
    
    for (final option in options) {
      // Normalize price (0-1, lower is better)
      final priceScore = maxPrice == minPrice
          ? 0.5
          : 1 - ((option.price - minPrice) / (maxPrice - minPrice));
      
      // Normalize rating (0-1, higher is better)
      final ratingScore = option.rating / 5.0;
      
      // Combined score (60% price, 40% rating)
      final valueScore = (priceScore * 0.6) + (ratingScore * 0.4);
      
      if (valueScore > bestScore) {
        bestScore = valueScore;
        best = option;
      }
    }
    
    return best;
  }
  
  /// Get total options count
  int get totalOptions => rideOptions.length;
  
  /// Check if has options
  bool get hasOptions => rideOptions.isNotEmpty;
  
  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'rideOptions': rideOptions.map((o) => o.toJson()).toList(),
      'cheapestOption': cheapestOption?.toJson(),
      'fastestOption': fastestOption?.toJson(),
      'recommendedOption': recommendedOption?.toJson(),
      'averagePrice': averagePrice,
      'maxSavings': maxSavings,
    };
  }
}

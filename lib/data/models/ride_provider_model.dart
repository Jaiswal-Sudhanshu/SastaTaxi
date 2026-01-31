/// Model representing a ride provider and vehicle option
class RideProviderModel {
  final String providerId;
  final String providerName;
  final String vehicleType;
  final String vehicleCategory;
  final double price;
  final int estimatedTime; // in minutes
  final double distance; // in km
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final double surgeMultiplier;
  final Map<String, double> priceBreakdown;
  
  RideProviderModel({
    required this.providerId,
    required this.providerName,
    required this.vehicleType,
    required this.vehicleCategory,
    required this.price,
    required this.estimatedTime,
    required this.distance,
    required this.rating,
    required this.reviewCount,
    this.isAvailable = true,
    this.surgeMultiplier = 1.0,
    required this.priceBreakdown,
  });
  
  /// Calculate savings compared to a given price
  double calculateSavings(double comparePrice) {
    return comparePrice - price;
  }
  
  /// Calculate savings percentage
  double calculateSavingsPercentage(double comparePrice) {
    if (comparePrice == 0) return 0;
    return ((comparePrice - price) / comparePrice) * 100;
  }
  
  /// Check if this is the cheapest option
  bool isCheapest(List<RideProviderModel> allOptions) {
    return allOptions.every((option) => price <= option.price);
  }
  
  /// Get display name (provider + vehicle type)
  String get displayName => '$providerName - $vehicleType';
  
  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'providerId': providerId,
      'providerName': providerName,
      'vehicleType': vehicleType,
      'vehicleCategory': vehicleCategory,
      'price': price,
      'estimatedTime': estimatedTime,
      'distance': distance,
      'rating': rating,
      'reviewCount': reviewCount,
      'isAvailable': isAvailable,
      'surgeMultiplier': surgeMultiplier,
      'priceBreakdown': priceBreakdown,
    };
  }
  
  /// Create from JSON
  factory RideProviderModel.fromJson(Map<String, dynamic> json) {
    return RideProviderModel(
      providerId: json['providerId'] as String,
      providerName: json['providerName'] as String,
      vehicleType: json['vehicleType'] as String,
      vehicleCategory: json['vehicleCategory'] as String,
      price: (json['price'] as num).toDouble(),
      estimatedTime: json['estimatedTime'] as int,
      distance: (json['distance'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
      isAvailable: json['isAvailable'] as bool? ?? true,
      surgeMultiplier: (json['surgeMultiplier'] as num?)?.toDouble() ?? 1.0,
      priceBreakdown: Map<String, double>.from(json['priceBreakdown'] as Map),
    );
  }
  
  /// Copy with modifications
  RideProviderModel copyWith({
    String? providerId,
    String? providerName,
    String? vehicleType,
    String? vehicleCategory,
    double? price,
    int? estimatedTime,
    double? distance,
    double? rating,
    int? reviewCount,
    bool? isAvailable,
    double? surgeMultiplier,
    Map<String, double>? priceBreakdown,
  }) {
    return RideProviderModel(
      providerId: providerId ?? this.providerId,
      providerName: providerName ?? this.providerName,
      vehicleType: vehicleType ?? this.vehicleType,
      vehicleCategory: vehicleCategory ?? this.vehicleCategory,
      price: price ?? this.price,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      distance: distance ?? this.distance,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isAvailable: isAvailable ?? this.isAvailable,
      surgeMultiplier: surgeMultiplier ?? this.surgeMultiplier,
      priceBreakdown: priceBreakdown ?? this.priceBreakdown,
    );
  }
}

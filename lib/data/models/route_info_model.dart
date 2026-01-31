/// Model representing route information
class RouteInfoModel {
  final String id;
  final String source;
  final String destination;
  final String city;
  final double distance;
  final int estimatedTime;
  final DateTime searchedAt;
  
  RouteInfoModel({
    required this.id,
    required this.source,
    required this.destination,
    required this.city,
    required this.distance,
    required this.estimatedTime,
    required this.searchedAt,
  });
  
  /// Get route display string
  String get routeDisplay => '$source → $destination';
  
  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'source': source,
      'destination': destination,
      'city': city,
      'distance': distance,
      'estimatedTime': estimatedTime,
      'searchedAt': searchedAt.toIso8601String(),
    };
  }
  
  /// Create from JSON
  factory RouteInfoModel.fromJson(Map<String, dynamic> json) {
    return RouteInfoModel(
      id: json['id'] as String,
      source: json['source'] as String,
      destination: json['destination'] as String,
      city: json['city'] as String,
      distance: (json['distance'] as num).toDouble(),
      estimatedTime: json['estimatedTime'] as int,
      searchedAt: DateTime.parse(json['searchedAt'] as String),
    );
  }
  
  /// Copy with modifications
  RouteInfoModel copyWith({
    String? id,
    String? source,
    String? destination,
    String? city,
    double? distance,
    int? estimatedTime,
    DateTime? searchedAt,
  }) {
    return RouteInfoModel(
      id: id ?? this.id,
      source: source ?? this.source,
      destination: destination ?? this.destination,
      city: city ?? this.city,
      distance: distance ?? this.distance,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      searchedAt: searchedAt ?? this.searchedAt,
    );
  }
}

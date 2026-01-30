/// Model representing a city with classification
class CityModel {
  final String id;
  final String name;
  final bool isMetro;
  final String state;
  final int? population;
  final List<String> availableProviders;
  
  CityModel({
    required this.id,
    required this.name,
    required this.isMetro,
    required this.state,
    this.population,
    required this.availableProviders,
  });
  
  /// Get city type display string
  String get cityType => isMetro ? 'Metro City' : 'Non-Metro City';
  
  /// Get display name with icon
  String get displayName => isMetro ? '🏙️ $name' : '🌆 $name';
  
  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isMetro': isMetro,
      'state': state,
      'population': population,
      'availableProviders': availableProviders,
    };
  }
  
  /// Create from JSON
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] as String,
      name: json['name'] as String,
      isMetro: json['isMetro'] as bool,
      state: json['state'] as String,
      population: json['population'] as int?,
      availableProviders: List<String>.from(json['availableProviders'] as List),
    );
  }
  
  /// Copy with modifications
  CityModel copyWith({
    String? id,
    String? name,
    bool? isMetro,
    String? state,
    int? population,
    List<String>? availableProviders,
  }) {
    return CityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isMetro: isMetro ?? this.isMetro,
      state: state ?? this.state,
      population: population ?? this.population,
      availableProviders: availableProviders ?? this.availableProviders,
    );
  }
}

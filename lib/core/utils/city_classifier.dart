/// Classifies cities as metro or non-metro and provides city data
class CityClassifier {
  CityClassifier._();
  
  // Metro cities in India (Tier 1)
  static const List<String> metroCities = [
    'Delhi',
    'Mumbai',
    'Bangalore',
    'Bengaluru',
    'Hyderabad',
    'Chennai',
    'Kolkata',
    'Pune',
    'Ahmedabad',
    'Jaipur',
    'Surat',
    'Lucknow',
    'Kochi',
    'Chandigarh',
    'Indore',
    'Nagpur',
  ];
  
  // Non-metro cities (Tier 2 and 3)
  static const List<String> nonMetroCities = [
    'Agra',
    'Amritsar',
    'Bhopal',
    'Bhubaneswar',
    'Coimbatore',
    'Dehradun',
    'Faridabad',
    'Ghaziabad',
    'Gurgaon',
    'Guwahati',
    'Jamshedpur',
    'Jodhpur',
    'Kanpur',
    'Kota',
    'Ludhiana',
    'Madurai',
    'Mangalore',
    'Mysore',
    'Nashik',
    'Patna',
    'Raipur',
    'Ranchi',
    'Srinagar',
    'Thiruvananthapuram',
    'Udaipur',
    'Vadodara',
    'Varanasi',
    'Vijayawada',
    'Visakhapatnam',
  ];
  
  /// Check if a city is metro
  static bool isMetroCity(String cityName) {
    final normalizedCity = cityName.trim().toLowerCase();
    return metroCities.any((city) => city.toLowerCase() == normalizedCity);
  }
  
  /// Get all cities (metro + non-metro)
  static List<String> getAllCities() {
    return [...metroCities, ...nonMetroCities];
  }
  
  /// Get city type as string
  static String getCityType(String cityName) {
    return isMetroCity(cityName) ? 'Metro' : 'Non-Metro';
  }
  
  /// Search cities by query
  static List<String> searchCities(String query) {
    if (query.isEmpty) return getAllCities();
    
    final normalizedQuery = query.toLowerCase();
    final allCities = getAllCities();
    
    return allCities
        .where((city) => city.toLowerCase().contains(normalizedQuery))
        .toList();
  }
  
  /// Get city display name with emoji
  static String getCityDisplayName(String cityName) {
    final isMetro = isMetroCity(cityName);
    return isMetro ? '🏙️ $cityName' : '🌆 $cityName';
  }
}

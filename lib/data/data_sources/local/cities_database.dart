import 'package:sasta_taxi/data/models/city_model.dart';

/// Comprehensive database of Indian cities (30+ cities)
class CitiesDatabase {
  CitiesDatabase._();
  
  /// Get all cities
  static List<CityModel> getAllCities() {
    return [..._metroCities, ..._nonMetroCities];
  }
  
  /// Get metro cities only
  static List<CityModel> getMetroCities() {
    return _metroCities;
  }
  
  /// Get non-metro cities only
  static List<CityModel> getNonMetroCities() {
    return _nonMetroCities;
  }
  
  /// Find city by name
  static CityModel? findCityByName(String name) {
    try {
      return getAllCities().firstWhere(
        (city) => city.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
  
  /// Search cities
  static List<CityModel> searchCities(String query) {
    if (query.isEmpty) return getAllCities();
    
    final normalizedQuery = query.toLowerCase();
    return getAllCities()
        .where((city) =>
            city.name.toLowerCase().contains(normalizedQuery) ||
            city.state.toLowerCase().contains(normalizedQuery))
        .toList();
  }
  
  // Metro Cities Data
  static final List<CityModel> _metroCities = [
    CityModel(
      id: 'metro_1',
      name: 'Delhi',
      isMetro: true,
      state: 'Delhi',
      population: 19000000,
      availableProviders: ['Uber', 'Ola', 'Rapido', 'BluSmart', 'Meru'],
    ),
    CityModel(
      id: 'metro_2',
      name: 'Mumbai',
      isMetro: true,
      state: 'Maharashtra',
      population: 20000000,
      availableProviders: ['Uber', 'Ola', 'Rapido', 'Meru'],
    ),
    CityModel(
      id: 'metro_3',
      name: 'Bangalore',
      isMetro: true,
      state: 'Karnataka',
      population: 12000000,
      availableProviders: ['Uber', 'Ola', 'Rapido', 'Namma Yatri', 'BluSmart'],
    ),
    CityModel(
      id: 'metro_4',
      name: 'Hyderabad',
      isMetro: true,
      state: 'Telangana',
      population: 10000000,
      availableProviders: ['Uber', 'Ola', 'Rapido', 'BluSmart'],
    ),
    CityModel(
      id: 'metro_5',
      name: 'Chennai',
      isMetro: true,
      state: 'Tamil Nadu',
      population: 11000000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'metro_6',
      name: 'Kolkata',
      isMetro: true,
      state: 'West Bengal',
      population: 15000000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'metro_7',
      name: 'Pune',
      isMetro: true,
      state: 'Maharashtra',
      population: 6500000,
      availableProviders: ['Uber', 'Ola', 'Rapido', 'BluSmart'],
    ),
    CityModel(
      id: 'metro_8',
      name: 'Ahmedabad',
      isMetro: true,
      state: 'Gujarat',
      population: 8000000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'metro_9',
      name: 'Jaipur',
      isMetro: true,
      state: 'Rajasthan',
      population: 3900000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'metro_10',
      name: 'Surat',
      isMetro: true,
      state: 'Gujarat',
      population: 6100000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'metro_11',
      name: 'Lucknow',
      isMetro: true,
      state: 'Uttar Pradesh',
      population: 3400000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'metro_12',
      name: 'Kochi',
      isMetro: true,
      state: 'Kerala',
      population: 2100000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'metro_13',
      name: 'Chandigarh',
      isMetro: true,
      state: 'Chandigarh',
      population: 1100000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'metro_14',
      name: 'Indore',
      isMetro: true,
      state: 'Madhya Pradesh',
      population: 3300000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'metro_15',
      name: 'Nagpur',
      isMetro: true,
      state: 'Maharashtra',
      population: 3100000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
  ];
  
  // Non-Metro Cities Data
  static final List<CityModel> _nonMetroCities = [
    CityModel(
      id: 'nonmetro_1',
      name: 'Agra',
      isMetro: false,
      state: 'Uttar Pradesh',
      population: 1700000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_2',
      name: 'Amritsar',
      isMetro: false,
      state: 'Punjab',
      population: 1200000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_3',
      name: 'Bhopal',
      isMetro: false,
      state: 'Madhya Pradesh',
      population: 2400000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_4',
      name: 'Bhubaneswar',
      isMetro: false,
      state: 'Odisha',
      population: 1000000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_5',
      name: 'Coimbatore',
      isMetro: false,
      state: 'Tamil Nadu',
      population: 2200000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_6',
      name: 'Dehradun',
      isMetro: false,
      state: 'Uttarakhand',
      population: 700000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_7',
      name: 'Faridabad',
      isMetro: false,
      state: 'Haryana',
      population: 1900000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_8',
      name: 'Ghaziabad',
      isMetro: false,
      state: 'Uttar Pradesh',
      population: 2400000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_9',
      name: 'Gurgaon',
      isMetro: false,
      state: 'Haryana',
      population: 1100000,
      availableProviders: ['Uber', 'Ola', 'Rapido', 'BluSmart'],
    ),
    CityModel(
      id: 'nonmetro_10',
      name: 'Guwahati',
      isMetro: false,
      state: 'Assam',
      population: 1100000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_11',
      name: 'Jamshedpur',
      isMetro: false,
      state: 'Jharkhand',
      population: 1300000,
      availableProviders: ['Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_12',
      name: 'Jodhpur',
      isMetro: false,
      state: 'Rajasthan',
      population: 1400000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_13',
      name: 'Kanpur',
      isMetro: false,
      state: 'Uttar Pradesh',
      population: 3000000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_14',
      name: 'Kota',
      isMetro: false,
      state: 'Rajasthan',
      population: 1200000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_15',
      name: 'Ludhiana',
      isMetro: false,
      state: 'Punjab',
      population: 1600000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_16',
      name: 'Madurai',
      isMetro: false,
      state: 'Tamil Nadu',
      population: 1600000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_17',
      name: 'Mangalore',
      isMetro: false,
      state: 'Karnataka',
      population: 600000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_18',
      name: 'Mysore',
      isMetro: false,
      state: 'Karnataka',
      population: 1000000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_19',
      name: 'Nashik',
      isMetro: false,
      state: 'Maharashtra',
      population: 1900000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_20',
      name: 'Patna',
      isMetro: false,
      state: 'Bihar',
      population: 2400000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_21',
      name: 'Raipur',
      isMetro: false,
      state: 'Chhattisgarh',
      population: 1100000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_22',
      name: 'Ranchi',
      isMetro: false,
      state: 'Jharkhand',
      population: 1200000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_23',
      name: 'Srinagar',
      isMetro: false,
      state: 'Jammu and Kashmir',
      population: 1300000,
      availableProviders: ['Uber', 'Ola'],
    ),
    CityModel(
      id: 'nonmetro_24',
      name: 'Thiruvananthapuram',
      isMetro: false,
      state: 'Kerala',
      population: 1000000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_25',
      name: 'Udaipur',
      isMetro: false,
      state: 'Rajasthan',
      population: 600000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_26',
      name: 'Vadodara',
      isMetro: false,
      state: 'Gujarat',
      population: 2100000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_27',
      name: 'Varanasi',
      isMetro: false,
      state: 'Uttar Pradesh',
      population: 1400000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_28',
      name: 'Vijayawada',
      isMetro: false,
      state: 'Andhra Pradesh',
      population: 1700000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
    CityModel(
      id: 'nonmetro_29',
      name: 'Visakhapatnam',
      isMetro: false,
      state: 'Andhra Pradesh',
      population: 2100000,
      availableProviders: ['Uber', 'Ola', 'Rapido'],
    ),
  ];
}

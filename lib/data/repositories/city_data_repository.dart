import 'package:sasta_taxi/data/models/city_model.dart';
import 'package:sasta_taxi/data/data_sources/local/cities_database.dart';

/// Repository for city data operations
class CityDataRepository {
  /// Get all cities
  Future<List<CityModel>> getAllCities() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return CitiesDatabase.getAllCities();
  }
  
  /// Get metro cities only
  Future<List<CityModel>> getMetroCities() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return CitiesDatabase.getMetroCities();
  }
  
  /// Get non-metro cities only
  Future<List<CityModel>> getNonMetroCities() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return CitiesDatabase.getNonMetroCities();
  }
  
  /// Search cities by query
  Future<List<CityModel>> searchCities(String query) async {
    await Future.delayed(const Duration(milliseconds: 150));
    return CitiesDatabase.searchCities(query);
  }
  
  /// Get city by name
  Future<CityModel?> getCityByName(String name) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return CitiesDatabase.findCityByName(name);
  }
  
  /// Check if city is metro
  bool isMetroCity(String cityName) {
    final city = CitiesDatabase.findCityByName(cityName);
    return city?.isMetro ?? false;
  }
}

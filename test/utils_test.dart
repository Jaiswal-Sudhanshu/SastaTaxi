import 'package:flutter_test/flutter_test.dart';
import 'package:sasta_taxi/core/utils/price_calculator.dart';
import 'package:sasta_taxi/core/utils/city_classifier.dart';
import 'package:sasta_taxi/core/utils/format_helpers.dart';

void main() {
  group('PriceCalculator Tests', () {
    test('Calculate Uber price for metro city', () {
      final price = PriceCalculator.calculateUberPrice(
        distanceKm: 10.0,
        vehicleType: 'UberGo',
        isMetroCity: true,
        surgeMultiplier: 1.0,
      );
      
      expect(price, greaterThan(0));
      expect(price, lessThan(500)); // Reasonable upper bound
    });
    
    test('Calculate Ola price for non-metro city', () {
      final price = PriceCalculator.calculateOlaPrice(
        distanceKm: 5.0,
        vehicleType: 'Mini',
        isMetroCity: false,
        surgeMultiplier: 1.0,
      );
      
      expect(price, greaterThan(0));
    });
    
    test('Surge multiplier increases price', () {
      final normalPrice = PriceCalculator.calculateUberPrice(
        distanceKm: 10.0,
        vehicleType: 'UberGo',
        isMetroCity: true,
        surgeMultiplier: 1.0,
      );
      
      final surgePrice = PriceCalculator.calculateUberPrice(
        distanceKm: 10.0,
        vehicleType: 'UberGo',
        isMetroCity: true,
        surgeMultiplier: 1.5,
      );
      
      expect(surgePrice, greaterThan(normalPrice));
    });
  });
  
  group('CityClassifier Tests', () {
    test('Correctly identifies metro cities', () {
      expect(CityClassifier.isMetroCity('Bangalore'), true);
      expect(CityClassifier.isMetroCity('Mumbai'), true);
      expect(CityClassifier.isMetroCity('Delhi'), true);
    });
    
    test('Correctly identifies non-metro cities', () {
      expect(CityClassifier.isMetroCity('Agra'), false);
      expect(CityClassifier.isMetroCity('Amritsar'), false);
    });
    
    test('City search works correctly', () {
      final results = CityClassifier.searchCities('Ban');
      expect(results.isNotEmpty, true);
      expect(results.any((city) => city.toLowerCase().contains('ban')), true);
    });
  });
  
  group('FormatHelpers Tests', () {
    test('Format price correctly', () {
      expect(FormatHelpers.formatPrice(123.45), '₹123');
      expect(FormatHelpers.formatPrice(99.99), '₹100');
    });
    
    test('Format price with decimals', () {
      expect(FormatHelpers.formatPriceDetailed(123.45), '₹123.45');
    });
    
    test('Format rating correctly', () {
      expect(FormatHelpers.formatRating(4.567), '4.6');
    });
    
    test('Format savings correctly', () {
      expect(FormatHelpers.formatSavings(50.0), 'Save ₹50');
      expect(FormatHelpers.formatSavings(-10.0), '');
    });
  });
}

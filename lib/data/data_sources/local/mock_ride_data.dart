import 'dart:math';
import 'package:sasta_taxi/data/models/ride_provider_model.dart';
import 'package:sasta_taxi/core/utils/price_calculator.dart';
import 'package:sasta_taxi/core/utils/distance_estimator.dart';

/// Mock ride data generator with realistic pricing
class MockRideData {
  MockRideData._();
  
  /// Generate ride options for a route
  static List<RideProviderModel> generateRideOptions({
    required String source,
    required String destination,
    required bool isMetroCity,
  }) {
    final distance = DistanceEstimator.estimateDistance(
      source: source,
      destination: destination,
    );
    
    final estimatedTime = DistanceEstimator.estimateTravelTime(
      distanceKm: distance,
      isMetroCity: isMetroCity,
    );
    
    final rideOptions = <RideProviderModel>[];
    
    // Uber options
    rideOptions.addAll(_generateUberOptions(
      distance: distance,
      estimatedTime: estimatedTime,
      isMetroCity: isMetroCity,
    ));
    
    // Ola options
    rideOptions.addAll(_generateOlaOptions(
      distance: distance,
      estimatedTime: estimatedTime,
      isMetroCity: isMetroCity,
    ));
    
    // Rapido options
    rideOptions.addAll(_generateRapidoOptions(
      distance: distance,
      estimatedTime: estimatedTime,
      isMetroCity: isMetroCity,
    ));
    
    // Namma Yatri (Bangalore only)
    if (isMetroCity) {
      rideOptions.add(_generateNammaYatriOption(
        distance: distance,
        estimatedTime: estimatedTime,
      ));
    }
    
    // BluSmart (select metro cities)
    if (isMetroCity && Random().nextBool()) {
      rideOptions.add(_generateBluSmartOption(
        distance: distance,
        estimatedTime: estimatedTime,
        isMetroCity: isMetroCity,
      ));
    }
    
    // Meru
    if (Random().nextDouble() > 0.3) {
      rideOptions.add(_generateMeruOption(
        distance: distance,
        estimatedTime: estimatedTime,
        isMetroCity: isMetroCity,
      ));
    }
    
    return rideOptions;
  }
  
  /// Generate Uber ride options
  static List<RideProviderModel> _generateUberOptions({
    required double distance,
    required int estimatedTime,
    required bool isMetroCity,
  }) {
    final surgeMultiplier = PriceCalculator.generateSurgeMultiplier();
    
    return [
      // UberGo
      RideProviderModel(
        providerId: 'uber_ubergo',
        providerName: 'Uber',
        vehicleType: 'UberGo',
        vehicleCategory: 'Sedan',
        price: PriceCalculator.calculateUberPrice(
          distanceKm: distance,
          vehicleType: 'UberGo',
          isMetroCity: isMetroCity,
          surgeMultiplier: surgeMultiplier,
        ),
        estimatedTime: estimatedTime,
        distance: distance,
        rating: 4.2 + (Random().nextDouble() * 0.6),
        reviewCount: 1200 + Random().nextInt(800),
        surgeMultiplier: surgeMultiplier,
        priceBreakdown: PriceCalculator.getPriceBreakdown(
          provider: 'Uber',
          distanceKm: distance,
          vehicleType: 'UberGo',
          isMetroCity: isMetroCity,
          totalPrice: 0,
        ),
      ),
      
      // Premier
      RideProviderModel(
        providerId: 'uber_premier',
        providerName: 'Uber',
        vehicleType: 'Premier',
        vehicleCategory: 'Sedan',
        price: PriceCalculator.calculateUberPrice(
          distanceKm: distance,
          vehicleType: 'Premier',
          isMetroCity: isMetroCity,
          surgeMultiplier: surgeMultiplier,
        ),
        estimatedTime: estimatedTime - 2,
        distance: distance,
        rating: 4.5 + (Random().nextDouble() * 0.4),
        reviewCount: 800 + Random().nextInt(500),
        surgeMultiplier: surgeMultiplier,
        priceBreakdown: PriceCalculator.getPriceBreakdown(
          provider: 'Uber',
          distanceKm: distance,
          vehicleType: 'Premier',
          isMetroCity: isMetroCity,
          totalPrice: 0,
        ),
      ),
      
      // XL
      RideProviderModel(
        providerId: 'uber_xl',
        providerName: 'Uber',
        vehicleType: 'XL',
        vehicleCategory: 'SUV',
        price: PriceCalculator.calculateUberPrice(
          distanceKm: distance,
          vehicleType: 'XL',
          isMetroCity: isMetroCity,
          surgeMultiplier: surgeMultiplier,
        ),
        estimatedTime: estimatedTime,
        distance: distance,
        rating: 4.3 + (Random().nextDouble() * 0.5),
        reviewCount: 600 + Random().nextInt(400),
        surgeMultiplier: surgeMultiplier,
        priceBreakdown: PriceCalculator.getPriceBreakdown(
          provider: 'Uber',
          distanceKm: distance,
          vehicleType: 'XL',
          isMetroCity: isMetroCity,
          totalPrice: 0,
        ),
      ),
      
      // Auto
      RideProviderModel(
        providerId: 'uber_auto',
        providerName: 'Uber',
        vehicleType: 'Auto',
        vehicleCategory: 'Auto',
        price: PriceCalculator.calculateUberPrice(
          distanceKm: distance,
          vehicleType: 'Auto',
          isMetroCity: isMetroCity,
          surgeMultiplier: surgeMultiplier,
        ),
        estimatedTime: estimatedTime + 5,
        distance: distance,
        rating: 4.0 + (Random().nextDouble() * 0.6),
        reviewCount: 1500 + Random().nextInt(1000),
        surgeMultiplier: surgeMultiplier,
        priceBreakdown: PriceCalculator.getPriceBreakdown(
          provider: 'Uber',
          distanceKm: distance,
          vehicleType: 'Auto',
          isMetroCity: isMetroCity,
          totalPrice: 0,
        ),
      ),
    ];
  }
  
  /// Generate Ola ride options
  static List<RideProviderModel> _generateOlaOptions({
    required double distance,
    required int estimatedTime,
    required bool isMetroCity,
  }) {
    final surgeMultiplier = PriceCalculator.generateSurgeMultiplier();
    
    return [
      // Micro
      RideProviderModel(
        providerId: 'ola_micro',
        providerName: 'Ola',
        vehicleType: 'Micro',
        vehicleCategory: 'Sedan',
        price: PriceCalculator.calculateOlaPrice(
          distanceKm: distance,
          vehicleType: 'Micro',
          isMetroCity: isMetroCity,
          surgeMultiplier: surgeMultiplier,
        ),
        estimatedTime: estimatedTime + 3,
        distance: distance,
        rating: 4.0 + (Random().nextDouble() * 0.5),
        reviewCount: 1000 + Random().nextInt(600),
        surgeMultiplier: surgeMultiplier,
        priceBreakdown: PriceCalculator.getPriceBreakdown(
          provider: 'Ola',
          distanceKm: distance,
          vehicleType: 'Micro',
          isMetroCity: isMetroCity,
          totalPrice: 0,
        ),
      ),
      
      // Mini
      RideProviderModel(
        providerId: 'ola_mini',
        providerName: 'Ola',
        vehicleType: 'Mini',
        vehicleCategory: 'Sedan',
        price: PriceCalculator.calculateOlaPrice(
          distanceKm: distance,
          vehicleType: 'Mini',
          isMetroCity: isMetroCity,
          surgeMultiplier: surgeMultiplier,
        ),
        estimatedTime: estimatedTime,
        distance: distance,
        rating: 4.1 + (Random().nextDouble() * 0.6),
        reviewCount: 1300 + Random().nextInt(700),
        surgeMultiplier: surgeMultiplier,
        priceBreakdown: PriceCalculator.getPriceBreakdown(
          provider: 'Ola',
          distanceKm: distance,
          vehicleType: 'Mini',
          isMetroCity: isMetroCity,
          totalPrice: 0,
        ),
      ),
      
      // Prime
      RideProviderModel(
        providerId: 'ola_prime',
        providerName: 'Ola',
        vehicleType: 'Prime',
        vehicleCategory: 'Sedan',
        price: PriceCalculator.calculateOlaPrice(
          distanceKm: distance,
          vehicleType: 'Prime',
          isMetroCity: isMetroCity,
          surgeMultiplier: surgeMultiplier,
        ),
        estimatedTime: estimatedTime - 1,
        distance: distance,
        rating: 4.4 + (Random().nextDouble() * 0.5),
        reviewCount: 700 + Random().nextInt(400),
        surgeMultiplier: surgeMultiplier,
        priceBreakdown: PriceCalculator.getPriceBreakdown(
          provider: 'Ola',
          distanceKm: distance,
          vehicleType: 'Prime',
          isMetroCity: isMetroCity,
          totalPrice: 0,
        ),
      ),
      
      // Auto
      RideProviderModel(
        providerId: 'ola_auto',
        providerName: 'Ola',
        vehicleType: 'Auto',
        vehicleCategory: 'Auto',
        price: PriceCalculator.calculateOlaPrice(
          distanceKm: distance,
          vehicleType: 'Auto',
          isMetroCity: isMetroCity,
          surgeMultiplier: surgeMultiplier,
        ),
        estimatedTime: estimatedTime + 4,
        distance: distance,
        rating: 3.9 + (Random().nextDouble() * 0.7),
        reviewCount: 1600 + Random().nextInt(900),
        surgeMultiplier: surgeMultiplier,
        priceBreakdown: PriceCalculator.getPriceBreakdown(
          provider: 'Ola',
          distanceKm: distance,
          vehicleType: 'Auto',
          isMetroCity: isMetroCity,
          totalPrice: 0,
        ),
      ),
    ];
  }
  
  /// Generate Rapido ride options
  static List<RideProviderModel> _generateRapidoOptions({
    required double distance,
    required int estimatedTime,
    required bool isMetroCity,
  }) {
    final surgeMultiplier = PriceCalculator.generateSurgeMultiplier();
    
    return [
      // Bike
      RideProviderModel(
        providerId: 'rapido_bike',
        providerName: 'Rapido',
        vehicleType: 'Bike',
        vehicleCategory: 'Bike',
        price: PriceCalculator.calculateRapidoPrice(
          distanceKm: distance,
          vehicleType: 'Bike',
          isMetroCity: isMetroCity,
          surgeMultiplier: surgeMultiplier,
        ),
        estimatedTime: estimatedTime - 5,
        distance: distance,
        rating: 4.0 + (Random().nextDouble() * 0.5),
        reviewCount: 2000 + Random().nextInt(1000),
        surgeMultiplier: surgeMultiplier,
        priceBreakdown: PriceCalculator.getPriceBreakdown(
          provider: 'Rapido',
          distanceKm: distance,
          vehicleType: 'Bike',
          isMetroCity: isMetroCity,
          totalPrice: 0,
        ),
      ),
      
      // Auto
      RideProviderModel(
        providerId: 'rapido_auto',
        providerName: 'Rapido',
        vehicleType: 'Auto',
        vehicleCategory: 'Auto',
        price: PriceCalculator.calculateRapidoPrice(
          distanceKm: distance,
          vehicleType: 'Auto',
          isMetroCity: isMetroCity,
          surgeMultiplier: surgeMultiplier,
        ),
        estimatedTime: estimatedTime + 3,
        distance: distance,
        rating: 3.8 + (Random().nextDouble() * 0.6),
        reviewCount: 1800 + Random().nextInt(800),
        surgeMultiplier: surgeMultiplier,
        priceBreakdown: PriceCalculator.getPriceBreakdown(
          provider: 'Rapido',
          distanceKm: distance,
          vehicleType: 'Auto',
          isMetroCity: isMetroCity,
          totalPrice: 0,
        ),
      ),
    ];
  }
  
  /// Generate Namma Yatri option
  static RideProviderModel _generateNammaYatriOption({
    required double distance,
    required int estimatedTime,
  }) {
    final surgeMultiplier = PriceCalculator.generateSurgeMultiplier();
    
    return RideProviderModel(
      providerId: 'nammayatri_auto',
      providerName: 'Namma Yatri',
      vehicleType: 'Auto',
      vehicleCategory: 'Auto',
      price: PriceCalculator.calculateNammaYatriPrice(
        distanceKm: distance,
        surgeMultiplier: surgeMultiplier,
      ),
      estimatedTime: estimatedTime + 2,
      distance: distance,
      rating: 4.3 + (Random().nextDouble() * 0.5),
      reviewCount: 900 + Random().nextInt(500),
      surgeMultiplier: surgeMultiplier,
      priceBreakdown: {
        'baseFare': 30.0,
        'distanceCharge': distance * 11.0,
        'serviceFee': 0.0,
        'gst': (30.0 + distance * 11.0) * 0.05,
      },
    );
  }
  
  /// Generate BluSmart option
  static RideProviderModel _generateBluSmartOption({
    required double distance,
    required int estimatedTime,
    required bool isMetroCity,
  }) {
    return RideProviderModel(
      providerId: 'blusmart_electric',
      providerName: 'BluSmart',
      vehicleType: 'Electric',
      vehicleCategory: 'Electric',
      price: PriceCalculator.calculateBluSmartPrice(
        distanceKm: distance,
        isMetroCity: isMetroCity,
      ),
      estimatedTime: estimatedTime - 1,
      distance: distance,
      rating: 4.6 + (Random().nextDouble() * 0.3),
      reviewCount: 500 + Random().nextInt(300),
      surgeMultiplier: 1.0, // BluSmart doesn't have surge pricing
      priceBreakdown: {
        'baseFare': isMetroCity ? 60.0 : 50.0,
        'distanceCharge': distance * (isMetroCity ? 14.0 : 12.0),
        'serviceFee': 0.0,
        'gst': (isMetroCity ? 60.0 : 50.0 + distance * (isMetroCity ? 14.0 : 12.0)) * 0.05,
      },
    );
  }
  
  /// Generate Meru option
  static RideProviderModel _generateMeruOption({
    required double distance,
    required int estimatedTime,
    required bool isMetroCity,
  }) {
    final surgeMultiplier = PriceCalculator.generateSurgeMultiplier();
    
    return RideProviderModel(
      providerId: 'meru_sedan',
      providerName: 'Meru',
      vehicleType: 'Sedan',
      vehicleCategory: 'Sedan',
      price: PriceCalculator.calculateMeruPrice(
        distanceKm: distance,
        isMetroCity: isMetroCity,
        surgeMultiplier: surgeMultiplier,
      ),
      estimatedTime: estimatedTime,
      distance: distance,
      rating: 4.2 + (Random().nextDouble() * 0.4),
      reviewCount: 600 + Random().nextInt(300),
      surgeMultiplier: surgeMultiplier,
      priceBreakdown: {
        'baseFare': isMetroCity ? 55.0 : 40.0,
        'distanceCharge': distance * (isMetroCity ? 13.0 : 11.0),
        'serviceFee': 12.0,
        'gst': (isMetroCity ? 55.0 : 40.0 + distance * (isMetroCity ? 13.0 : 11.0) + 12.0) * 0.05,
      },
    );
  }
}

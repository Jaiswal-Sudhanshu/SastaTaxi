import 'dart:math';

/// Original price calculation algorithms for different ride providers
class PriceCalculator {
  PriceCalculator._();
  
  /// Calculate Uber ride price based on distance and city type
  static double calculateUberPrice({
    required double distanceKm,
    required String vehicleType,
    required bool isMetroCity,
    double surgeMultiplier = 1.0,
  }) {
    double baseFare = isMetroCity ? 50.0 : 35.0;
    double perKmRate = 12.0;
    double serviceFee = 10.0;
    
    // Adjust rates based on vehicle type
    switch (vehicleType.toLowerCase()) {
      case 'ubergo':
        perKmRate = isMetroCity ? 12.0 : 10.0;
        break;
      case 'premier':
        baseFare *= 1.5;
        perKmRate *= 1.8;
        break;
      case 'xl':
        baseFare *= 1.8;
        perKmRate *= 2.0;
        break;
      case 'auto':
        baseFare = isMetroCity ? 25.0 : 20.0;
        perKmRate = isMetroCity ? 10.0 : 8.0;
        serviceFee = 5.0;
        break;
    }
    
    double distanceCharge = distanceKm * perKmRate;
    double subtotal = baseFare + distanceCharge + serviceFee;
    double totalWithSurge = subtotal * surgeMultiplier;
    
    // Add GST (5%)
    double gst = totalWithSurge * 0.05;
    
    return double.parse((totalWithSurge + gst).toStringAsFixed(2));
  }
  
  /// Calculate Ola ride price
  static double calculateOlaPrice({
    required double distanceKm,
    required String vehicleType,
    required bool isMetroCity,
    double surgeMultiplier = 1.0,
  }) {
    double baseFare = isMetroCity ? 45.0 : 30.0;
    double perKmRate = 11.0;
    double serviceFee = 8.0;
    
    switch (vehicleType.toLowerCase()) {
      case 'micro':
        baseFare = isMetroCity ? 40.0 : 25.0;
        perKmRate = isMetroCity ? 9.0 : 7.5;
        break;
      case 'mini':
        perKmRate = isMetroCity ? 11.0 : 9.0;
        break;
      case 'prime':
        baseFare *= 1.6;
        perKmRate *= 1.7;
        break;
      case 'auto':
        baseFare = isMetroCity ? 22.0 : 18.0;
        perKmRate = isMetroCity ? 9.5 : 7.5;
        serviceFee = 4.0;
        break;
    }
    
    double distanceCharge = distanceKm * perKmRate;
    double subtotal = baseFare + distanceCharge + serviceFee;
    double totalWithSurge = subtotal * surgeMultiplier;
    
    double gst = totalWithSurge * 0.05;
    
    return double.parse((totalWithSurge + gst).toStringAsFixed(2));
  }
  
  /// Calculate Rapido ride price
  static double calculateRapidoPrice({
    required double distanceKm,
    required String vehicleType,
    required bool isMetroCity,
    double surgeMultiplier = 1.0,
  }) {
    double baseFare = 20.0;
    double perKmRate = 6.0;
    double serviceFee = 5.0;
    
    switch (vehicleType.toLowerCase()) {
      case 'bike':
        baseFare = isMetroCity ? 25.0 : 20.0;
        perKmRate = isMetroCity ? 7.0 : 5.5;
        break;
      case 'auto':
        baseFare = isMetroCity ? 30.0 : 25.0;
        perKmRate = isMetroCity ? 10.0 : 8.0;
        serviceFee = 6.0;
        break;
    }
    
    double distanceCharge = distanceKm * perKmRate;
    double subtotal = baseFare + distanceCharge + serviceFee;
    double totalWithSurge = subtotal * surgeMultiplier;
    
    double gst = totalWithSurge * 0.05;
    
    return double.parse((totalWithSurge + gst).toStringAsFixed(2));
  }
  
  /// Calculate Namma Yatri price (Bangalore specific, flat rates)
  static double calculateNammaYatriPrice({
    required double distanceKm,
    double surgeMultiplier = 1.0,
  }) {
    double baseFare = 30.0;
    double perKmRate = 11.0;
    
    double distanceCharge = distanceKm * perKmRate;
    double subtotal = baseFare + distanceCharge;
    double totalWithSurge = subtotal * surgeMultiplier;
    
    // No service fee for Namma Yatri
    double gst = totalWithSurge * 0.05;
    
    return double.parse((totalWithSurge + gst).toStringAsFixed(2));
  }
  
  /// Calculate BluSmart price (electric vehicles, premium pricing)
  static double calculateBluSmartPrice({
    required double distanceKm,
    required bool isMetroCity,
  }) {
    double baseFare = isMetroCity ? 60.0 : 50.0;
    double perKmRate = isMetroCity ? 14.0 : 12.0;
    
    double distanceCharge = distanceKm * perKmRate;
    double subtotal = baseFare + distanceCharge;
    
    // BluSmart includes service fee in base
    double gst = subtotal * 0.05;
    
    return double.parse((subtotal + gst).toStringAsFixed(2));
  }
  
  /// Calculate Meru price
  static double calculateMeruPrice({
    required double distanceKm,
    required bool isMetroCity,
    double surgeMultiplier = 1.0,
  }) {
    double baseFare = isMetroCity ? 55.0 : 40.0;
    double perKmRate = isMetroCity ? 13.0 : 11.0;
    double serviceFee = 12.0;
    
    double distanceCharge = distanceKm * perKmRate;
    double subtotal = baseFare + distanceCharge + serviceFee;
    double totalWithSurge = subtotal * surgeMultiplier;
    
    double gst = totalWithSurge * 0.05;
    
    return double.parse((totalWithSurge + gst).toStringAsFixed(2));
  }
  
  /// Generate random surge multiplier for realistic pricing
  static double generateSurgeMultiplier() {
    final random = Random();
    // 70% chance of no surge, 30% chance of 1.2x to 2.0x surge
    if (random.nextDouble() < 0.7) {
      return 1.0;
    }
    return 1.2 + (random.nextDouble() * 0.8); // 1.2 to 2.0
  }
  
  /// Calculate price breakdown components
  static Map<String, double> getPriceBreakdown({
    required String provider,
    required double distanceKm,
    required String vehicleType,
    required bool isMetroCity,
    required double totalPrice,
  }) {
    double baseFare = 0;
    double perKmRate = 0;
    double serviceFee = 0;
    
    // Simplified breakdown logic
    if (provider == 'Uber') {
      baseFare = isMetroCity ? 50.0 : 35.0;
      perKmRate = 12.0;
      serviceFee = 10.0;
    } else if (provider == 'Ola') {
      baseFare = isMetroCity ? 45.0 : 30.0;
      perKmRate = 11.0;
      serviceFee = 8.0;
    } else if (provider == 'Rapido') {
      baseFare = vehicleType == 'Bike' ? 25.0 : 30.0;
      perKmRate = vehicleType == 'Bike' ? 7.0 : 10.0;
      serviceFee = 5.0;
    }
    
    double distanceCharge = distanceKm * perKmRate;
    double gst = (baseFare + distanceCharge + serviceFee) * 0.05;
    
    return {
      'baseFare': baseFare,
      'distanceCharge': distanceCharge,
      'serviceFee': serviceFee,
      'gst': gst,
    };
  }
}

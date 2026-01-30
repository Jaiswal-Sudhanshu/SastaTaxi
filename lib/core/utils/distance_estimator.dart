import 'dart:math';

/// Distance estimation and calculation utilities
class DistanceEstimator {
  DistanceEstimator._();
  
  /// Estimate distance between two points (mock implementation)
  /// In production, this would use Google Maps Distance Matrix API
  static double estimateDistance({
    required String source,
    required String destination,
  }) {
    // For mock data, generate realistic distances based on string hash
    final hash = (source.hashCode + destination.hashCode).abs();
    final random = Random(hash);
    
    // Generate distance between 2 and 50 km
    return 2.0 + (random.nextDouble() * 48.0);
  }
  
  /// Estimate travel time based on distance (minutes)
  static int estimateTravelTime({
    required double distanceKm,
    required bool isMetroCity,
  }) {
    // Average speed in metro cities: 25 km/h
    // Average speed in non-metro cities: 35 km/h
    final avgSpeed = isMetroCity ? 25.0 : 35.0;
    final timeHours = distanceKm / avgSpeed;
    final timeMinutes = (timeHours * 60).round();
    
    // Add buffer time for traffic
    final bufferMinutes = isMetroCity ? 10 : 5;
    
    return timeMinutes + bufferMinutes;
  }
  
  /// Format distance for display
  static String formatDistance(double distanceKm) {
    if (distanceKm < 1.0) {
      return '${(distanceKm * 1000).round()} m';
    }
    return '${distanceKm.toStringAsFixed(1)} km';
  }
  
  /// Format time for display
  static String formatTime(int minutes) {
    if (minutes < 60) {
      return '$minutes min';
    }
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    return '${hours}h ${remainingMinutes}m';
  }
}

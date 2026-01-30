/// App-specific constants unique to SastaTaxi
class AppConstants {
  AppConstants._();
  
  // App Identity
  static const String appName = 'SastaTaxi';
  static const String appTagline = 'Compare Rides, Save Money';
  static const String appVersion = '1.0.0';
  
  // Ride Providers
  static const String providerUber = 'Uber';
  static const String providerOla = 'Ola';
  static const String providerRapido = 'Rapido';
  static const String providerNammaYatri = 'Namma Yatri';
  static const String providerBluSmart = 'BluSmart';
  static const String providerMeru = 'Meru';
  
  // Vehicle Types
  static const String vehicleAuto = 'Auto';
  static const String vehicleBike = 'Bike';
  static const String vehicleSedan = 'Sedan';
  static const String vehicleSUV = 'SUV';
  static const String vehicleElectric = 'Electric';
  
  // City Classifications
  static const String cityTypeMetro = 'Metro';
  static const String cityTypeNonMetro = 'Non-Metro';
  
  // Pricing Constants
  static const double baseFareMin = 20.0;
  static const double baseFareMax = 60.0;
  static const double perKmChargeMin = 8.0;
  static const double perKmChargeMax = 20.0;
  static const double surgeMultiplierMin = 1.0;
  static const double surgeMultiplierMax = 2.5;
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Local Storage Keys
  static const String keyHasSeenOnboarding = 'has_seen_onboarding';
  static const String keyRecentSearches = 'recent_searches';
  static const String keyPreferredCity = 'preferred_city';
  static const String keyPreferredProviders = 'preferred_providers';
  static const String keyThemeMode = 'theme_mode';
}

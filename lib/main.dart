import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sasta_taxi/core/theme/sasta_taxi_theme.dart';
import 'package:sasta_taxi/core/constants/route_constants.dart';
import 'package:sasta_taxi/presentation/screens/splash/splash_screen.dart';
import 'package:sasta_taxi/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:sasta_taxi/presentation/screens/home/home_screen.dart';
import 'package:sasta_taxi/presentation/screens/city_selection/city_picker_screen.dart';
import 'package:sasta_taxi/presentation/screens/comparison/ride_comparison_screen.dart';
import 'package:sasta_taxi/presentation/screens/filters/filter_screen.dart';
import 'package:sasta_taxi/presentation/screens/ride_details/ride_detail_screen.dart';
import 'package:sasta_taxi/presentation/screens/settings/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  runApp(const ProviderScope(child: SastaTaxiApp()));
}

class SastaTaxiApp extends StatelessWidget {
  const SastaTaxiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SastaTaxi - Compare & Save',
      debugShowCheckedModeBanner: false,
      theme: SastaTaxiTheme.lightTheme,
      darkTheme: SastaTaxiTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: RouteConstants.splash,
      routes: {
        RouteConstants.splash: (context) => const SplashScreen(),
        RouteConstants.onboarding: (context) => const OnboardingScreen(),
        RouteConstants.home: (context) => const HomeScreen(),
        RouteConstants.cityPicker: (context) => const CityPickerScreen(),
        RouteConstants.comparison: (context) => const RideComparisonScreen(),
        RouteConstants.filters: (context) => const FilterScreen(),
        RouteConstants.rideDetails: (context) => const RideDetailScreen(),
        RouteConstants.settings: (context) => const SettingsScreen(),
      },
    );
  }
}

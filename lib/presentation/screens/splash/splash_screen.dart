import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sasta_taxi/core/theme/color_palette.dart';
import 'package:sasta_taxi/core/theme/typography_system.dart';
import 'package:sasta_taxi/core/constants/route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sasta_taxi/core/constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));
    
    if (!mounted) return;
    
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool(AppConstants.keyHasSeenOnboarding) ?? false;
    
    if (!mounted) return;
    
    Navigator.of(context).pushReplacementNamed(
      hasSeenOnboarding ? RouteConstants.home : RouteConstants.onboarding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: ColorPalette.primaryGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo (Text-based)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.local_taxi_rounded,
                  size: 80,
                  color: Colors.white,
                ),
              )
                  .animate()
                  .scale(
                    duration: 600.ms,
                    curve: Curves.elasticOut,
                  )
                  .fadeIn(duration: 400.ms),
              
              const SizedBox(height: 32),
              
              // App Name
              Text(
                AppConstants.appName,
                style: TypographySystem.h1.copyWith(
                  color: Colors.white,
                  fontSize: 42,
                  letterSpacing: 2,
                ),
              )
                  .animate()
                  .fadeIn(delay: 300.ms, duration: 500.ms)
                  .slideY(begin: 0.3, end: 0, duration: 500.ms),
              
              const SizedBox(height: 8),
              
              // Tagline
              Text(
                AppConstants.appTagline,
                style: TypographySystem.bodyLarge.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                ),
              )
                  .animate()
                  .fadeIn(delay: 500.ms, duration: 500.ms)
                  .slideY(begin: 0.3, end: 0, duration: 500.ms),
              
              const SizedBox(height: 60),
              
              // Loading Indicator
              const SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 3,
                ),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .fadeIn(delay: 700.ms),
            ],
          ),
        ),
      ),
    );
  }
}

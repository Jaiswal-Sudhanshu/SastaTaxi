import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sasta_taxi/core/theme/color_palette.dart';
import 'package:sasta_taxi/core/theme/typography_system.dart';
import 'package:sasta_taxi/core/theme/app_decorations.dart';
import 'package:sasta_taxi/core/constants/app_constants.dart';
import 'package:sasta_taxi/core/constants/route_constants.dart';
import 'package:sasta_taxi/presentation/state_management/providers/city_selection_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  String _selectedCity = 'Bangalore';
  bool _isMetroCity = true;

  @override
  void dispose() {
    _sourceController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  void _compareRides() {
    if (_sourceController.text.isEmpty || _destinationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both source and destination'),
          backgroundColor: ColorPalette.errorRed,
        ),
      );
      return;
    }

    Navigator.of(context).pushNamed(
      RouteConstants.comparison,
      arguments: {
        'source': _sourceController.text,
        'destination': _destinationController.text,
        'city': _selectedCity,
      },
    );
  }

  void _selectCity() async {
    final result = await Navigator.of(context).pushNamed(RouteConstants.cityPicker);
    if (result != null && result is String) {
      setState(() {
        _selectedCity = result;
        // Update metro status based on city selection
        final cityRepo = ref.read(cityDataRepositoryProvider);
        _isMetroCity = cityRepo.isMetroCity(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appName, style: TypographySystem.h4),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.of(context).pushNamed(RouteConstants.settings);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Where are you going?',
                style: TypographySystem.h2,
              ),
              const SizedBox(height: 8),
              Text(
                'Compare prices and save on your next ride',
                style: TypographySystem.bodyMedium,
              ),
              
              const SizedBox(height: 32),
              
              // City Selection Card
              InkWell(
                onTap: _selectCity,
                child: Container(
                  padding: const EdgeInsets.all(AppConstants.defaultPadding),
                  decoration: AppDecorations.primaryCard,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: ColorPalette.softGray,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.location_city_rounded,
                          color: ColorPalette.vibrantOrange,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Selected City', style: TypographySystem.captionText),
                            const SizedBox(height: 4),
                            Text(_selectedCity, style: TypographySystem.h5),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _isMetroCity
                              ? ColorPalette.vibrantOrange.withOpacity(0.1)
                              : ColorPalette.deepBlue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _isMetroCity ? 'Metro' : 'Non-Metro',
                          style: TypographySystem.captionText.copyWith(
                            color: _isMetroCity
                                ? ColorPalette.vibrantOrange
                                : ColorPalette.deepBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Source Location Input
              Container(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                decoration: AppDecorations.primaryCard,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: ColorPalette.successGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: _sourceController,
                            decoration: const InputDecoration(
                              hintText: 'Pickup location',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TypographySystem.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: ColorPalette.errorRed,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: _destinationController,
                            decoration: const InputDecoration(
                              hintText: 'Drop location',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TypographySystem.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Compare Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _compareRides,
                  icon: const Icon(Icons.compare_arrows_rounded),
                  label: const Text('Compare Ride Prices'),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Quick Info Cards
              Text(
                'Why Choose SastaTaxi?',
                style: TypographySystem.h4,
              ),
              const SizedBox(height: 16),
              
              Row(
                children: [
                  Expanded(
                    child: _InfoCard(
                      icon: Icons.savings_outlined,
                      title: 'Save Money',
                      description: 'Best prices guaranteed',
                      color: ColorPalette.mintGreen,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _InfoCard(
                      icon: Icons.flash_on_outlined,
                      title: 'Fast Compare',
                      description: 'Instant results',
                      color: ColorPalette.goldenYellow,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              Row(
                children: [
                  Expanded(
                    child: _InfoCard(
                      icon: Icons.verified_user_outlined,
                      title: 'Trusted',
                      description: 'Real-time pricing',
                      color: ColorPalette.deepBlue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _InfoCard(
                      icon: Icons.all_inclusive_rounded,
                      title: 'All Platforms',
                      description: 'Uber, Ola & more',
                      color: ColorPalette.vibrantOrange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppDecorations.primaryCard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TypographySystem.labelBold,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TypographySystem.captionText,
          ),
        ],
      ),
    );
  }
}

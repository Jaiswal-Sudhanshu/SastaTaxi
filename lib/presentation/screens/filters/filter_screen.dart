import 'package:flutter/material.dart';
import 'package:sasta_taxi/core/theme/color_palette.dart';
import 'package:sasta_taxi/core/theme/typography_system.dart';
import 'package:sasta_taxi/core/constants/app_constants.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _priceRange = const RangeValues(50, 500);
  final Set<String> _selectedProviders = {};
  final Set<String> _selectedVehicleTypes = {};

  final List<String> _providers = [
    'Uber',
    'Ola',
    'Rapido',
    'Namma Yatri',
    'BluSmart',
    'Meru',
  ];

  final List<String> _vehicleTypes = [
    'Auto',
    'Bike',
    'Sedan',
    'SUV',
    'Electric',
  ];

  void _applyFilters() {
    Navigator.of(context).pop({
      'minPrice': _priceRange.start,
      'maxPrice': _priceRange.end,
      'providers': _selectedProviders.toList(),
      'vehicleTypes': _selectedVehicleTypes.toList(),
    });
  }

  void _resetFilters() {
    setState(() {
      _priceRange = const RangeValues(50, 500);
      _selectedProviders.clear();
      _selectedVehicleTypes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          TextButton(
            onPressed: _resetFilters,
            child: const Text('Reset'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price Range
              Text('Price Range', style: TypographySystem.h5),
              const SizedBox(height: 16),
              RangeSlider(
                values: _priceRange,
                min: 0,
                max: 1000,
                divisions: 20,
                labels: RangeLabels(
                  '₹${_priceRange.start.round()}',
                  '₹${_priceRange.end.round()}',
                ),
                onChanged: (values) {
                  setState(() {
                    _priceRange = values;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹${_priceRange.start.round()}',
                    style: TypographySystem.bodyMedium,
                  ),
                  Text(
                    '₹${_priceRange.end.round()}',
                    style: TypographySystem.bodyMedium,
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Providers
              Text('Providers', style: TypographySystem.h5),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _providers.map((provider) {
                  final isSelected = _selectedProviders.contains(provider);
                  return FilterChip(
                    label: Text(provider),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedProviders.add(provider);
                        } else {
                          _selectedProviders.remove(provider);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 32),

              // Vehicle Types
              Text('Vehicle Types', style: TypographySystem.h5),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _vehicleTypes.map((type) {
                  final isSelected = _selectedVehicleTypes.contains(type);
                  return FilterChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedVehicleTypes.add(type);
                        } else {
                          _selectedVehicleTypes.remove(type);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _applyFilters,
              child: const Text('Apply Filters'),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sasta_taxi/core/theme/color_palette.dart';
import 'package:sasta_taxi/core/theme/typography_system.dart';
import 'package:sasta_taxi/core/theme/app_decorations.dart';
import 'package:sasta_taxi/core/constants/app_constants.dart';
import 'package:sasta_taxi/core/utils/format_helpers.dart';
import 'package:sasta_taxi/data/models/ride_provider_model.dart';
import 'package:url_launcher/url_launcher.dart';

class RideDetailScreen extends StatelessWidget {
  const RideDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ride = ModalRoute.of(context)?.settings.arguments as RideProviderModel?;

    if (ride == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Ride Details')),
        body: const Center(child: Text('No ride data available')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Provider Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _getProviderGradient(ride.providerName),
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.local_taxi_rounded,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    ride.providerName,
                    style: TypographySystem.h2.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ride.vehicleType,
                    style: TypographySystem.bodyLarge.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    FormatHelpers.formatPrice(ride.price),
                    style: TypographySystem.priceHuge.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),

            // Trip Details
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Trip Details', style: TypographySystem.h4),
                  const SizedBox(height: 16),
                  _DetailRow(
                    icon: Icons.straighten_rounded,
                    label: 'Distance',
                    value: '${ride.distance.toStringAsFixed(1)} km',
                  ),
                  _DetailRow(
                    icon: Icons.access_time_rounded,
                    label: 'Estimated Time',
                    value: FormatHelpers.formatETA(ride.estimatedTime),
                  ),
                  _DetailRow(
                    icon: Icons.star_rounded,
                    label: 'Rating',
                    value: '${FormatHelpers.formatRating(ride.rating)} (${ride.reviewCount} reviews)',
                  ),
                  if (ride.surgeMultiplier > 1.0)
                    _DetailRow(
                      icon: Icons.trending_up_rounded,
                      label: 'Surge Pricing',
                      value: '${ride.surgeMultiplier.toStringAsFixed(1)}x',
                    ),

                  const SizedBox(height: 24),

                  // Price Breakdown
                  Text('Price Breakdown', style: TypographySystem.h4),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(AppConstants.defaultPadding),
                    decoration: AppDecorations.primaryCard,
                    child: Column(
                      children: [
                        _PriceRow(
                          label: 'Base Fare',
                          amount: ride.priceBreakdown['baseFare'] ?? 0,
                        ),
                        _PriceRow(
                          label: 'Distance Charge',
                          amount: ride.priceBreakdown['distanceCharge'] ?? 0,
                        ),
                        if ((ride.priceBreakdown['serviceFee'] ?? 0) > 0)
                          _PriceRow(
                            label: 'Service Fee',
                            amount: ride.priceBreakdown['serviceFee'] ?? 0,
                          ),
                        _PriceRow(
                          label: 'GST (5%)',
                          amount: ride.priceBreakdown['gst'] ?? 0,
                        ),
                        const Divider(height: 24),
                        _PriceRow(
                          label: 'Total',
                          amount: ride.price,
                          isTotal: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Action Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () => _openInApp(ride.providerName),
                      icon: const Icon(Icons.open_in_new_rounded),
                      label: Text('Open in ${ride.providerName} App'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Color> _getProviderGradient(String provider) {
    switch (provider.toLowerCase()) {
      case 'uber':
        return [const Color(0xFF000000), const Color(0xFF2C2C2C)];
      case 'ola':
        return [const Color(0xFF75C044), const Color(0xFF5FA534)];
      case 'rapido':
        return [const Color(0xFFFFD700), const Color(0xFFFFB700)];
      default:
        return ColorPalette.primaryGradient;
    }
  }

  Future<void> _openInApp(String provider) async {
    // In a real app, this would use deep linking to open the provider's app
    // For now, we'll show a message
    debugPrint('Opening $provider app');
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: ColorPalette.textSecondary),
          const SizedBox(width: 12),
          Text(label, style: TypographySystem.bodyMedium),
          const Spacer(),
          Text(value, style: TypographySystem.labelBold),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final double amount;
  final bool isTotal;

  const _PriceRow({
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? TypographySystem.labelBold
                : TypographySystem.bodyMedium,
          ),
          Text(
            FormatHelpers.formatPrice(amount),
            style: isTotal
                ? TypographySystem.priceMedium
                : TypographySystem.bodyMedium,
          ),
        ],
      ),
    );
  }
}

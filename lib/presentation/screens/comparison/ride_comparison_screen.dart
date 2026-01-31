import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sasta_taxi/core/theme/color_palette.dart';
import 'package:sasta_taxi/core/theme/typography_system.dart';
import 'package:sasta_taxi/core/theme/app_decorations.dart';
import 'package:sasta_taxi/core/constants/app_constants.dart';
import 'package:sasta_taxi/core/constants/route_constants.dart';
import 'package:sasta_taxi/core/utils/format_helpers.dart';
import 'package:sasta_taxi/core/utils/distance_estimator.dart';
import 'package:sasta_taxi/presentation/state_management/providers/ride_comparison_provider.dart';
import 'package:sasta_taxi/data/models/ride_provider_model.dart';

class RideComparisonScreen extends ConsumerStatefulWidget {
  const RideComparisonScreen({super.key});

  @override
  ConsumerState<RideComparisonScreen> createState() =>
      _RideComparisonScreenState();
}

class _RideComparisonScreenState extends ConsumerState<RideComparisonScreen> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    if (!_isInitialized) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      
      if (args != null) {
        final source = args['source'] as String;
        final destination = args['destination'] as String;
        final city = args['city'] as String;
        
        // Fetch ride prices
        Future.microtask(() {
          ref.read(rideComparisonProvider.notifier).fetchRidePrices(
                source: source,
                destination: destination,
                city: city,
              );
        });
      }
      
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final comparisonState = ref.watch(rideComparisonProvider);

    final source = args?['source'] as String? ?? '';
    final destination = args?['destination'] as String? ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Compare Rides'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {
              Navigator.of(context).pushNamed(RouteConstants.filters);
            },
          ),
        ],
      ),
      body: comparisonState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : comparisonState.error != null
              ? _buildErrorState(comparisonState.error!)
              : comparisonState.comparisonResult == null
                  ? const Center(child: Text('No data available'))
                  : Column(
                      children: [
                        _buildRouteHeader(
                          source: source,
                          destination: destination,
                          distance: comparisonState.comparisonResult!.rideOptions.isNotEmpty
                              ? comparisonState.comparisonResult!.rideOptions.first.distance
                              : 0,
                          estimatedTime: comparisonState.comparisonResult!.rideOptions.isNotEmpty
                              ? comparisonState.comparisonResult!.rideOptions.first.estimatedTime
                              : 0,
                        ),
                        _buildSortOptions(comparisonState.sortBy ?? 'price_low'),
                        Expanded(
                          child: _buildRidesList(comparisonState.filteredRides),
                        ),
                      ],
                    ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            size: 64,
            color: ColorPalette.errorRed,
          ),
          const SizedBox(height: 16),
          Text(
            'Something went wrong',
            style: TypographySystem.h4,
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: TypographySystem.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRouteHeader({
    required String source,
    required String destination,
    required double distance,
    required int estimatedTime,
  }) {
    return Container(
      margin: const EdgeInsets.all(AppConstants.defaultPadding),
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: AppDecorations.elevatedCard,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: ColorPalette.successGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            source,
                            style: TypographySystem.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Icon(
                      Icons.more_vert,
                      size: 16,
                      color: ColorPalette.textTertiary,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: ColorPalette.errorRed,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            destination,
                            style: TypographySystem.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoChip(
                icon: Icons.straighten_rounded,
                label: DistanceEstimator.formatDistance(distance),
              ),
              _buildInfoChip(
                icon: Icons.access_time_rounded,
                label: DistanceEstimator.formatTime(estimatedTime),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.2, end: 0);
  }

  Widget _buildInfoChip({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: ColorPalette.softGray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: ColorPalette.textSecondary),
          const SizedBox(width: 6),
          Text(label, style: TypographySystem.bodySmall),
        ],
      ),
    );
  }

  Widget _buildSortOptions(String currentSort) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: 8,
      ),
      child: Row(
        children: [
          Text('Sort by:', style: TypographySystem.labelMedium),
          const SizedBox(width: 12),
          _buildSortChip('Price', 'price_low', currentSort),
          const SizedBox(width: 8),
          _buildSortChip('Time', 'time', currentSort),
          const SizedBox(width: 8),
          _buildSortChip('Rating', 'rating', currentSort),
        ],
      ),
    );
  }

  Widget _buildSortChip(String label, String sortKey, String currentSort) {
    final isSelected = currentSort == sortKey;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          ref.read(rideComparisonProvider.notifier).sortRides(sortKey);
        }
      },
      selectedColor: ColorPalette.vibrantOrange,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : ColorPalette.textSecondary,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
      ),
    );
  }

  Widget _buildRidesList(List<RideProviderModel> rides) {
    if (rides.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.local_taxi_outlined,
              size: 64,
              color: ColorPalette.textTertiary,
            ),
            const SizedBox(height: 16),
            Text(
              'No rides available',
              style: TypographySystem.h5.copyWith(
                color: ColorPalette.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    final cheapestPrice = rides.map((r) => r.price).reduce((a, b) => a < b ? a : b);

    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      itemCount: rides.length,
      itemBuilder: (context, index) {
        final ride = rides[index];
        final isCheapest = ride.price == cheapestPrice;
        final savings = cheapestPrice < ride.price ? ride.price - cheapestPrice : 0.0;

        return _RideComparisonCard(
          ride: ride,
          isCheapest: isCheapest,
          savings: savings,
          onTap: () {
            Navigator.of(context).pushNamed(
              RouteConstants.rideDetails,
              arguments: ride,
            );
          },
        )
            .animate()
            .fadeIn(delay: (50 * index).ms, duration: 300.ms)
            .slideX(begin: 0.2, end: 0);
      },
    );
  }
}

class _RideComparisonCard extends StatelessWidget {
  final RideProviderModel ride;
  final bool isCheapest;
  final double savings;
  final VoidCallback onTap;

  const _RideComparisonCard({
    required this.ride,
    required this.isCheapest,
    required this.savings,
    required this.onTap,
  });

  Color _getProviderColor() {
    switch (ride.providerName.toLowerCase()) {
      case 'uber':
        return ColorPalette.uberBlack;
      case 'ola':
        return ColorPalette.olaGreen;
      case 'rapido':
        return ColorPalette.rapidoYellow;
      case 'namma yatri':
        return ColorPalette.nammaYatriPurple;
      case 'blusmart':
        return ColorPalette.bluSmartBlue;
      case 'meru':
        return ColorPalette.meruGold;
      default:
        return ColorPalette.textPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final providerColor = _getProviderColor();

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        child: Container(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          decoration: isCheapest
              ? BoxDecoration(
                  color: ColorPalette.pureWhite,
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                  border: Border.all(
                    color: ColorPalette.mintGreen,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorPalette.mintGreen.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                )
              : AppDecorations.comparisonCard,
          child: Column(
            children: [
              Row(
                children: [
                  // Provider Icon
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: providerColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.local_taxi_rounded,
                      color: providerColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // Provider Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              ride.providerName,
                              style: TypographySystem.h5,
                            ),
                            if (isCheapest) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: AppDecorations.savingsGradient,
                                child: Text(
                                  'BEST VALUE',
                                  style: TypographySystem.overlineText.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          ride.vehicleType,
                          style: TypographySystem.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  
                  // Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        FormatHelpers.formatPrice(ride.price),
                        style: TypographySystem.priceLarge,
                      ),
                      if (savings > 0 && !isCheapest)
                        Text(
                          '+${FormatHelpers.formatPrice(savings)}',
                          style: TypographySystem.captionText.copyWith(
                            color: ColorPalette.errorRed,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Additional Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_rounded,
                        size: 16,
                        color: ColorPalette.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        FormatHelpers.formatETA(ride.estimatedTime),
                        style: TypographySystem.bodySmall,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        size: 16,
                        color: ColorPalette.goldenYellow,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        FormatHelpers.formatRating(ride.rating),
                        style: TypographySystem.bodySmall,
                      ),
                    ],
                  ),
                  if (ride.surgeMultiplier > 1.0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: ColorPalette.warningAmber.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${ride.surgeMultiplier.toStringAsFixed(1)}x Surge',
                        style: TypographySystem.captionText.copyWith(
                          color: ColorPalette.warningAmber,
                          fontWeight: FontWeight.w600,
                        ),
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

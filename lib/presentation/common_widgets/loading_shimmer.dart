import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sasta_taxi/core/theme/color_palette.dart';

/// Custom loading shimmer effect for loading states
class LoadingShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const LoadingShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorPalette.softGray,
      highlightColor: ColorPalette.pureWhite,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorPalette.softGray,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

/// Shimmer effect for ride comparison card
class RideCardShimmer extends StatelessWidget {
  const RideCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorPalette.pureWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const LoadingShimmer(width: 48, height: 48, borderRadius: 12),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoadingShimmer(width: 120, height: 16),
                    const SizedBox(height: 8),
                    const LoadingShimmer(width: 80, height: 12),
                  ],
                ),
              ),
              const LoadingShimmer(width: 80, height: 32),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LoadingShimmer(width: 60, height: 12),
              const LoadingShimmer(width: 60, height: 12),
              const LoadingShimmer(width: 60, height: 12),
            ],
          ),
        ],
      ),
    );
  }
}

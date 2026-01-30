import 'package:intl/intl.dart';

/// Format helpers for consistent data presentation
class FormatHelpers {
  FormatHelpers._();
  
  /// Format price with currency symbol
  static String formatPrice(double price) {
    return '₹${price.toStringAsFixed(0)}';
  }
  
  /// Format price with decimals
  static String formatPriceDetailed(double price) {
    return '₹${price.toStringAsFixed(2)}';
  }
  
  /// Format savings amount
  static String formatSavings(double savings) {
    if (savings <= 0) return '';
    return 'Save ₹${savings.toStringAsFixed(0)}';
  }
  
  /// Format savings percentage
  static String formatSavingsPercentage(double savingsPercent) {
    if (savingsPercent <= 0) return '';
    return '${savingsPercent.toStringAsFixed(0)}% off';
  }
  
  /// Format date and time
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
  }
  
  /// Format time ago
  static String formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} year${(difference.inDays / 365).floor() > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} month${(difference.inDays / 30).floor() > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
  
  /// Format rating
  static String formatRating(double rating) {
    return rating.toStringAsFixed(1);
  }
  
  /// Format large numbers
  static String formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }
  
  /// Capitalize first letter
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
  
  /// Format ETA
  static String formatETA(int minutes) {
    if (minutes < 1) return 'Arriving now';
    if (minutes == 1) return '1 min';
    if (minutes < 60) return '$minutes mins';
    
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    
    if (remainingMinutes == 0) {
      return '${hours}h';
    }
    return '${hours}h ${remainingMinutes}m';
  }
}

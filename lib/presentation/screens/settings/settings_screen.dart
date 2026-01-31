import 'package:flutter/material.dart';
import 'package:sasta_taxi/core/theme/color_palette.dart';
import 'package:sasta_taxi/core/theme/typography_system.dart';
import 'package:sasta_taxi/core/theme/app_decorations.dart';
import 'package:sasta_taxi/core/constants/app_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        children: [
          // App Info
          Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ColorPalette.vibrantOrange.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.local_taxi_rounded,
                    size: 48,
                    color: ColorPalette.vibrantOrange,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  AppConstants.appName,
                  style: TypographySystem.h3,
                ),
                const SizedBox(height: 8),
                Text(
                  'Version ${AppConstants.appVersion}',
                  style: TypographySystem.bodyMedium,
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Preferences Section
          Text('Preferences', style: TypographySystem.h5),
          const SizedBox(height: 16),
          
          _SettingTile(
            icon: Icons.location_city_rounded,
            title: 'Default City',
            subtitle: 'Set your preferred city',
            onTap: () {},
          ),
          
          _SettingTile(
            icon: Icons.notifications_outlined,
            title: 'Price Alerts',
            subtitle: 'Get notified about price changes',
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          
          _SettingTile(
            icon: Icons.dark_mode_outlined,
            title: 'App Theme',
            subtitle: 'Light / Dark mode',
            onTap: () {},
          ),

          const SizedBox(height: 24),

          // About Section
          Text('About', style: TypographySystem.h5),
          const SizedBox(height: 16),
          
          _SettingTile(
            icon: Icons.info_outline_rounded,
            title: 'About SastaTaxi',
            subtitle: 'Learn more about the app',
            onTap: () {
              _showAboutDialog(context);
            },
          ),
          
          _SettingTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            subtitle: 'Read our privacy policy',
            onTap: () {},
          ),
          
          _SettingTile(
            icon: Icons.description_outlined,
            title: 'Terms of Service',
            subtitle: 'Read our terms',
            onTap: () {},
          ),
          
          _SettingTile(
            icon: Icons.feedback_outlined,
            title: 'Send Feedback',
            subtitle: 'Help us improve',
            onTap: () {},
          ),

          const SizedBox(height: 24),

          // Data Section
          Text('Data', style: TypographySystem.h5),
          const SizedBox(height: 16),
          
          _SettingTile(
            icon: Icons.history_rounded,
            title: 'Clear Search History',
            subtitle: 'Remove all recent searches',
            onTap: () {},
          ),
          
          _SettingTile(
            icon: Icons.delete_outline_rounded,
            title: 'Clear Cache',
            subtitle: 'Free up storage space',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'About ${AppConstants.appName}',
          style: TypographySystem.h4,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.appTagline,
              style: TypographySystem.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'SastaTaxi helps you compare ride prices across multiple platforms including Uber, Ola, Rapido, and more. Find the cheapest ride option and save money on every trip.',
              style: TypographySystem.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Version: ${AppConstants.appVersion}',
              style: TypographySystem.bodySmall,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _SettingTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorPalette.softGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: ColorPalette.vibrantOrange),
        ),
        title: Text(title, style: TypographySystem.labelBold),
        subtitle: Text(subtitle, style: TypographySystem.captionText),
        trailing: trailing ?? const Icon(Icons.chevron_right_rounded),
        onTap: onTap,
      ),
    );
  }
}

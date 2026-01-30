import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sasta_taxi/core/theme/color_palette.dart';
import 'package:sasta_taxi/core/theme/typography_system.dart';
import 'package:sasta_taxi/core/theme/app_decorations.dart';
import 'package:sasta_taxi/core/constants/app_constants.dart';
import 'package:sasta_taxi/presentation/state_management/providers/city_selection_provider.dart';

class CityPickerScreen extends ConsumerStatefulWidget {
  const CityPickerScreen({super.key});

  @override
  ConsumerState<CityPickerScreen> createState() => _CityPickerScreenState();
}

class _CityPickerScreenState extends ConsumerState<CityPickerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    ref.read(citySelectionProvider.notifier).searchCities(_searchController.text);
  }

  void _selectCity(String cityName) {
    Navigator.of(context).pop(cityName);
  }

  @override
  Widget build(BuildContext context) {
    final cityState = ref.watch(citySelectionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select City'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: TextField(
                  controller: _searchController,
                  decoration: AppDecorations.searchInputDecoration(
                    hint: 'Search cities...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                            },
                          )
                        : null,
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: ColorPalette.vibrantOrange,
                unselectedLabelColor: ColorPalette.textSecondary,
                indicatorColor: ColorPalette.vibrantOrange,
                labelStyle: TypographySystem.labelBold,
                tabs: const [
                  Tab(text: 'Metro Cities'),
                  Tab(text: 'Non-Metro Cities'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: cityState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : _searchController.text.isNotEmpty
              ? _buildSearchResults(cityState.searchResults)
              : TabBarView(
                  controller: _tabController,
                  children: [
                    _buildCityGrid(cityState.metroCities, isMetro: true),
                    _buildCityList(cityState.nonMetroCities),
                  ],
                ),
    );
  }

  Widget _buildSearchResults(List results) {
    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off_rounded,
              size: 64,
              color: ColorPalette.textTertiary,
            ),
            const SizedBox(height: 16),
            Text(
              'No cities found',
              style: TypographySystem.h5.copyWith(
                color: ColorPalette.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final city = results[index];
        return _buildCityTile(
          cityName: city.name,
          state: city.state,
          isMetro: city.isMetro,
          onTap: () => _selectCity(city.name),
        );
      },
    );
  }

  Widget _buildCityGrid(List cities, {required bool isMetro}) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: cities.length,
      itemBuilder: (context, index) {
        final city = cities[index];
        return _buildCityCard(
          cityName: city.name,
          state: city.state,
          onTap: () => _selectCity(city.name),
        );
      },
    );
  }

  Widget _buildCityList(List cities) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      itemCount: cities.length,
      itemBuilder: (context, index) {
        final city = cities[index];
        return _buildCityTile(
          cityName: city.name,
          state: city.state,
          isMetro: city.isMetro,
          onTap: () => _selectCity(city.name),
        );
      },
    );
  }

  Widget _buildCityCard({
    required String cityName,
    required String state,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
      child: Container(
        decoration: AppDecorations.primaryCard,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_city_rounded,
              size: 32,
              color: ColorPalette.vibrantOrange,
            ),
            const SizedBox(height: 8),
            Text(
              cityName,
              style: TypographySystem.labelBold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              state,
              style: TypographySystem.captionText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCityTile({
    required String cityName,
    required String state,
    required bool isMetro,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isMetro
                ? ColorPalette.vibrantOrange.withOpacity(0.1)
                : ColorPalette.deepBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            isMetro ? Icons.location_city_rounded : Icons.location_on_outlined,
            color: isMetro ? ColorPalette.vibrantOrange : ColorPalette.deepBlue,
          ),
        ),
        title: Text(cityName, style: TypographySystem.labelBold),
        subtitle: Text(state, style: TypographySystem.captionText),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isMetro
                ? ColorPalette.vibrantOrange.withOpacity(0.1)
                : ColorPalette.deepBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            isMetro ? 'Metro' : 'Non-Metro',
            style: TypographySystem.captionText.copyWith(
              color: isMetro ? ColorPalette.vibrantOrange : ColorPalette.deepBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

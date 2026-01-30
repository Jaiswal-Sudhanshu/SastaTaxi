# 🚕 SastaTaxi - Premium Ride Comparison App

**Compare Rides, Save Money!**

SastaTaxi is a production-ready Flutter application that helps users compare ride prices across multiple ride-hailing platforms (Uber, Ola, Rapido, Namma Yatri, BluSmart, Meru) for both metro and non-metro cities in India.

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)](https://flutter.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## ✨ Features

### 🎯 Core Features
- **Smart Price Comparison**: Compare prices across 6+ ride-hailing platforms instantly
- **40+ Cities Coverage**: Support for metro and non-metro cities across India
- **Real-time Pricing**: Realistic price calculations based on distance and city type
- **Intelligent Recommendations**: AI-powered suggestions for best value rides
- **Advanced Filtering**: Filter by price range, providers, and vehicle types
- **Detailed Price Breakdown**: Complete transparency on fare components

### 🏙️ City Classification
- **Metro Cities**: Delhi, Mumbai, Bangalore, Hyderabad, Chennai, Kolkata, Pune, Ahmedabad, and more
- **Non-Metro Cities**: Agra, Amritsar, Bhopal, Coimbatore, Dehradun, and 25+ more cities
- Different pricing algorithms optimized for each city type

### 🚗 Supported Platforms
- **Uber**: UberGo, Premier, XL, Auto
- **Ola**: Micro, Mini, Prime, Auto
- **Rapido**: Bike, Auto
- **Namma Yatri**: Auto (Bangalore)
- **BluSmart**: Electric vehicles
- **Meru**: Premium cabs

## 🏗️ Architecture

This app follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/               # Core utilities, theme, constants
│   ├── constants/      # App-wide constants
│   ├── theme/          # Custom theme system
│   ├── utils/          # Utility classes (price calculator, formatters)
│   ├── network/        # API client structure
│   └── errors/         # Error handling
├── data/               # Data layer
│   ├── models/         # Data models
│   ├── repositories/   # Repository implementations
│   └── data_sources/   # Local mock data & API structure
├── domain/             # Business logic layer
│   ├── entities/       # Domain entities
│   └── use_cases/      # Business use cases
└── presentation/       # UI layer
    ├── screens/        # All app screens
    ├── state_management/  # Riverpod providers
    └── common_widgets/ # Reusable widgets
```

### Design Patterns Used
- **Repository Pattern**: Clean data access abstraction
- **Provider Pattern**: State management with Riverpod
- **SOLID Principles**: Maintainable and scalable code
- **Clean Architecture**: Separation of concerns

## 🎨 UI/UX Highlights

### Custom Theme System
- **Unique Color Palette**: 
  - Primary: Vibrant Orange (#FF6B35)
  - Secondary: Deep Blue (#004E89)
  - Accent: Golden Yellow (#F7B801)
  - Success: Mint Green (#06D6A0)
  
- **Typography**: Poppins & Inter fonts for premium look
- **Animations**: Smooth transitions and micro-interactions
- **Material Design 3**: Modern UI components

### Screen Showcase
1. **Splash Screen**: Animated app intro with gradient background
2. **Onboarding**: 4 informative slides with unique animations
3. **Home Screen**: Intuitive search interface with city selection
4. **City Picker**: Tabbed view for metro/non-metro cities
5. **Ride Comparison**: The star feature - beautiful comparison cards with:
   - Provider logos and branding
   - Real-time pricing
   - Savings indicators
   - Rating display
   - Surge pricing alerts
6. **Filter Screen**: Advanced filtering options
7. **Ride Details**: Complete fare breakdown and trip information
8. **Settings**: User preferences and app configuration

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (2.17 or higher)
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/Jaiswal-Sudhanshu/SastaTaxi.git
cd SastaTaxi
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
# For development
flutter run

# For release build
flutter build apk --release  # Android
flutter build ios --release  # iOS
```

### Project Setup
```bash
# Check Flutter installation
flutter doctor

# Clean and get packages
flutter clean
flutter pub get

# Run on specific device
flutter devices
flutter run -d <device-id>
```

## 📦 Dependencies

### Core Dependencies
- `flutter_riverpod`: ^2.4.0 - State management
- `google_fonts`: ^6.1.0 - Custom fonts
- `animations`: ^2.0.8 - Page transitions
- `shimmer`: ^3.0.0 - Loading effects
- `flutter_animate`: ^4.3.0 - Animations
- `intl`: ^0.18.1 - Internationalization
- `shared_preferences`: ^2.2.2 - Local storage
- `url_launcher`: ^6.2.2 - Deep linking
- `font_awesome_flutter`: ^10.6.0 - Icons
- `geolocator`: ^10.1.0 - Location services
- `geocoding`: ^2.1.1 - Address conversion

## 🔧 Configuration

### Adding New Cities
Edit `lib/data/data_sources/local/cities_database.dart`:
```dart
CityModel(
  id: 'city_id',
  name: 'City Name',
  isMetro: true/false,
  state: 'State Name',
  population: 1000000,
  availableProviders: ['Uber', 'Ola', 'Rapido'],
)
```

### Customizing Price Calculations
Modify `lib/core/utils/price_calculator.dart` to adjust:
- Base fares
- Per-km rates
- Service fees
- Surge pricing logic

### Theme Customization
Update `lib/core/theme/`:
- `color_palette.dart` - Color scheme
- `typography_system.dart` - Text styles
- `app_decorations.dart` - UI decorations

## 📱 Features in Detail

### Price Calculation Algorithm
The app uses original algorithms to calculate realistic prices:
- Base fare varies by city type (metro/non-metro)
- Distance-based charges (per km)
- Service fees (provider-specific)
- GST (5% on total)
- Dynamic surge pricing (simulated)
- Vehicle type multipliers

### Smart Recommendations
The app analyzes rides based on:
- Price (60% weight)
- Rating (40% weight)
- Provides "Best Value" suggestions

### Realistic Mock Data
- 40+ Indian cities with accurate data
- Provider availability by city
- Randomized but consistent pricing
- Realistic ratings and review counts
- Surge pricing simulation

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/

# Generate coverage report
flutter test --coverage
```

## 📈 Future Enhancements

- [ ] Real API integration with ride platforms
- [ ] Live price tracking and updates
- [ ] User authentication and profiles
- [ ] Ride history and statistics
- [ ] Price alerts and notifications
- [ ] Favorite routes
- [ ] Multi-language support
- [ ] Dark mode implementation
- [ ] Share comparison feature
- [ ] Route optimization suggestions

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Developer

**Sudhanshu Jaiswal**
- GitHub: [@Jaiswal-Sudhanshu](https://github.com/Jaiswal-Sudhanshu)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- All ride-hailing platforms for inspiration
- The open-source community

## 📞 Support

For support, email or open an issue in the GitHub repository.

---

**Built with ❤️ using Flutter**

*SastaTaxi - Making ride sharing affordable for everyone!*

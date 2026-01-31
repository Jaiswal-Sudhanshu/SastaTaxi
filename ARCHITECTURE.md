# SastaTaxi Architecture Documentation

## Overview
SastaTaxi follows Clean Architecture principles to ensure separation of concerns, testability, and maintainability.

## Architecture Layers

### 1. Presentation Layer (`lib/presentation/`)
**Responsibility**: UI components and user interaction

**Components**:
- **Screens**: All app screens (Splash, Home, Comparison, etc.)
- **Widgets**: Reusable UI components
- **State Management**: Riverpod providers and notifiers

**Key Features**:
- State is managed using Riverpod StateNotifier
- Screens are stateless when possible
- Business logic is delegated to use cases
- UI rebuilds are optimized

**Example Flow**:
```
User Action → Widget → Provider → Use Case → Repository → Data Source
```

### 2. Domain Layer (`lib/domain/`)
**Responsibility**: Business logic and rules

**Components**:
- **Entities**: Pure business objects
- **Use Cases**: Single-purpose business operations

**Characteristics**:
- No dependencies on other layers
- Pure Dart code (no Flutter dependencies)
- Contains business rules and validation

### 3. Data Layer (`lib/data/`)
**Responsibility**: Data access and storage

**Components**:
- **Models**: Data transfer objects with JSON serialization
- **Repositories**: Implementation of data access patterns
- **Data Sources**:
  - Local: Mock data, SharedPreferences
  - Remote: API services (structured for future integration)

**Key Features**:
- Repository pattern for data abstraction
- Models handle serialization/deserialization
- Ready for API integration

### 4. Core Layer (`lib/core/`)
**Responsibility**: Shared utilities and configurations

**Components**:
- **Constants**: App-wide constants and configurations
- **Theme**: Custom theme system (colors, typography, decorations)
- **Utils**: Helper classes and utilities
- **Errors**: Error handling and exceptions
- **Network**: API client structure

## State Management

### Riverpod Architecture
```dart
Provider (Repository) → StateNotifierProvider (Business Logic) → ConsumerWidget (UI)
```

**Benefits**:
- Compile-time safety
- No BuildContext needed
- Easy testing
- Clear dependency injection

### State Flow Example
1. User taps "Compare Rides"
2. HomeScreen calls provider's `fetchRidePrices()`
3. Provider calls use case
4. Use case calls repository
5. Repository fetches from data source
6. Data flows back up the chain
7. Provider updates state
8. UI rebuilds with new data

## Design Patterns

### 1. Repository Pattern
**Purpose**: Abstract data sources
```dart
abstract class Repository {
  Future<Data> getData();
}

class RepositoryImpl implements Repository {
  final DataSource dataSource;
  
  Future<Data> getData() => dataSource.fetch();
}
```

### 2. Provider Pattern (State Management)
**Purpose**: Manage and provide state
```dart
final provider = StateNotifierProvider<Notifier, State>((ref) {
  return Notifier(ref.read(repositoryProvider));
});
```

### 3. Factory Pattern
**Purpose**: Object creation
```dart
factory Model.fromJson(Map<String, dynamic> json) {
  return Model(/* ... */);
}
```

## Data Flow

### Fetching Ride Prices
```
┌─────────────┐
│ HomeScreen  │ User enters source/destination
└──────┬──────┘
       │
       ▼
┌─────────────────────────┐
│ RideComparisonProvider  │ fetchRidePrices()
└──────┬──────────────────┘
       │
       ▼
┌────────────────────────┐
│ FetchRidePricesUseCase │ Validation & business logic
└──────┬─────────────────┘
       │
       ▼
┌──────────────────────────┐
│ RideComparisonRepository │ Data access
└──────┬───────────────────┘
       │
       ▼
┌─────────────────┐
│ MockRideData    │ Generate mock ride options
└─────────────────┘
```

### Filtering & Sorting
```
User Action → Provider.applyFilters() → Repository.filterRides() → Update State → UI Rebuild
```

## File Organization

```
lib/
├── main.dart                          # App entry point
├── core/                              # Shared utilities
│   ├── constants/
│   │   ├── app_constants.dart         # App-wide constants
│   │   └── route_constants.dart       # Navigation routes
│   ├── theme/
│   │   ├── sasta_taxi_theme.dart      # Main theme
│   │   ├── color_palette.dart         # Color definitions
│   │   ├── typography_system.dart     # Text styles
│   │   └── app_decorations.dart       # UI decorations
│   ├── utils/
│   │   ├── price_calculator.dart      # Pricing algorithms
│   │   ├── distance_estimator.dart    # Distance calculations
│   │   ├── city_classifier.dart       # City classification
│   │   └── format_helpers.dart        # Formatting utilities
│   └── errors/
│       └── app_exceptions.dart        # Custom exceptions
├── data/
│   ├── models/                        # Data models
│   ├── repositories/                  # Repository implementations
│   └── data_sources/
│       ├── local/                     # Local data sources
│       └── remote/                    # API services (future)
├── domain/
│   ├── entities/                      # Business entities
│   └── use_cases/                     # Business operations
└── presentation/
    ├── screens/                       # UI screens
    ├── state_management/              # Providers & notifiers
    └── common_widgets/                # Reusable widgets
```

## Testing Strategy

### Unit Tests
- Test utilities (price calculator, formatters)
- Test use cases
- Test repository logic

### Widget Tests
- Test individual widgets
- Test screen layouts
- Test user interactions

### Integration Tests
- Test complete user flows
- Test state management
- Test navigation

## Future Enhancements

### API Integration
1. Create API service in `data/data_sources/remote/`
2. Implement API endpoints
3. Update repository to use API instead of mock data
4. Add error handling for network failures

### Local Persistence
1. Implement search history with SharedPreferences
2. Cache city data locally
3. Save user preferences

### Authentication
1. Add user authentication layer
2. Implement profile management
3. Sync data across devices

## Best Practices Followed

1. **SOLID Principles**
   - Single Responsibility
   - Open/Closed
   - Liskov Substitution
   - Interface Segregation
   - Dependency Inversion

2. **Clean Code**
   - Meaningful variable names
   - Small, focused functions
   - Proper documentation
   - Consistent formatting

3. **Performance**
   - Lazy loading
   - Efficient state management
   - Optimized rebuilds
   - Image caching (ready)

4. **Scalability**
   - Modular architecture
   - Easy to add new features
   - API integration ready
   - Extensible design

## Dependencies Management

All dependencies are managed in `pubspec.yaml` with version constraints to ensure compatibility and stability.

### Core Dependencies
- State Management: Riverpod
- UI: Google Fonts, Animations, Shimmer
- Utils: Intl, SharedPreferences
- Future: Geolocator, Geocoding

## Conclusion

This architecture provides:
- **Separation of Concerns**: Each layer has a clear responsibility
- **Testability**: Easy to test individual components
- **Maintainability**: Easy to understand and modify
- **Scalability**: Ready for future enhancements
- **Flexibility**: Easy to swap implementations

The architecture is production-ready and follows industry best practices for Flutter development.

# Contributing to SastaTaxi

Thank you for considering contributing to SastaTaxi! This document provides guidelines for contributing to the project.

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in Issues
2. Create a new issue with:
   - Clear title and description
   - Steps to reproduce
   - Expected vs actual behavior
   - Screenshots (if applicable)
   - Device/OS information

### Suggesting Features

1. Check if the feature has been suggested
2. Create an issue with:
   - Clear description of the feature
   - Use case and benefits
   - Potential implementation approach

### Pull Request Process

1. **Fork the repository**
   ```bash
   git clone https://github.com/Jaiswal-Sudhanshu/SastaTaxi.git
   cd SastaTaxi
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Follow the code style guidelines
   - Add tests for new features
   - Update documentation as needed

4. **Test your changes**
   ```bash
   flutter test
   flutter analyze
   ```

5. **Commit your changes**
   ```bash
   git add .
   git commit -m "Add: Your feature description"
   ```

6. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Create a Pull Request**
   - Provide a clear description
   - Reference any related issues
   - Include screenshots for UI changes

## Code Style Guidelines

### Dart/Flutter

- Follow the [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter analyze` to check for issues
- Format code with `flutter format`

### File Naming
- Use snake_case for file names: `my_widget.dart`
- Match file names with class names when possible

### Code Structure
```dart
// 1. Imports
import 'package:flutter/material.dart';
import 'package:sasta_taxi/...';

// 2. Class definition
class MyWidget extends StatelessWidget {
  // 3. Constructor
  const MyWidget({super.key});
  
  // 4. Methods
  @override
  Widget build(BuildContext context) {
    // Implementation
  }
}
```

### Comments
- Use clear, concise comments
- Document complex logic
- Add doc comments for public APIs
```dart
/// Calculates the ride price based on distance and city type.
/// 
/// Returns the total price including base fare, distance charges, and taxes.
double calculatePrice({required double distance, required bool isMetro}) {
  // Implementation
}
```

## Project Structure

Follow the existing architecture:
```
lib/
├── core/          # Shared utilities
├── data/          # Data layer
├── domain/        # Business logic
└── presentation/  # UI layer
```

## Testing

### Writing Tests
- Write unit tests for utilities and business logic
- Write widget tests for UI components
- Maintain or improve code coverage

### Running Tests
```bash
# All tests
flutter test

# Specific test file
flutter test test/utils_test.dart

# With coverage
flutter test --coverage
```

## Adding New Features

### New Ride Provider
1. Update `MockRideData` in `lib/data/data_sources/local/mock_ride_data.dart`
2. Add provider-specific pricing in `PriceCalculator`
3. Add provider color in `ColorPalette`
4. Test with different scenarios

### New City
1. Add city to `CitiesDatabase`
2. Specify metro/non-metro classification
3. List available providers

### New Screen
1. Create screen file in `lib/presentation/screens/`
2. Add route in `route_constants.dart`
3. Register route in `main.dart`
4. Create necessary providers if needed

## Documentation

- Update README.md for user-facing changes
- Update ARCHITECTURE.md for structural changes
- Add inline comments for complex logic
- Update code examples when APIs change

## Commit Message Guidelines

Use conventional commits:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting)
- `refactor:` Code refactoring
- `test:` Adding tests
- `chore:` Build process or auxiliary tools

Examples:
```
feat: Add dark mode support
fix: Correct price calculation for non-metro cities
docs: Update README with API integration guide
refactor: Simplify ride comparison logic
```

## Code Review Process

1. All PRs require review before merging
2. Address review comments promptly
3. Keep PRs focused and reasonably sized
4. Ensure CI checks pass

## Getting Help

- Open an issue for bugs or questions
- Check existing documentation
- Review ARCHITECTURE.md for design decisions

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to SastaTaxi! 🚕

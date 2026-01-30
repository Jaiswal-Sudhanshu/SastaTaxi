# SastaTaxi - App Flow & Features Overview

## 🎬 User Journey

### 1. App Launch → Splash Screen
```
┌─────────────────────────────┐
│    SastaTaxi Logo           │
│    Animated Entry           │
│    Gradient Background      │
│    "Compare Rides, Save"    │
└─────────────────────────────┘
              ↓
    First Time User?
         ↓ Yes          ↓ No
   Onboarding        Home Screen
```

### 2. Onboarding (First Time Users)
```
Slide 1: Compare Rides, Save Money
    ↓
Slide 2: Metro & Non-Metro Coverage  
    ↓
Slide 3: Real-time Price Tracking
    ↓
Slide 4: Smart Recommendations
    ↓
Get Started → Home Screen
```

### 3. Home Screen - Main Search Interface
```
┌─────────────────────────────────────┐
│  SastaTaxi                 ⚙️       │
├─────────────────────────────────────┤
│  Where are you going?               │
│  Compare prices and save            │
│                                     │
│  ┌──────────────────────────────┐  │
│  │ Selected City: Bangalore     │  │
│  │ Type: Metro           ➡️      │  │
│  └──────────────────────────────┘  │
│                                     │
│  ┌──────────────────────────────┐  │
│  │ 🟢 Pickup location           │  │
│  │ ─────────────────────────    │  │
│  │ 🔴 Drop location             │  │
│  └──────────────────────────────┘  │
│                                     │
│  [ Compare Ride Prices ]            │
│                                     │
│  Why Choose SastaTaxi?              │
│  ┌──────────┐  ┌──────────┐       │
│  │ 💰 Save  │  │ ⚡ Fast  │       │
│  └──────────┘  └──────────┘       │
│  ┌──────────┐  ┌──────────┐       │
│  │ ✓ Trusted│  │ ∞ All    │       │
│  └──────────┘  └──────────┘       │
└─────────────────────────────────────┘
```

### 4. City Selection Screen
```
┌─────────────────────────────────────┐
│  ← Select City                      │
│  ┌──────────────────────────────┐  │
│  │ 🔍 Search cities...          │  │
│  └──────────────────────────────┘  │
│  [Metro Cities] [Non-Metro Cities] │
├─────────────────────────────────────┤
│  Metro Cities (Grid View)          │
│  ┌──────┐ ┌──────┐ ┌──────┐       │
│  │Delhi │ │Mumbai│ │Bangl.│       │
│  └──────┘ └──────┘ └──────┘       │
│  ┌──────┐ ┌──────┐ ┌──────┐       │
│  │Hyderab│ │Chennai│ │Kolkata│     │
│  └──────┘ └──────┘ └──────┘       │
└─────────────────────────────────────┘
```

### 5. Ride Comparison Screen 🌟 (MAIN FEATURE)
```
┌─────────────────────────────────────┐
│  ← Compare Rides            🎛️      │
├─────────────────────────────────────┤
│  🟢 Pickup Location                 │
│  ⋮                                  │
│  🔴 Drop Location                   │
│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━   │
│  📏 12.5 km  |  ⏱️ 35 min          │
├─────────────────────────────────────┤
│  Sort by: [Price] Time Rating       │
├─────────────────────────────────────┤
│  ┌─────────────────────────────┐   │
│  │ 🚕 Uber - UberGo            │   │
│  │ ₹245      [BEST VALUE] ⭐    │   │
│  │ ⏱️ 30 min | ⭐ 4.5           │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ 🚖 Ola - Mini               │   │
│  │ ₹252      +₹7               │   │
│  │ ⏱️ 32 min | ⭐ 4.3           │   │
│  └─────────────────────────────┘   │
│                                     │
│  ┌─────────────────────────────┐   │
│  │ 🏍️ Rapido - Bike            │   │
│  │ ₹128      Save ₹117         │   │
│  │ ⏱️ 25 min | ⭐ 4.2  [1.5x]  │   │
│  └─────────────────────────────┘   │
│                                     │
│  ... more rides ...                 │
└─────────────────────────────────────┘
```

### 6. Filter Screen
```
┌─────────────────────────────────────┐
│  ← Filters               Reset      │
├─────────────────────────────────────┤
│  Price Range                        │
│  ₹50 ━━━━●─────●━━━ ₹500           │
│                                     │
│  Providers                          │
│  [Uber] [Ola] [Rapido]             │
│  [Namma Yatri] [BluSmart] [Meru]   │
│                                     │
│  Vehicle Types                      │
│  [Auto] [Bike] [Sedan]             │
│  [SUV] [Electric]                   │
│                                     │
│  [ Apply Filters ]                  │
└─────────────────────────────────────┘
```

### 7. Ride Details Screen
```
┌─────────────────────────────────────┐
│  ← Ride Details                     │
├─────────────────────────────────────┤
│  ┌─────────────────────────────┐   │
│  │      Gradient Header        │   │
│  │         🚕                   │   │
│  │        Uber                  │   │
│  │       UberGo                 │   │
│  │       ₹245                   │   │
│  └─────────────────────────────┘   │
│                                     │
│  Trip Details                       │
│  📏 Distance:      12.5 km          │
│  ⏱️ Time:          30 mins          │
│  ⭐ Rating:        4.5 (1,245)      │
│  📈 Surge:         1.2x             │
│                                     │
│  Price Breakdown                    │
│  ┌─────────────────────────────┐   │
│  │ Base Fare:          ₹50     │   │
│  │ Distance Charge:    ₹150    │   │
│  │ Service Fee:        ₹10     │   │
│  │ GST (5%):          ₹10      │   │
│  │ ──────────────────────────  │   │
│  │ Total:             ₹245     │   │
│  └─────────────────────────────┘   │
│                                     │
│  [ Open in Uber App ]               │
└─────────────────────────────────────┘
```

### 8. Settings Screen
```
┌─────────────────────────────────────┐
│  ← Settings                         │
├─────────────────────────────────────┤
│         🚕 SastaTaxi                │
│        Version 1.0.0                │
│                                     │
│  Preferences                        │
│  📍 Default City                    │
│  🔔 Price Alerts         [OFF]      │
│  🌙 App Theme                       │
│                                     │
│  About                              │
│  ℹ️ About SastaTaxi                 │
│  🔒 Privacy Policy                  │
│  📄 Terms of Service                │
│  💬 Send Feedback                   │
│                                     │
│  Data                               │
│  🕐 Clear Search History            │
│  🗑️ Clear Cache                     │
└─────────────────────────────────────┘
```

## 📊 Data Flow

### Price Comparison Flow
```
User Input (Source, Destination, City)
         ↓
Home Screen (Form Submission)
         ↓
RideComparisonProvider.fetchRidePrices()
         ↓
FetchRidePricesUseCase.execute()
         ↓
RideComparisonRepository.fetchRidePrices()
         ↓
MockRideData.generateRideOptions()
         ↓
PriceCalculator.calculatePrice() (for each provider)
         ↓
ComparisonResultModel.fromRideOptions()
         ↓
State Update
         ↓
UI Rebuild with Ride Options
```

### Filtering Flow
```
User Applies Filter
         ↓
FilterScreen (User Selection)
         ↓
RideComparisonProvider.applyFilters()
         ↓
Repository.filterRides()
         ↓
Filtered List
         ↓
State Update
         ↓
Comparison Screen Updates
```

## 🎨 Unique Features

### 1. Smart Price Calculation
- Provider-specific algorithms
- Metro/Non-metro pricing differences
- Distance-based charges
- Realistic surge pricing
- GST calculation
- Service fees

### 2. City Intelligence
- 40+ cities database
- Metro/Non-metro classification
- Provider availability by city
- Population data
- State information

### 3. Best Value Algorithm
```
Value Score = (Price Score × 0.6) + (Rating Score × 0.4)

Where:
  Price Score = 1 - ((price - min) / (max - min))
  Rating Score = rating / 5.0
```

### 4. Visual Hierarchy
- Cheapest option highlighted with green border
- Savings amount displayed
- Surge pricing alerts
- Provider-specific colors
- Star ratings

### 5. Animations & Transitions
- Page route animations
- Card stagger animations
- Button press effects
- Shimmer loading states
- Smooth scrolling

## 🔧 Technical Features

### State Management Pattern
```
Provider (Singleton)
    ↓
StateNotifierProvider (Business Logic)
    ↓
ConsumerWidget (UI)
```

### Theme System
- Custom color palette
- Typography system (Poppins + Inter)
- Reusable decorations
- Material Design 3
- Dark mode ready

### Error Handling
```
Try-Catch Blocks
    ↓
Custom Exceptions
    ↓
Error State in Provider
    ↓
ErrorStateWidget in UI
```

## 📈 Future Enhancements

1. **API Integration**: Replace mock data with real APIs
2. **Authentication**: User login and profiles
3. **History**: Save search history
4. **Favorites**: Save frequently used routes
5. **Notifications**: Price drop alerts
6. **Analytics**: Track user behavior
7. **Sharing**: Share comparisons with friends
8. **Maps**: Visual route display
9. **Multi-language**: Support for regional languages
10. **Dark Mode**: Complete dark theme

---

**Built with Clean Architecture, SOLID Principles, and ❤️**

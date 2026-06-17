# Project Context: Event Platform V3 (White Label Multi-Tenant Platform)

This file contains the complete consolidated context of the **Event Platform V3** Flutter application. It serves as the primary source of truth for the project's architecture, configurations, white-label design systems, and network endpoints.

---

## 1. Project Architecture

The project is structured following **Clean Architecture** principles coupled with the **BLoC (Business Logic Component)** pattern for state management.

```
lib/
├── bootstrap.dart
├── main_development.dart
├── main_production.dart
├── main_qa.dart
├── core/
│   ├── di/               # Injection configuration (GetIt + Injectable)
│   ├── env/              # Environment-specific configuration
│   ├── firebase/         # Dynamic Firebase initialization & Managers
│   ├── network/          # Network layer (Dio client + Interceptors)
│   ├── routing/          # Routing & Navigation configuration (GoRouter)
│   └── theme/            # Theme & Branding dynamic config managers
├── features/             # Feature domains (vertical slices)
│   ├── about/
│   ├── catalog/
│   ├── categories/
│   ├── content/
│   ├── documents/
│   ├── emergency/
│   ├── event/
│   ├── geography/
│   ├── home/
│   ├── live/
│   ├── maps/
│   ├── notifications/
│   ├── participant/
│   ├── registration/
│   ├── settings/
│   ├── social/
│   ├── tenant/
│   └── tracks/
└── shared/               # Shared widgets and design system components
```

---

## 2. Multi-Tenant White-Label Architecture

The application is engineered to support true White Label dynamic brand configurations without requiring recompilation or individual builds.

### Dynamic Tenant Configuration Flow
1. **Initial Boot:** The application mounts the `SplashScreen` as the entry point.
2. **Retrieve Configuration:** The `SplashScreen` bootstrap sequence queries the configuration from the backend API `/api/tenants/{id}/config` via `FirebaseConfigurationRepository`.
3. **Local Fallback:** If the network is unavailable or the backend fails, the app falls back to the local `DDLN` configuration.
4. **Branding Injection:** The `TenantManager` is updated. Color values (defined as hex strings like `#E58D00`) are parsed dynamically into Flutter `Color` objects at runtime.
5. **Dynamic Firebase Setup:** Firebase Core and Firebase Analytics are re-initialized on-the-fly.
6. **Token Registration:** The application fetches the device's FCM push token and registers it in the backend.
7. **Transition:** The user is seamlessly routed to `/home`.

### Configured Models
* **`TenantConfig`**:
  * `int tenantId`
  * `String tenantName`
  * `String logoUrl`
  * `String primaryColor` (parsed as `#Hex` code)
  * `String secondaryColor` (parsed as `#Hex` code)
  * `String accentColor` (parsed as `#Hex` code)
  * `FirebaseConfig firebase`
  * `FeatureFlags featureFlags`
* **`FirebaseConfig`**: Platform-specific values (`apiKey`, `appId`, `messagingSenderId`, `projectId`, etc.).
* **`FeatureFlags`**: Granular toggles (`enableRegistration`, `enableLiveTracking`, `enableAnalytics`, `enableCrashlytics`, `enableRemoteConfig`).

---

## 3. Network Configuration & Security

All API operations utilize a centralized `Dio` client configured with robust interceptors to comply with backend requirements:

* **Secure API Key:** 
  All calls inject the secure API key header:
  `X-API-Key: juna_api_f7b9c3x2_secure_key_2026`
* **Subpath Preservation (`BaseUrlInterceptor`):**
  Ensures subpaths in tenant base URLs (e.g. `/desafio2026_testtt/api`) are not truncated when Retrofit queries invoke root paths (`/`).
* **Path Sanitization:**
  Strips duplicate `/api` path additions (e.g., converting `.../api/api/eventos` to `.../api/eventos`).

---

## 4. Gradle & Platform Adjustments

To accommodate Firebase Core dependencies, offline secure storage, and stable rendering, multiple adjustments were implemented:

1. **Kotlin Gradle Plugin:** Upgraded `org.jetbrains.kotlin.android` to version `"2.1.0"` inside `android/settings.gradle.kts`.
2. **Android NDK Version:** Set `ndkVersion = "27.0.12077973"` in `android/app/build.gradle.kts`.
3. **Impeller Disabled on Android:** Disabled the experimental Impeller engine inside `android/app/src/main/AndroidManifest.xml` via:
   ```xml
   <meta-data android:name="io.flutter.embedding.android.EnableImpeller" android:value="false" />
   ```
   This redirects rendering to the stable Skia engine, preventing thread commands encoding aborts.

---

## 5. UI Features & Design System

The visual theme complies with **Material Design 3** styled as a high-end dark sports mode.

### Layout Layouts & Screens
* **`MainShellScreen`:** Implements responsive design—rendering a Bottom Navigation Bar on mobile viewports and switching to a persistent Sidebar on desktop/tablet viewports. The mobile burger menu (and corresponding slide-out Drawer) has been completely removed. Dynamic tenant configuration swapping is handled directly via a custom Dropdown button placed in the `AppBar`'s `actions` list on mobile viewports, and at the bottom of the persistent navigation Sidebar on desktop viewports.
* **`HomeScreen`:** Displays dynamic banner carousels based on sports categories, event countdown clocks, and custom SOS buttons.
* **`RegistrationScreen`:** Employs tab bars for new coupon validations and lookup options (DNI search, runner details, chip number pairing).
* **`MapsScreen`:** Integrates `flutter_map` with interactive custom GPX tracks, simulated live runner movements, and layers toggles (*Largada*, *Acreditación*, etc.).
* **`LiveScreen`:** Outputs live leaderboard listings categorized by age divisions and quick social links.
* **`MoreScreen`:** Embeds document download directories, contact messages, and application sharing options.

---

## 6. Participant REST API Updates

Participant update endpoints in `ParticipantApiService` are refactored to remove the `{partiId}` path parameters:

| Description | Old Endpoint | New Endpoint | Parameter Passing |
|---|---|---|---|
| Update Emergency Info | `/api/participantes/{partiId}/emergencia` | `/api/participantes/emergencia` | Query Parameter (`parti_id`) |
| Update Contact Info | `/api/participantes/{partiId}/contacto` | `/api/participantes/contacto` | Query Parameter (`parti_id`) |
| Update Circuit | `/api/participantes/{partiId}/circuito` | `/api/participantes/circuito` | Query Parameter (`parti_id`) |

---

## 7. Verification Commands

To verify compilation and test integrity, use the following workspace commands:

```bash
# Regenerate Generated Files
dart run build_runner build --delete-conflicting-outputs

# Execute Static Analyzer (Clean: 0 warnings, 0 errors)
flutter analyze

# Execute Test Suites (All tests pass)
flutter test
```

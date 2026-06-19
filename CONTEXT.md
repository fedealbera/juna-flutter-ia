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
2. **Retrieve Configuration:** The `SplashScreen` bootstrap sequence requests configuration from `FirebaseConfigurationRepository`.
   * *Fallback:* To prevent startup dependency issues with endpoints not yet available, `FirebaseConfigurationRepositoryImpl` returns `DefaultTenantConfig.ddln()` locally without calling the `/api/tenants/{id}/config` backend endpoint.
3. **Branding Injection:** The `TenantManager` is updated. Color values (defined as hex strings like `#E58D00`) are parsed dynamically into Flutter `Color` objects at runtime.
4. **Dynamic Firebase Setup:** Firebase Core and Firebase Analytics are re-initialized on-the-fly.
5. **FCM Token Retrieval:** The application fetches the device's FCM push token locally, but does *not* send it to the backend on boot.
6. **Transition:** The user is seamlessly routed to `/home`.

---

## 3. Registration & Push Token Linking Logic

To properly link runners with their corresponding push tokens, the token registration endpoint `/api/participantes/token` is called only under specific user actions:

* **Search & Link:** The runner inputs their DNI and searches for their registration inside the "VER PARTICIPANTE" tab on `RegistrationScreen`.
* **Token POST Action:** When the API `GET /api/participantes/{dni}/detalle` returns successfully, the participant is linked (stored in local secure cache via `HiveService`). Only at this point is the `POST /api/participantes/token` endpoint triggered with the runner's DNI, event details, and FCM token. It does not run at application startup.

### Pre-Inscripto vs. Pago Confirmado UI Logic
Based on the value of `nroPlaca` returned by the runner details endpoint:
* **`nroPlaca == "0"` (Pre-Inscripto):**
  * Displays a prominent orange `PRE-INSCRIPTO` tag instead of the plate box.
  * Hides the plate number and plate frames.
  * Displays a custom `PAGAR` button styled with tenant brand colors. Tapping this button launches the runner's unique `linkPago` in an external system browser.
* **`nroPlaca != "0"` (Pago Confirmado):**
  * Displays a green `PAGO CONFIRMADO` tag.
  * Renders a highly highlighted plate code container showing the plate number.
  * Displays a `DOCUMENTACIÓN` button that routes to the document upload screen.

---

## 4. Participant Documentation & Camera Upload Workflow

The document sub-route `/inscripciones/documentacion` manages all required runner certifications:

1. **Document Requirements (GET):** The screen queries `GET /api/participantes/{id}/archivos` using the participant's ID. It retrieves document files and checks their status:
   * `SD` (Sin Entregar) or `OB` (Observado/Rechazado): Shows a **"Subir"** button to capture files.
   * `PE` (En Revisión): Shows a text indicating validation is pending.
   * `AP` (Aprobado): Shows a **"VER"** button opening the public image URL.
2. **Camera Access & Multipart Upload (POST):** Clicking **"Subir"** triggers the native camera via `image_picker`. The photo is sent via a Multipart request to `POST /api/participantes/archivos` containing parameters:
   * `parti_id` (runner ID)
   * `tipo` (e.g. `CERTIFICADO_MEDICO`, `DESLINDE_RESPONSABILIDAD`, `AUTORIZACION_MENORES`)
   * `file` (the image file)
3. **State & Modal Loading Handling:**
   * During upload, a local stack-based `_isUploading` loading overlay is displayed on top of the screen to block interaction.
   * On API completion, the overlay is hidden and an `AlertDialog` (Success / Error) is displayed.
   * To prevent routing bugs, the alert dialog is closed using `dialogContext` in `Navigator.of(dialogContext).pop()` to ensure only the modal dialog is popped and the participant remains on the documentation screen.
   * On success, the state of the document updates locally to `PE` (En Revisión).

---

## 5. Exit & Session Termination

* **Close Application:** Tapping the exit or close session option in `MoreScreen` terminates the application process cleanly by invoking `SystemNavigator.pop()`.

---

## 6. Gradle & Platform Adjustments

To accommodate Firebase Core dependencies, offline secure storage, stable rendering, and dynamic FCM push notifications, multiple adjustments were implemented:

1. **Kotlin Gradle Plugin:** Upgraded `org.jetbrains.kotlin.android` to version `"2.1.0"` inside `android/settings.gradle.kts`.
2. **Android NDK Version:** Set `ndkVersion = "27.0.12077973"` in `android/app/build.gradle.kts`.
3. **Impeller Disabled on Android:** Disabled the experimental Impeller engine inside `android/app/src/main/AndroidManifest.xml` via:
   ```xml
   <meta-data android:name="io.flutter.embedding.android.EnableImpeller" android:value="false" />
   ```
   This redirects rendering to the stable Skia engine, preventing thread commands encoding aborts.
4. **Bundle ID & Application ID Update:** Native settings on both Android (`namespace` and `applicationId` inside `android/app/build.gradle.kts`) and iOS (`PRODUCT_BUNDLE_IDENTIFIER` inside `project.pbxproj`) are set to `com.churo.desafiomobile` to align with the DDLN Firebase projects.
5. **Google Services integration:** 
   - Placed the DDLN `google-services.json` and `GoogleService-Info.plist` config files inside their respective Android (`android/app/`) and iOS (`ios/Runner/`) directories.
   - Applied the Google Services Gradle plugin on Android and programmatically linked the Plist/Entitlements to the Xcode project workspace.
   - Added remote notification permissions and background configurations (background modes and `aps-environment` capabilities).

---

## 7. UI Features & Design System

The visual theme complies with **Material Design 3** styled as a high-end dark sports mode.

### Layout Layouts & Screens
* **`MainShellScreen`:** Implements responsive design—rendering a Bottom Navigation Bar on mobile viewports and switching to a persistent Sidebar on desktop/tablet viewports. The mobile burger menu (and corresponding slide-out Drawer) has been completely removed. Dynamic tenant configuration swapping is handled directly via a custom Dropdown button placed in the `AppBar`'s `actions` list on mobile viewports, and at the bottom of the persistent navigation Sidebar on desktop viewports.
* **`HomeScreen`:** Displays dynamic banner carousels based on sports categories, event countdown clocks, and custom SOS buttons.
* **`RegistrationScreen`:** Employs tab bars for new coupon validations and lookup options (DNI search, runner details, chip number pairing).
* **`MapsScreen`:** Integrates `flutter_map` with interactive custom GPX tracks, simulated live runner movements, and layers toggles (*Largada*, *Acreditación*, etc.).
* **`LiveScreen`:** Outputs live leaderboard listings categorized by age divisions and quick social links.
* **`MoreScreen`:** Embeds document download directories, contact messages, and application sharing options.

---

## 8. Participant REST API Updates

Participant update endpoints in `ParticipantApiService` are refactored to remove the `{partiId}` path parameters:

| Description | Old Endpoint | New Endpoint | Parameter Passing |
|---|---|---|---|
| Update Emergency Info | `/api/participantes/{partiId}/emergencia` | `/api/participantes/emergencia` | Query Parameter (`parti_id`) |
| Update Contact Info | `/api/participantes/{partiId}/contacto` | `/api/participantes/contacto` | Query Parameter (`parti_id`) |
| Update Circuit | `/api/participantes/{partiId}/circuito` | `/api/participantes/circuito` | Query Parameter (`parti_id`) |
| List Documentation | N/A | `/api/participantes/{id}/archivos` | Path Parameter (`id`) |
| Upload Document | N/A | `/api/participantes/archivos` | Multipart Parameters (`parti_id`, `tipo`, `file`) |

---

## 9. Verification Commands

To verify compilation and test integrity, use the following workspace commands:

```bash
# Regenerate Generated Files
dart run build_runner build --delete-conflicting-outputs

# Execute Static Analyzer (Clean: 0 warnings, 0 errors)
flutter analyze

# Execute Test Suites (All tests pass)
flutter test
```

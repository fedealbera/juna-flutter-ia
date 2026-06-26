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
   * *Active Tenant Fallback:* `FirebaseConfigurationRepositoryImpl` returns `ActiveTenantConfig.get()` locally without calling the `/api/tenants/{id}/config` backend endpoint. The `lib/core/firebase/active_tenant_config.dart` file is **generated automatically** by `scripts/configure_tenant.py` at build-time for each tenant. It contains the correct Firebase credentials (read from `google-services.json`), branding colors, and environment URLs for the active tenant. This ensures the correct URLs and configs are always loaded at boot regardless of which tenant is compiled.
3. **Branding Injection:** The `TenantManager` is updated. Color values (defined as hex strings like `#E58D00`) are parsed dynamically into Flutter `Color` objects at runtime.
4. **Dynamic Firebase Setup:** Firebase Core and Firebase Analytics are re-initialized on-the-fly.
5. **FCM Token Retrieval:** The application fetches the device's FCM push token locally, but does *not* send it to the backend on boot.
6. **Transition:** The user is seamlessly routed to `/home`.
7. **Dynamic Theme & Configuration Sync from Settings:** In addition, when settings are fetched from `/api/eventos/{eventoId}/settings?idOrg={idOrg}`, if the key `PRIMARY_COLOR` is found in the response, `SettingsRepositoryImpl` dynamically calls `TenantManager.changeTenant` with an updated config using `copyWith` to refresh the primary brand color globally.

### Push Notifications Background Support & Isolate Syncing
* **Native Tray Alerts:** Uses `flutter_local_notifications` to programmatically display native system tray notification alerts from data-only FCM push payloads when the application is in the background or closed.
* **Isolate Database Syncing:**
  * To prevent database file access locks, the top-level `@pragma('vm:entry-point')` function `firebaseMessagingBackgroundHandler` wraps database updates in a `try/finally` block to close the Hive `notifications_box` immediately after writing background notifications.
  * Mixed `WidgetsBindingObserver` into `NotificationService` to close the `notifications_box` box when the app goes into the background (`paused`/`detached`), and automatically reopen it and reload the notifications list (`refreshNotifications()`) when the app is resumed (`resumed`).

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

### Discount Code Validation Mapping
Tapping the "Validar" button triggers a POST request to `/api/inscripciones/{insId}/descuento` sending a body containing `codigo`. The response is mapped as follows:
* **`dispo_cod == "VIGENTE"`:** Displays an `AlertDialog` confirming the code validation and detailing its validity range (`locd_fecha_inicio` to `locd_fecha_fin`) with a font size of 16.
* **Otherwise:** Displays an `AlertDialog` with the error `dispo_msg` returned from the API, and sets the local validation state to false.

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
3. **Java 8+ Desugaring:** Enabled desugaring support (`isCoreLibraryDesugaringEnabled = true`) inside `android/app/build.gradle.kts`'s `compileOptions` block and added `coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")` to support modern Java APIs utilized by the notification plugin on older Android target configurations.
4. **Impeller Disabled on Android:** Disabled the experimental Impeller engine inside `android/app/src/main/AndroidManifest.xml` via:
   ```xml
   <meta-data android:name="io.flutter.embedding.android.EnableImpeller" android:value="false" />
   ```
   This redirects rendering to the stable Skia engine, preventing thread commands encoding aborts.
5. **Bundle ID & Application ID Update:** Native settings on both Android (`namespace` and `applicationId` inside `android/app/build.gradle.kts`) and iOS (`PRODUCT_BUNDLE_IDENTIFIER` inside `project.pbxproj`) are dynamically swapped at build configuration time to match the target tenant.
6. **Google Services & Keystore Signatures:** 
   - Swaps DDLN and 21kLG configurations (`google-services.json` and `GoogleService-Info.plist`) inside Android and iOS workspace targets.
   - Automatically swaps release signing configurations (`key.properties` referencing the global keystore `churosign.ks`) under `android/app/` to produce ready-to-release signed APKs and AAB bundles.
   - Configures push notification permission registries and capabilities.

---

## 7. UI Features & Design System

The visual theme complies with **Material Design 3** styled as a high-end dark sports mode.

### Layout Layouts & Screens
* **`MainShellScreen`:** Implements responsive design—rendering a Bottom Navigation Bar on mobile viewports and switching to a persistent Sidebar on desktop/tablet viewports. The mobile burger menu (and corresponding slide-out Drawer) has been completely removed. Dynamic tenant configuration swapping is handled directly via a custom Dropdown button placed in the `AppBar`'s `actions` list on mobile viewports, and at the bottom of the persistent navigation Sidebar on desktop viewports.
* **`HomeScreen`:** Displays dynamic banner carousels based on sports categories, event countdown clocks, and custom SOS buttons. The hero banner image is loaded dynamically from the settings key `IMAGE_BANNER`. All explicit fallback banner URLs have been removed, and the banner container is hidden conditionally if `IMAGE_BANNER` is empty or not provided. The **Next Event Countdown card** uses a dynamic gradient computed from the active tenant's primary and secondary colors: if the secondary color has high luminance (bright), the gradient blends toward the dark background `#1E1E1E` for contrast; otherwise it uses the secondary color directly. The **"Ver Inscripción"** button uses luminance-aware coloring—if the primary color is very dark, it uses the tenant's accent color for both border and text to ensure visibility. On the day of the race (`isRaceDay` is true), the block-based countdown timer numbers and "Ver Inscripción" button are hidden from the countdown card, replaced by a compact glassmorphic live status badge ("¡EL EVENTO ESTÁ EN MARCHA!") with a pulsing red status indicator. This shrinks the card height significantly, raising the prominence and accessibility of the critical SOS emergency flow. The **SOS Emergency button** integrates the `geolocator` package to asynchronously fetch the device's real GPS coordinates (latitude/longitude) upon confirmation, prompting the user for location permissions and displaying a progress loader during resolution, with a graceful fallback to default coordinates if permissions are denied. It is placed above the weather card on the main layout. The **Weather & Gear Advisory card** dynamically fetches current weather data from the Open-Meteo API using the event settings' starting coordinates (`latLargada`/`lonLargada` or fallback Tucumán coordinates) and calculates altitudes/checkpoints for Base, Summit (Cumbre: -10°C, wind * 2.5), and Arrival (Llegada: +1°C) alongside safety alerts (e.g. windbreaker requirements, UV warning index, hydration volume recommendations). A **dynamic floating scroll-down indicator pill** ("MÁS INFORMACIÓN" with a double down arrow icon) overlays the content at the bottom center of the screen, automatically fading out smoothly when the user scrolls past `30` pixels to reveal more content and fading back in when scrolled to the top. It uses `IgnorePointer` to prevent blocking tap events on elements behind it.
* **`RegistrationScreen`:** Employs tab bars for new coupon validations and lookup options. The search text field has a character limit of 8 (default DNI length) with its label set as "DNI". In the "VER PARTICIPANTE" tab:
  * The "PAGAR" and "DOCUMENTACIÓN" buttons are styled with explicit white font and icon colors.
  * If the participant details response contains a discount code (`insCodDesc`), a glassmorphic **Código de Descuento** card section is conditionally displayed below the participant details card. This card contains an input field (`AppTextField` without a label) to edit the discount code and a validate button (`Validar`) that triggers the real validation.
  * The "DESVINCULAR" and "EDITAR DATOS" buttons are refactored to use the unified design system `AppButton` component, ensuring a consistent height of `52dp` and standard scaling/cursor animations.
  * The `RegistrationWebView` uses vertical and horizontal drag gesture recognizers on the `WebViewWidget` constructor to prevent scroll blocking.
* **`EditParticipantScreen`:** Provides input fields to modify contact (`contCelular`, `contEmail`, `contInstagram`) and emergency contact details (`contNombre`, `contTel`). The emergency contact section is displayed always (the condition hiding it when `nroPlaca == 0` has been removed). Saving data on this screen triggers a single unified `PUT /api/participantes/{partiId}` request to save both contact and emergency info in one action.
* **`MapsScreen`:** Integrates `flutter_map` with interactive custom GPX tracks, simulated live runner movements, and layers toggles (*Largada*, *Acreditación*, etc.).
* **`LiveScreen`:** Outputs live leaderboard listings categorized by age divisions and quick social links.
* **`MoreScreen`:** Embeds document download directories, contact messages, and application sharing options. The **"Acerca de"** section displays: 1) custom logo PNG asset (`assets/images/juna_app_logo.png`), 2) app description text, 3) clickable mailto link to `churomobile@gmail.com`, 4) app version, and 5) an **Actualizar la App** button (with explicit `textColor: Colors.white`). The update button parses `URL_STORES` dynamically, determines the current platform using `Theme.of(context).platform`, and redirects to either the `ANDROID` or `IOS` store URL. Font sizes in this section are: `ACERCA DE` header at `13`, and all body texts (description, email, version) at `15`.

### Design System — `AppButton`
`AppButton` (`lib/shared/design_system/buttons/app_button.dart`) supports optional override parameters:
* `color` — overrides the background fill color for any button type.
* `textColor` — overrides the label/icon text color.
* `borderColor` — overrides the border color (also activates a border if type is not `outlined`).
These allow per-usage custom styling without subclassing, enabling tenant-aware coloring directly at the call site. The inner `Icon` dynamically inherits the button's text color (`_getTextColor(theme)`) to ensure complete visual consistency.

### Design System — `AppTextField`
`AppTextField` (`lib/shared/design_system/text_fields/app_text_field.dart`) supports an optional `label` parameter (defaulting to `""`). When no label is provided or is empty, the label widget and its accompanying vertical spacing are omitted from the layout, facilitating cleaner UI designs.

### Design System — Fallback Branding Logo
The fallback logo container (`_fallbackLogo` inside `BrandingManager`) has been redesigned into a premium glowing pill-style badge. It features:
* A linear gradient background blending the tenant's primary theme color at different opacities.
* A sharp, colored neon border.
* Uppercase typography with custom letter spacing for high-end sport aesthetics.
* A live glowing circular status dot in the primary color, making it look modern and alive.

---

## 8. Participant REST API Updates

Participant update endpoints in `ParticipantApiService` are refactored to remove the `{partiId}` path parameters where applicable, and a single unified update endpoint is added:

| Description | Old Endpoint | New Endpoint | Parameter Passing |
|---|---|---|---|
| Update Emergency Info | `/api/participantes/{partiId}/emergencia` | `/api/participantes/emergencia` | Query Parameter (`parti_id`) |
| Update Contact Info | `/api/participantes/{partiId}/contacto` | `/api/participantes/contacto` | Query Parameter (`parti_id`) |
| Update Circuit | `/api/participantes/{partiId}/circuito` | `/api/participantes/circuito` | Query Parameter (`parti_id`) |
| List Documentation | N/A | `/api/participantes/{id}/archivos` | Path Parameter (`id`) |
| Upload Document | N/A | `/api/participantes/archivos` | Multipart Parameters (`parti_id`, `tipo`, `file`) |
| Update Participant | N/A | `/api/participantes/{partiId}` | Path Parameter (`partiId`) & JSON Body |

---

## 9. Verification & Build Commands

To verify compilation and test integrity, use the following workspace commands:

```bash
# Regenerate Generated Files
dart run build_runner build --delete-conflicting-outputs

# Execute Static Analyzer (Clean: 0 warnings, 0 errors)
flutter analyze

# Execute Test Suites (All tests pass)
flutter test
```

---

## 10. Build-Time Multi-Tenant Compilation Pipeline

To support clean native builds and unique package configurations per tenant across different environments, a build-time configuration system has been implemented:

### Automation Script (`scripts/configure_tenant.py`)
This script automates all steps needed to target a specific tenant:
1. **Config Copying:** Copies native configurations (`AndroidManifest.xml`, `google-services.json`, `GoogleService-Info.plist`, `Info.plist`, `Runner.entitlements`, and `key.properties`) from `tenants/<tenant>/` to respective native directories.
2. **Kotlin Refactoring:** Automatically parses `MainActivity.kt`, adjusts the package name, deletes old directories to prevent Gradle compilation conflicts, and places the refactored Kotlin file in the correct directory path matching the bundle ID.
3. **iOS Bundle ID Update:** Automatically matches the bundle identifier inside `ios/Runner.xcodeproj/project.pbxproj` using regular expressions.
4. **Dart Entrypoints & Active Tenant Config Generation:** Rewrites environment configuration entrypoints (`lib/main_development.dart`, `lib/main_qa.dart`, and `lib/main_production.dart`) to inject tenant-specific Base URLs and API Keys. Additionally, generates `lib/core/firebase/active_tenant_config.dart` by reading Firebase credentials from `tenants/<tenant>/google-services.json` and branding values (colors, logo URL) from the `branding` key in `tenants/<tenant>/config.json`. This file is consumed by `FirebaseConfigurationRepositoryImpl` as the local fallback tenant configuration.
5. **Asset Generation:** Triggers launcher icon and native splash updates dynamically via `flutter_launcher_icons` and `flutter_native_splash`.

### Tenant `config.json` Schema
Each tenant's `tenants/<tenant>/config.json` now supports a `branding` section:
```json
{
  "tenantId": "<id>",
  "appName": "<name>",
  "packageName": "<package>",
  "branding": {
    "primaryColor": "#RRGGBB",
    "secondaryColor": "#RRGGBB",
    "accentColor": "#RRGGBB",
    "logoUrl": "<asset path or https URL>"
  },
  "environments": {
    "development": { "baseUrl": "...", "apiKey": "..." },
    "qa": { "baseUrl": "...", "apiKey": "..." },
    "production": { "baseUrl": "...", "apiKey": "..." }
  }
}
```
The `branding` values are injected into the generated `active_tenant_config.dart` at configuration time.

### Available Makefile Targets
The `Makefile` exposes simple targets to easily configure, run, and compile the application:

* **Configure Tenants:**
  - `make config-ddln` - Configures the workspace for the DDLN tenant.
  - `make config-21klg` - Configures the workspace for the 21kLG tenant.
* **Run App:**
  - `make run-dev` - Runs the application targeting the Development environment.
  - `make run-qa` - Runs the application targeting the QA environment.
  - `make run-prod` - Runs the application targeting the Production environment.
* **Build Targets (Stand-alone):**
  - **APK:** `make build-apk-dev` / `make build-apk-qa` / `make build-apk-prod`
  - **AAB:** `make build-aab-dev` / `make build-aab-qa` / `make build-aab-prod`
  - **IPA:** `make build-ipa-dev` / `make build-ipa-qa` / `make build-ipa-prod`
* **Combined Tenant Production Builds:**
  - `make build-ddln-apk-prod` - Automatically switches configuration to DDLN and builds production APK.
  - `make build-ddln-aab-prod` - Automatically switches configuration to DDLN and builds production AAB.
  - `make build-ddln-ipa-prod` - Automatically switches configuration to DDLN and builds production IPA.
  - `make build-21klg-apk-prod` - Automatically switches configuration to 21kLG and builds production APK.
  - `make build-21klg-aab-prod` - Automatically switches configuration to 21kLG and builds production AAB.
  - `make build-21klg-ipa-prod` - Automatically switches configuration to 21kLG and builds production IPA.
* **Helpers:**
  - `make clean` - Cleans build caches.
  - `make get` - Installs packages via `flutter pub get`.



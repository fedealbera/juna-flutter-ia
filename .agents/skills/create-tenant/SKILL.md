---
name: create-tenant
description: Guides the agent on how to create, configure, and integrate a new white-label tenant in the Event Platform V3 project.
---

# Skill: Create White-Label Tenant

Use this skill when the user asks to add, create, or configure a new tenant (branding / client) in the Event Platform V3 white-label application.

---

## 1. Directory Structure Setup

A new directory must be created under the `tenants/` root folder:
```
tenants/
└── <new_tenant_lowercase>/
    ├── config.json
    ├── google-services.json
    ├── GoogleService-Info.plist
    ├── key.properties (optional release keys config)
    ├── churosign.ks (optional keystore)
    ├── android/
    │   └── app/
    │       └── src/
    │           └── main/
    │               └── res/ (custom icons / drawables overrides)
    └── ios/
        └── Runner/
            └── Assets.xcassets/ (custom iOS assets overrides)
```

---

## 2. Configuration Schema (`config.json`)

Every tenant requires a `config.json` inside its folder. You must prompt the user or construct a config file complying with the following schema:

```json
{
  "tenantId": "<numeric_or_string_id>",
  "appName": "<App Display Name>",
  "packageName": "com.<organization>.<appName>",
  "branding": {
    "primaryColor": "#HEXCOLOR",
    "secondaryColor": "#HEXCOLOR",
    "accentColor": "#HEXCOLOR",
    "logoUrl": "<path_to_assets_or_url>"
  },
  "environments": {
    "development": {
      "baseUrl": "https://api.example.com/dev",
      "apiKey": "DEV_API_KEY"
    },
    "qa": {
      "baseUrl": "https://api.example.com/qa",
      "apiKey": "QA_API_KEY"
    },
    "production": {
      "baseUrl": "https://api.example.com/prod",
      "apiKey": "PROD_API_KEY"
    }
  }
}
```

*Ensure the `primaryColor`, `secondaryColor`, and `accentColor` values are complete 6-character hex color strings.*

---

## 3. Native Configurations

The agent must obtain the following files from the user (or instruct them to put them in the directory):
1. **Android Firebase:** Place the Firebase dynamic configuration file `google-services.json` inside `tenants/<new_tenant_lowercase>/`.
2. **iOS Firebase:** Place the Firebase dynamic configuration file `GoogleService-Info.plist` inside `tenants/<new_tenant_lowercase>/`.
3. **App Launcher Icons / Splash Screen:** Use the `flutter_launcher_icons` and `flutter_native_splash` parameters inside the config setup, or place custom overrides under `tenants/<new_tenant_lowercase>/android/` and `tenants/<new_tenant_lowercase>/ios/`.

---

## 4. Makefile Integration

You must modify the root `Makefile` to add targets for the new tenant. Open [Makefile](file:///Users/federicoalbera/Documents/Proyectos/LeapFactor/Flutter/proyectos/juna_flutter_ia/Makefile) and add targets in the respective blocks:

```makefile
# --- Configurations ---
config-<new_tenant>:
	python3 scripts/configure_tenant.py --tenant <new_tenant_lowercase>

# --- Tenant Production Builds ---
build-<new_tenant>-apk-prod:
	python3 scripts/configure_tenant.py --tenant <new_tenant_lowercase>
	flutter build apk --flavor production -t lib/main_production.dart

build-<new_tenant>-aab-prod:
	python3 scripts/configure_tenant.py --tenant <new_tenant_lowercase>
	flutter build appbundle --flavor production -t lib/main_production.dart

build-<new_tenant>-ipa-prod:
	python3 scripts/configure_tenant.py --tenant <new_tenant_lowercase>
	flutter build ipa --flavor production -t lib/main_production.dart
```

---

## 5. Execution Pipeline

When executing this skill, follow these sequential steps:
1. **Align with the User:** Confirm the new tenant details (Name, Package name, branding colors, base API URLs, and Firebase files).
2. **Write Configuration Files:** Create the config files and copy assets into the folder directory.
3. **Edit Makefile:** Add the new configuration and build targets.
4. **Trigger Configuration:** Run `make config-<new_tenant>` to verify the python bootstrap setup script copies the native variables correctly.
5. **Verify Compilation:** Run `flutter analyze` to ensure no native/compilation settings were broken during kotlin package refactoring.

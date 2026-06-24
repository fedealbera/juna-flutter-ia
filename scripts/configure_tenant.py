#!/usr/bin/env python3
import os
import sys
import json
import re
import shutil
import argparse
import subprocess

def parse_args():
    parser = argparse.ArgumentParser(description="Configure app tenant and environment settings.")
    parser.add_argument(
        "--tenant",
        required=True,
        help="Name of the tenant folder inside tenants/ (e.g. ddln, 21klg)",
    )
    return parser.parse_args()

def main():
    args = parse_args()
    tenant = args.tenant.lower()
    
    tenant_dir = os.path.join("tenants", tenant)
    if not os.path.exists(tenant_dir):
        print(f"Error: Tenant directory '{tenant_dir}' does not exist.")
        sys.exit(1)
        
    config_path = os.path.join(tenant_dir, "config.json")
    if not os.path.exists(config_path):
        print(f"Error: config.json not found in '{tenant_dir}'.")
        sys.exit(1)
        
    with open(config_path, "r") as f:
        config = json.load(f)
        
    app_name = config.get("appName", "")
    package_name = config.get("packageName", "")
    envs = config.get("environments", {})
    
    print(f"==========================================")
    print(f"Configuring app for Tenant: {app_name}")
    print(f"Package Name: {package_name}")
    print(f"==========================================")
    
    # 1. Copy android native files
    print("-> Copying Android native configuration files...")
    os.makedirs("android/app/src/main/res/xml", exist_ok=True)
    os.makedirs("android/app/src/main/res/drawable", exist_ok=True)
    
    shutil.copy2(os.path.join(tenant_dir, "google-services.json"), "android/app/google-services.json")
    shutil.copy2(os.path.join(tenant_dir, "AndroidManifest.xml"), "android/app/src/main/AndroidManifest.xml")
    shutil.copy2(os.path.join(tenant_dir, "build.gradle.kts"), "android/app/build.gradle.kts")
    shutil.copy2(os.path.join(tenant_dir, "filepaths.xml"), "android/app/src/main/res/xml/filepaths.xml")
    shutil.copy2(os.path.join(tenant_dir, "ic_launcher.png"), "android/app/src/main/res/drawable/ic_launcher.png")
    
    # Optional signing key properties
    key_properties_src = os.path.join(tenant_dir, "key.properties")
    if os.path.exists(key_properties_src):
        shutil.copy2(key_properties_src, "android/key.properties")
        # Copy the referenced keystore file from tenant directory to android/app/ if it exists there
        try:
            with open(key_properties_src, "r") as f:
                for line in f:
                    if line.strip().startswith("storeFile="):
                        store_file_name = line.strip().split("=")[1].strip()
                        tenant_keystore_src = os.path.join(tenant_dir, store_file_name)
                        if os.path.exists(tenant_keystore_src):
                            print(f"-> Copying keystore {store_file_name} to android/app/...")
                            shutil.copy2(tenant_keystore_src, os.path.join("android/app", store_file_name))
        except Exception as e:
            print(f"Warning: Failed to copy keystore file: {e}")
    else:
        # If not present, write an empty key properties file to prevent Gradle build crash
        with open("android/key.properties", "w") as f:
            f.write("# Placeholder key properties\n")
            
    # 2. Copy iOS native files
    print("-> Copying iOS native configuration files...")
    os.makedirs("ios/Runner", exist_ok=True)
    shutil.copy2(os.path.join(tenant_dir, "GoogleService-Info.plist"), "ios/Runner/GoogleService-Info.plist")
    shutil.copy2(os.path.join(tenant_dir, "Info.plist"), "ios/Runner/Info.plist")
    shutil.copy2(os.path.join(tenant_dir, "Runner.entitlements"), "ios/Runner/Runner.entitlements")
    
    # 3. Copy launcher icon/splash yamls to root
    print("-> Copying icon and splash settings...")
    shutil.copy2(os.path.join(tenant_dir, "flutter_icons.yaml"), "flutter_icons.yaml")
    shutil.copy2(os.path.join(tenant_dir, "flutter_splash.yaml"), "flutter_splash.yaml")
    
    # 4. Configure Android Kotlin package and MainActivity.kt location
    print("-> Restructuring Android Kotlin directory to match package...")
    kotlin_base = "android/app/src/main/kotlin"
    
    # Find existing MainActivity.kt recursively
    main_activity_path = None
    for root, dirs, files in os.walk(kotlin_base):
        if "MainActivity.kt" in files:
            main_activity_path = os.path.join(root, "MainActivity.kt")
            break
            
    if main_activity_path:
        with open(main_activity_path, "r") as f:
            lines = f.readlines()
            
        # Update package statement
        new_lines = []
        for line in lines:
            if line.strip().startswith("package "):
                new_lines.append(f"package {package_name}\n")
            else:
                new_lines.append(line)
                
        # Remove old directories to avoid duplicate code compiles
        old_parent = os.path.dirname(main_activity_path)
        shutil.rmtree(old_parent, ignore_errors=True)
        # Also double check and clean any empty folders under com/
        com_dir = os.path.join(kotlin_base, "com")
        if os.path.exists(com_dir):
            shutil.rmtree(com_dir, ignore_errors=True)
            
        # Create new folder structure
        new_dir = os.path.join(kotlin_base, *package_name.split("."))
        os.makedirs(new_dir, exist_ok=True)
        
        with open(os.path.join(new_dir, "MainActivity.kt"), "w") as f:
            f.writelines(new_lines)
    else:
        print("Warning: MainActivity.kt not found in android directory.")
        
    # 5. Configure iOS bundle identifier in project.pbxproj
    print("-> Updating iOS Bundle Identifier in project.pbxproj...")
    pbxproj_path = "ios/Runner.xcodeproj/project.pbxproj"
    if os.path.exists(pbxproj_path):
        with open(pbxproj_path, "r") as f:
            content = f.read()
            
        # Replace occurrences of PRODUCT_BUNDLE_IDENTIFIER = ...;
        new_content = re.sub(
            r"PRODUCT_BUNDLE_IDENTIFIER = [^;]+;",
            f"PRODUCT_BUNDLE_IDENTIFIER = {package_name};",
            content
        )
        
        with open(pbxproj_path, "w") as f:
            f.write(new_content)
    else:
        print("Warning: ios/Runner.xcodeproj/project.pbxproj not found.")
        
    # 6. Rewrite Dart environment files with tenant-specific Base URLs
    print("-> Injecting Base URLs into environment entrypoints...")
    os.makedirs("lib/core/env", exist_ok=True)
    
    # Generate main_development.dart
    dev_env = envs.get("development", {})
    dev_url = dev_env.get("baseUrl", "")
    dev_key = dev_env.get("apiKey", "")
    with open("lib/main_development.dart", "w") as f:
        f.write(f"""import 'bootstrap.dart';
import 'core/env/env_config.dart';

void main() {{
  final devConfig = EnvConfig(
    environment: AppEnvironment.development,
    baseUrl: '{dev_url}',
    apiKey: '{dev_key}',
    enableAnalytics: false,
  );

  bootstrap(devConfig);
}}
""")

    # Generate main_qa.dart
    qa_env = envs.get("qa", {})
    qa_url = qa_env.get("baseUrl", "")
    qa_key = qa_env.get("apiKey", "")
    with open("lib/main_qa.dart", "w") as f:
        f.write(f"""import 'bootstrap.dart';
import 'core/env/env_config.dart';

void main() {{
  final qaConfig = EnvConfig(
    environment: AppEnvironment.qa,
    baseUrl: '{qa_url}',
    apiKey: '{qa_key}',
    enableAnalytics: true,
  );

  bootstrap(qaConfig);
}}
""")

    # Generate main_production.dart
    prod_env = envs.get("production", {})
    prod_url = prod_env.get("baseUrl", "")
    prod_key = prod_env.get("apiKey", "")
    with open("lib/main_production.dart", "w") as f:
        f.write(f"""import 'bootstrap.dart';
import 'core/env/env_config.dart';

void main() {{
  final prodConfig = EnvConfig(
    environment: AppEnvironment.production,
    baseUrl: '{prod_url}',
    apiKey: '{prod_key}',
    enableAnalytics: true,
  );

  bootstrap(prodConfig);
}}
""")

    # Generate active_tenant_config.dart
    branding = config.get("branding", {})
    primary_color = branding.get("primaryColor", "#E58D00")
    secondary_color = branding.get("secondaryColor", "#212121")
    accent_color = branding.get("accentColor", "#FFC107")
    logo_url = branding.get("logoUrl", "https://images.unsplash.com/photo-1551632879-6dfc301c3490?w=150&q=80")

    google_services_path = os.path.join(tenant_dir, "google-services.json")
    firebase_config = {
        "apiKey": "",
        "appId": "",
        "messagingSenderId": "",
        "projectId": "",
        "storageBucket": "",
    }
    if os.path.exists(google_services_path):
        try:
            with open(google_services_path, "r") as f:
                gs_data = json.load(f)
                project_info = gs_data.get("project_info", {})
                firebase_config["projectId"] = project_info.get("project_id", "")
                firebase_config["messagingSenderId"] = project_info.get("project_number", "")
                firebase_config["storageBucket"] = project_info.get("storage_bucket", "")
                
                clients = gs_data.get("client", [])
                if clients:
                    client = clients[0]
                    client_info = client.get("client_info", {})
                    firebase_config["appId"] = client_info.get("mobilesdk_app_id", "")
                    
                    api_keys = client.get("api_key", [])
                    if api_keys:
                        firebase_config["apiKey"] = api_keys[0].get("current_key", "")
        except Exception as e:
            print(f"Warning: Failed to parse google-services.json: {e}")

    tenant_id_map = {
        "ddln": 1,
        "21klg": 2,
    }
    tenant_id_str = config.get("tenantId", "ddln")
    tenant_id_int = tenant_id_map.get(tenant_id_str, 1)

    active_config_path = "lib/core/firebase/active_tenant_config.dart"
    with open(active_config_path, "w") as f:
        f.write(f"""import '../theme/tenant_config.dart';
import 'tenant_firebase_config.dart';
import '../env/env_config.dart';

class ActiveTenantConfig {{
  static TenantConfig get() {{
    return TenantConfig(
      tenantId: {tenant_id_int},
      tenantName: '{app_name}',
      logoUrl: '{logo_url}',
      primaryColor: '{primary_color}',
      secondaryColor: '{secondary_color}',
      accentColor: '{accent_color}',
      firebase: const FirebaseConfig(
        apiKey: '{firebase_config["apiKey"]}',
        appId: '{firebase_config["appId"]}',
        messagingSenderId: '{firebase_config["messagingSenderId"]}',
        projectId: '{firebase_config["projectId"]}',
        storageBucket: '{firebase_config["storageBucket"]}',
        iosBundleId: '{package_name}',
      ),
      featureFlags: const FeatureFlags(
        enableRegistration: true,
        enableLiveTracking: true,
        enableAnalytics: true,
        enableCrashlytics: true,
        enableRemoteConfig: true,
      ),
      baseUrl: '{dev_url}',
      environments: const {{
        AppEnvironment.development: TenantEnvConfig(
          baseUrl: '{dev_url}',
          apiKey: '{dev_key}',
        ),
        AppEnvironment.qa: TenantEnvConfig(
          baseUrl: '{qa_url}',
          apiKey: '{qa_key}',
        ),
        AppEnvironment.production: TenantEnvConfig(
          baseUrl: '{prod_url}',
          apiKey: '{prod_key}',
        ),
      }},
    );
  }}
}}
""")

    # 7. Run flutter launcher icons and native splash generation
    print("-> Generating Launcher Icons...")
    subprocess.run(
        ["flutter", "pub", "run", "flutter_launcher_icons:main", "-f", "flutter_icons.yaml"],
        check=True
    )
    
    print("-> Generating Native Splash screen...")
    subprocess.run(
        ["flutter", "pub", "run", "flutter_native_splash:create", "--path=flutter_splash.yaml"],
        check=True
    )
    
    print(f"\nConfiguration completed successfully for '{app_name}'!")
    print(f"You can now run/build the app for environment (development/qa/production) using standard flutter targets.")

if __name__ == "__main__":
    main()

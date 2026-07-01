export ANDROID_HOME := /Users/federicoalbera/Library/Android/sdk

.PHONY: config-ddln config-21klg run-dev run-qa run-prod build-apk-dev build-apk-qa build-apk-prod build-aab-dev build-aab-qa build-aab-prod build-ipa-dev build-ipa-qa build-ipa-prod build-ddln-apk-dev build-ddln-apk-prod build-ddln-aab-prod build-ddln-ipa-prod build-21klg-apk-dev build-21klg-apk-prod build-21klg-aab-prod build-21klg-ipa-prod clean get help

help:
	@echo "Available commands:"
	@echo "  make config-ddln           - Configure application for DDLN tenant"
	@echo "  make config-21klg          - Configure application for 21kLG tenant"
	@echo "  make run-dev               - Run the application in DEVELOPMENT environment"
	@echo "  make run-qa                - Run the application in QA environment"
	@echo "  make run-prod              - Run the application in PRODUCTION environment"
	@echo "  make build-apk-dev         - Build Android APK in DEVELOPMENT environment"
	@echo "  make build-apk-qa          - Build Android APK in QA environment"
	@echo "  make build-apk-prod        - Build Android APK in PRODUCTION environment"
	@echo "  make build-aab-dev         - Build Android AAB (App Bundle) in DEVELOPMENT environment"
	@echo "  make build-aab-qa          - Build Android AAB (App Bundle) in QA environment"
	@echo "  make build-aab-prod        - Build Android AAB (App Bundle) in PRODUCTION environment"
	@echo "  make build-ipa-dev         - Build iOS IPA in DEVELOPMENT environment"
	@echo "  make build-ipa-qa          - Build iOS IPA in QA environment"
	@echo "  make build-ipa-prod        - Build iOS IPA in PRODUCTION environment"
	@echo ""
	@echo "Combined DEV Builds:"
	@echo "  make build-ddln-apk-dev    - Configure DDLN and build development APK"
	@echo "  make build-21klg-apk-dev   - Configure 21kLG and build development APK"
	@echo ""
	@echo "Combined Production Builds:"
	@echo "  make build-ddln-apk-prod   - Configure DDLN and build production APK"
	@echo "  make build-ddln-aab-prod   - Configure DDLN and build production AAB"
	@echo "  make build-ddln-ipa-prod   - Configure DDLN and build production IPA"
	@echo "  make build-21klg-apk-prod  - Configure 21kLG and build production APK"
	@echo "  make build-21klg-aab-prod  - Configure 21kLG and build production AAB"
	@echo "  make build-21klg-ipa-prod  - Configure 21kLG and build production IPA"
	@echo ""
	@echo "Helpers:"
	@echo "  make clean                 - Clean the project build files"
	@echo "  make get                   - Get flutter dependencies"

config-ddln:
	python3 scripts/configure_tenant.py --tenant ddln

config-21klg:
	python3 scripts/configure_tenant.py --tenant 21klg

run-dev:
	flutter run -t lib/main_development.dart

run-qa:
	flutter run -t lib/main_qa.dart

run-prod:
	flutter run -t lib/main_production.dart

build-apk-dev:
	flutter build apk -t lib/main_development.dart

build-apk-qa:
	flutter build apk -t lib/main_qa.dart

build-apk-prod:
	flutter build apk -t lib/main_production.dart

build-aab-dev:
	flutter build appbundle -t lib/main_development.dart

build-aab-qa:
	flutter build appbundle -t lib/main_qa.dart

build-aab-prod:
	flutter build appbundle -t lib/main_production.dart

build-ipa-dev:
	flutter build ipa -t lib/main_development.dart

build-ipa-qa:
	flutter build ipa -t lib/main_qa.dart

build-ipa-prod:
	flutter build ipa -t lib/main_production.dart

# DDLN Combined DEV Builds
build-ddln-apk-dev: config-ddln build-apk-dev

# DDLN Combined Production Builds
build-ddln-apk-prod: config-ddln build-apk-prod
build-ddln-aab-prod: config-ddln build-aab-prod
build-ddln-ipa-prod: config-ddln build-ipa-prod

# 21kLG Combined DEV Builds
build-21klg-apk-dev: config-21klg build-apk-dev

# 21kLG Combined Production Builds
build-21klg-apk-prod: config-21klg build-apk-prod
build-21klg-aab-prod: config-21klg build-aab-prod
build-21klg-ipa-prod: config-21klg build-ipa-prod

clean:
	flutter clean

get:
	flutter pub get

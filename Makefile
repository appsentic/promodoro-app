.PHONY: generate
generate:
	flutter pub run build_runner build --delete-conflicting-outputs

# Generate app icons for each platform
.PHONY: generate-icons
generate-icons:
	flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*


# generate flutter splash screens

.PHONY: generate-splash
generate-splash:
	flutter pub run flutter_native_splash:create --path=lib/bin/generators/flutter_native_splash.yaml



# generate app bunndle
.PHONY generate-app-bunndle
generate-app-bundle:
	flutter build appbundle --release --build-number=1 --build-name=1.0.0 --obfuscate --split-debug-info=${pwd}/dump 
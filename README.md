## Flutter Start Template — sandwich_app

This repository is a reusable Flutter application template intended as a starting point for new apps. It includes a recommended folder layout, common packages and wiring for dependency injection, networking, localization, flavors (development / production), and a set of useful UI widgets and helpers.

Use this template as a base for cloning new apps and accelerating project setup.

## Project Overview

- Purpose: provide a production-ready starting point that teams can clone and customize to ship new Flutter apps quickly.
- Flavors: includes two entry points: `lib/main_development.dart` and `lib/main_production.dart` (dev/pro flavors are wired via the `.vscode/launch.json` and typical Flutter `--flavor` usage).
- Architecture: feature-based layout with a shared `core/` area for DI, networking, styles, routing and reusable widgets. The codebase uses `flutter_bloc` (Cubit style) + repository/service layers and `get_it` for DI.

## Quick index (what's in this repo)

Top-level files and directories you'll commonly use:

```
/
├─ android/                 # Android project
├─ ios/                     # iOS project
├─ macos/                   # macOS project
├─ linux/                   # Linux project
├─ windows/                 # Windows project
├─ web/                     # Web assets
├─ lib/                     # Application source
│  ├─ main_development.dart
│  ├─ main_production.dart
│  ├─ core/                 # DI, network, widgets, styles, routing, helpers
│  │  ├─ di/
│  │  ├─ network/
│  │  ├─ widgets/
│  │  ├─ styles/
│  │  └─ routing/
│  ├─ features/             # Feature modules (login, register, onboarding, etc.)
│  └─ generated/            # Generated localization and other generated sources
├─ assets/
│  ├─ fonts/
│  └─ images/
├─ test/                    # Widget/unit tests
├─ pubspec.yaml
├─ pubspec.lock
├─ README.md
├─ analysis_options.yaml
├─ flutter_native_splash.yaml
└─ flutter_launcher_icons.yaml
```

Key files to know:
- `lib/main_development.dart` and `lib/main_production.dart` — flavor entry points.
- `lib/core/di/` — dependency injection setup (uses `get_it`).
- `lib/core/network/` — `dio` factory, API service wrappers and error handling.
- `lib/core/widgets/` — shared widgets (buttons, headers, toast helpers using `fluttertoast`).
- `lib/features/` — feature-first structure containing UI, logic (Cubits), models, and repos.

## Packages & Dependencies (from `pubspec.yaml`)

The project includes the following packages. Short purpose explanation for each:

| Package | Version (declared) | Purpose |
|---|---:|---|
| `conditional_builder_null_safety` | ^0.0.6 | Small utility for conditional widget building.
| `cupertino_icons` | ^1.0.8 | iOS-style icons used by Flutter.
| `dartz` | ^0.10.1 | Functional programming helpers (Either, Option) if used in business logic.
| `dio` | ^5.8.0+1 | HTTP client used for networking; configured via `lib/core/network`.
| `firebase_core` | ^3.14.0 | Firebase core package (initialization for Firebase features).
| `firebase_messaging` | ^15.2.7 | Push notifications handling.
| `flutter` | SDK | Flutter framework.
| `flutter_bloc` | ^9.1.1 | State management; project uses Cubit/BLoC patterns.
| `flutter_dotenv` | ^5.2.1 | Load environment variables from `.env` files.
| `flutter_localization` | ^0.3.3 | Helper for localization configuration.
| `flutter_localizations` | sdk: flutter | Flutter official localization support.
| `flutter_native_splash` | ^2.4.6 | Generates native splash screens for each platform.
| `flutter_screenutil` | ^5.9.3 | Responsive sizing helpers for multiple screen sizes.
| `flutter_secure_storage` | ^9.2.4 | Secure storage for tokens/credentials.
| `flutter_svg` | ^2.2.0 | Load and display SVG assets.
| `fluttertoast` | ^8.2.12 | Simple toast UI; used in `core/widgets/toast`.
| `get_it` | ^8.0.3 | Service locator / dependency injection container.
| `intl` | ^0.20.2 | Internationalization and number/date formatting.
| `intl_phone_number_input` | ^0.7.4 | Phone number input widget with parsing/validation.
| `intl_utils` | ^2.8.10 | i18n codegen helpers (for `.arb` -> Dart generation).
| `introduction_screen` | ^3.1.17 | Onboarding screens helper.
| `lottie` | ^3.3.1 | Lottie animations.
| `pin_code_fields` | ^8.0.1 | Pin/OTP input fields.
| `pretty_dio_logger` | ^1.4.0 | Helpful Dio request/response logging during development.
| `shared_preferences` | ^2.5.3 | Local key-value storage for non-sensitive data.
| `flutter_launcher_icons` | ^0.14.4 | Tool to generate launcher icons.

Dev dependencies:
- `flutter_lints` (^5.0.0) — recommended lint rules.
- `flutter_test` — unit & widget tests.

Note: some packages require platform setup (e.g., Firebase, notifications). See their package docs for details.

## Setup Instructions

1. Clone the repository:

```powershell
git clone <repo-url> my_app
cd my_app
```

2. Install dependencies:

```powershell
flutter pub get
```

3. (Optional) Create a fresh repo for your new app:

```powershell
rm -rf .git
git init
git add .
git commit -m "Initial commit from flutter_start_template"
```

4. Rename the app (package identifiers and app name):
- Update `pubspec.yaml` -> `name:` and `description`.
- Android package: update package name under `android/app/src/main/kotlin/.../MainActivity.kt` and `android/app/src/main/AndroidManifest.xml`. Also update `android/app/build.gradle.kts` if necessary.
- iOS bundle id: update `ios/Runner/Info.plist` and Xcode project settings.
- macOS bundle id: `macos/Runner/Configs/AppInfo.xcconfig`.

Tip: For an automated rename you can use search-and-replace tools (e.g. ripgrep + sed) but please verify Android/iOS project files manually.

5. Configure flavors and environment files:
- This template includes `.env_dev` and `.env_pro` in `assets/`. Copy and update them with API keys and flags.
- Launch dev flavor locally:

```powershell
flutter run --flavor dev -t lib/main_development.dart
```

Or build an APK (verbose, from project root):

```powershell
flutter build apk --flavor dev -t lib/main_development.dart -v
```

6. Platform-specific: set up Firebase, notification entitlements, Android SDK, and signing for release builds according to those services' docs.

## Development Notes

- State management: this project uses `flutter_bloc` (Cubit) with repositories and service layers under `lib/features/*/logic` and `lib/core/network`.
- Dependency injection: `lib/core/di/` wires `get_it` instances for repositories, services, and cubits.
- Networking: `dio` + `pretty_dio_logger` via `lib/core/network/dio_factory.dart`.
- Naming conventions:
	- Feature folders should be named `snake_case` (e.g., `login_screen`).
	- Cubit/state files follow `feature_logic_*` (see existing examples under `lib/features/*/logic`).
	- Widgets that are reusable live under `lib/core/widgets`.
 - Code style & linting: `flutter_lints` is configured; run `dart analyze` and `flutter test` regularly.
 - Localization: ARB files live under `lib/l10n` and generated code under `lib/generated` using `intl_utils`.

Edge cases & checks
- Empty or missing `.env` keys — guard network calls and show clear logging.
- Long-running network calls — use timeouts, handle Dio exceptions in `lib/core/network/error`.
- Token refresh — `refresh_token_model.dart` and repo wiring exist; ensure refresh flows are tested.

## Usage Example — Starting a new project from this template

1. Clone and prepare a new repo (example):

```powershell
git clone https://github.com/IbrahimIG1/flutter_start_template.git my_new_app
cd my_new_app
rm -rf .git
git init
flutter pub get
```

2. Replace the app name and package id (manual steps described above).

3. Run the dev flavor locally:

```powershell
flutter run --flavor dev -t lib/main_development.dart
```

## Author & License

- Author: IbrahimIG1
- Recommended license: MIT — if you want to publish this template, add a `LICENSE` file with the MIT text and a header in source files.

If you want, I can add a `LICENSE` file (MIT) and open a small PR for it.

---

If you want this README to include more specifics (detailed rename scripts, CI/CD examples, or a CONTRIBUTING.md), tell me which sections to expand and I will update the file.

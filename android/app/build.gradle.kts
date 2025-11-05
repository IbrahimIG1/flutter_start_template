plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.penta.b2p_sandwich_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.penta.b2p_sandwich_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    
    flavorDimensions.add("default") // Correct syntax for flavorDimensions in Kotlin DSL

    productFlavors {
        create("dev") { // Use `create` for defining flavors in Kotlin DSL
            dimension = "default"
            applicationId = "com.penta.b2p_sandwich_app.dev"
            versionNameSuffix = ".dev"
            resValue("string", "app_name", "B2P Dev")
        }
        create("pro") {
            dimension = "default"
            applicationId = "com.penta.b2p_sandwich_app"
            resValue("string", "app_name", "B2P")
        }
    }

//    signingConfigs {
//     create("release") {
//         keyAlias = keystoreProperties["keyAlias"] as String
//         keyPassword = keystoreProperties["keyPassword"] as String
//         storeFile = file(keystoreProperties["storeFile"] as String)
//         storePassword = keystoreProperties["storePassword"] as String
//     }
//     getByName("debug") {
//         keyAlias = keystoreProperties["keyAlias"] as String
//         keyPassword = keystoreProperties["keyPassword"] as String
//         storeFile = file(keystoreProperties["storeFile"] as String)
//         storePassword = keystoreProperties["storePassword"] as String
//     }
buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
}

    
}



flutter {
    source = "../.."
}

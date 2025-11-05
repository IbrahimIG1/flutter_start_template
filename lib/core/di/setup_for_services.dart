import 'package:sandwich_app/core/di/di.dart';
import 'package:sandwich_app/core/local/secure_storage_helper.dart';
import 'package:sandwich_app/core/local/shared_prefrence.dart';
import 'package:sandwich_app/core/network/api_sevices/api_services.dart';
import 'package:sandwich_app/core/network/api_sevices/dio_factory.dart';
import 'package:sandwich_app/features/notifications_screen/logic/notification_factory.dart';

class SetupForServices {
  static Future<void> setupForServices() async {
    getIt.registerLazySingleton<DioFactory>(() => DioFactory());
    getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt()));

    // Initialize SharedPreferences first before injecting
    await SharedPreferencesHelper.init();
    // Register SharedPreferencesHelper with GetIt
    getIt.registerSingleton<SharedPreferencesHelper>(SharedPreferencesHelper());
    // Register SecureStorageHelper with GetIt
    getIt.registerSingleton<AppSecureStorageHelper>(AppSecureStorageHelper());
    // Notification
    getIt.registerLazySingleton<NotificationFactory>(
      () => NotificationFactory(),
    );
  }
}

import 'package:football_app/core/di/di.dart';
import 'package:football_app/features/forget_password_screen/logic/cubit/forget_passord_cubit.dart';
import 'package:football_app/features/layout_screen/logic/layout_cubit.dart';
import 'package:football_app/features/login_screen/logic/cubit/login_cubit.dart';
import 'package:football_app/features/register_screen/logic/cubit/register_cubit.dart';
import 'package:football_app/features/reset_password_screen/logic/cubit/reset_passord_cubit.dart';

class SetupForCubits {
  static void setUpForCubits() {
    //* Notification Factory
      // NotificationFactory().initialize(); 
    //* Layout
    getIt.registerFactory<LayoutCubit>(() => LayoutCubit());
    //* Login
    getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
    //* Register
    getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
    //* Forget Password
    getIt.registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt()),
    );
    //* Rest Password
    getIt.registerFactory<ResetPasswordCubit>(
      () => ResetPasswordCubit(getIt()),
    );
    //* Notification
    // getIt.registerFactory<NotificationCubit>(() => NotificationCubit(getIt(), getIt()));
  }
}

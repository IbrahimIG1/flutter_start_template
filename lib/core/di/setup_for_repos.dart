
import 'package:flutter_starter_template/core/di/di.dart';
import 'package:flutter_starter_template/features/forget_password_screen/logic/repo/forget_password_repo.dart';
import 'package:flutter_starter_template/features/login_screen/logic/repo/login_repo.dart';
import 'package:flutter_starter_template/features/register_screen/logic/repo/register_repo.dart';
import 'package:flutter_starter_template/features/reset_password_screen/logic/repo/reset_password_repo.dart';

class SetupForRepos {

  static void setupForRepos() {
    //* Login
    getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
    //* Register
    getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
    //* Forget Password
    getIt.registerLazySingleton<ForgetPasswordRepo>(() => ForgetPasswordRepo(getIt()));
    //* Reset Password
    getIt.registerLazySingleton<ResetPasswordRepo>(() => ResetPasswordRepo(getIt()));
    
  }
}

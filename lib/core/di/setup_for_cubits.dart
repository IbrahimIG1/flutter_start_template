
import 'package:flutter_starter_template/core/di/di.dart';
import 'package:flutter_starter_template/features/forget_password_screen/logic/cubit/forget_passord_cubit.dart';
import 'package:flutter_starter_template/features/login_screen/logic/cubit/login_cubit.dart';
import 'package:flutter_starter_template/features/register_screen/logic/cubit/register_cubit.dart';
import 'package:flutter_starter_template/features/reset_password_screen/logic/cubit/reset_passord_cubit.dart';

class SetupForCubits {
  static void setUpForCubits() {
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
   

    

   
   

  
  }
}

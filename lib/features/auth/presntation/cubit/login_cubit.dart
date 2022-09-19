import 'package:booking_app/features/auth/presntation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(LoginInitialState());

  static AppCubit get(context) => BlocProvider.of(context);





  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined: Icons.visibility_outlined  ;

    emit(ChangePasswordVisibilityState());
  }
}



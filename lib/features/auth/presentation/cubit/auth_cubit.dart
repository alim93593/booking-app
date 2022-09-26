import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/auth/domain/usecases/get_profile_info.dart';
import 'package:booking_app/features/auth/domain/usecases/login.dart';
import 'package:booking_app/features/auth/domain/usecases/register.dart';
import 'package:booking_app/features/auth/domain/usecases/update_profile.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.getProfileInfoUseCase,
    required this.updateProfileUseCase,
  }) : super(AuthInitialState());

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final GetProfileInfoUseCase getProfileInfoUseCase;

  static AuthCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_off_outlined;

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ChangePasswordVisibilityState());
  }

  User? userModel;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final failureOrData = await loginUseCase(email: email, password: password);
    failureOrData.fold((l) {
      emit(LoginErrorState(error: mapFailureToString(l)));
    }, (r) {
      userModel = r;
      emit(LoginSuccessState(userModel!.token.toString()));
    });
  }

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    emit(RegisterLoadingState());
    final failureOrData = await registerUseCase(
      name: name,
      email: email,
      password: password,
      passwordConfirm: passwordConfirm,
    );
    failureOrData.fold((l) {
      emit(RegisterErrorState(error: mapFailureToString(l)));
    }, (r) {
      userModel = r;
      emit(RegisterSuccessState());
    });
  }

  Future<void> getProfileInfo({required String token}) async {
    emit(GetProfileLoadingState());
    final failureOrData = await getProfileInfoUseCase(token: token);
    failureOrData.fold((l) {
      emit(GetProfileErrorState(error: mapFailureToString(l)));
    }, (r) {
      userModel = r;
      emit(GetProfileSuccessState());
    });
  }

  Future<void> updateProfileInfo(
      {required String token,
      required String name,
      required String email,
      required String image}) async {
    emit(UpdateProfileLoadingState());
    final failureOrData = await updateProfileUseCase(
      token: token,
      name: name,
      email: email,
      image: image,
    );
    failureOrData.fold((l) {
      emit(UpdateProfileErrorState(error: mapFailureToString(l)));
    }, (r) {
      userModel = r;
      emit(UpdateProfileSuccessState());
    });
  }
}

// ignore_for_file: unused_import, avoid_print, non_constant_identifier_names



import 'dart:io';

import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/utils/local/cache_helper.dart';
import 'package:booking_app/features/auth/data/models/ProfileModel.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/auth/domain/usecases/get_profile_info.dart';
import 'package:booking_app/features/auth/domain/usecases/login.dart';
import 'package:booking_app/features/auth/domain/usecases/register.dart';
import 'package:booking_app/features/auth/domain/usecases/update_profile.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app/features/auth/data/models/UserModel.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/getProfileEntity.dart';


class AuthCubit extends Cubit<AuthStates> {
  AuthCubit({
    required this.profileModelEntity,
    required this.userModelEntity,
    required this.loginUseCase,
    required this.registerUseCase,
    required this.getProfileInfoUseCase,
    required this.updateProfileUseCase,
  }) : super(AuthInitialState());

   LoginUseCase loginUseCase;
   RegisterUseCase registerUseCase;
   UpdateProfileUseCase updateProfileUseCase;
   GetProfileInfoUseCase getProfileInfoUseCase;

  static AuthCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_off_outlined;

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ChangePasswordVisibilityState());
  }

  UserModelEntity userModelEntity;
  ProfileModelEntity profileModelEntity;
  Future<void> userRegister({
    required String email,
    required String password,
    required String password_confirmation,
    required String name,}) async {
    emit(RegisterLoadingState());
    final failureOrData = await registerUseCase(email: email,password: password,name: name, password_confirmation: password_confirmation);
    failureOrData.fold((l) {
      emit(RegisterErrorState(error: mapFailureToString(l)));
    }, (r) {
      userModelEntity = r;
      emit(RegisterSuccessState(userModelEntity:userModelEntity));
    });
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    final failureOrData = await loginUseCase(email: email,password: password);
    failureOrData.fold((l) {
      emit(LoginErrorState(error: mapFailureToString(l)));
    }, (r) {
      userModelEntity = r;
      emit(LoginSuccessState(userModelEntity:  userModelEntity));
    });
  }

  Future<void> getProfileInfo({required String token}) async {
    emit(GetProfileLoadingState());
    final failureOrData = await getProfileInfoUseCase(token: CacheHelper.getData(key: 'toKen'));
    failureOrData.fold((l) {
      emit(GetProfileErrorState(error: mapFailureToString(l)));
    }, (r) {
      profileModelEntity = r;
      print(profileModelEntity.data);
      emit(GetProfileSuccessState(profileModelEntity: profileModelEntity));
    });
  }

  Future<void> updateProfileInfo(
      {required String token,  required String name,
        required String email,
        required String image,}) async {
    emit(UpdateProfileLoadingState());
    final failureOrData = await updateProfileUseCase(
      email: email,
      image: image,
      name:name ,
      token: token,);
    failureOrData.fold((l) {
      emit(UpdateProfileErrorState(error: mapFailureToString(l)));
    }, (r) {
      userModelEntity = r;
      print(userModelEntity.data);
      emit(UpdateProfileSuccessState());
    });
  }

  File? profileimage;
  var picker = ImagePicker();
  Future<void> getprofileimage()async{
    final pickedfile = await picker.getImage(source: ImageSource.gallery);
    if(pickedfile != null){
      profileimage = File(pickedfile.path);
      print(pickedfile.path);
      emit(SocialProfileImagePickedSuccessState());
    }else{
      print('No Image Selected....');
      emit(SocialProfileImagePickedErrorState());
    }
  }


}

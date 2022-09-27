// ignore_for_file: non_constant_identifier_names, avoid_print, unused_import, unnecessary_null_comparison, unnecessary_null_in_if_null_operators

import 'dart:io';

import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/auth/domain/usecases/get_profile_info.dart';
import 'package:booking_app/features/auth/domain/usecases/login.dart';
import 'package:booking_app/features/auth/domain/usecases/register.dart';
import 'package:booking_app/features/auth/domain/usecases/update_profile.dart';
import 'package:booking_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app/features/auth/data/models/UserModel.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/network/end_points.dart';
import '../../../../core/utils/dio_helper.dart';
import '../../data/models/user_model.dart';

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

  // User? userModel;
  UserModel? userModel;

  // Future<void> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   emit(LoginLoadingState());
  //   final failureOrData = await loginUseCase(email: email, password: password);
  //   failureOrData.fold((l) {
  //     emit(LoginErrorState(error: mapFailureToString(l)));
  //   }, (r) {
  //     userModel = r;
  //     emit(LoginSuccessState(userModel!.token.toString()));
  //   });
  // }

  // Future<void> registerUser({
  //   required String name,
  //   required String email,
  //   required String password,
  //   required String passwordConfirm,
  // }) async {
  //   emit(RegisterLoadingState());
  //   final failureOrData = await registerUseCase(
  //     name: name,
  //     email: email,
  //     password: password,
  //     passwordConfirm: passwordConfirm,
  //   );
  //   failureOrData.fold((l) {
  //     emit(RegisterErrorState(error: mapFailureToString(l)));
  //   }, (r) {
  //     userModel = r;
  //     emit(RegisterSuccessState());
  //   });
  // }
  void userRegister({
    required String email,
    required String password,
    required String password_confirmation,
    required String name,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation,
      },
    ).then((value) {
      if (kDebugMode) {
        print(value!.data);
      }
      userModel = UserModel.fromJson(value!.data);
      print(userModel);
      emit(RegisterSuccessState(userModel: userModel!));
    }).catchError((error) {
      emit(const RegisterErrorState(error: 'there is an error'));
    });
  }

  void login({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {'email': email, 'password': password},
    ).then((value) {
      if (kDebugMode) {
        print(value!.data);
      }
      userModel = UserModel.fromJson(value!.data);
      getUserData();
      emit(LoginSuccessState(userModel!.data!.apiToken!));
    }).catchError((error) {
      emit(const LoginErrorState(error: 'there is an error'));
    });
  }

  // Future<void> getProfileInfo({required String token}) async {
  //   emit(GetProfileLoadingState());
  //   final failureOrData = await getProfileInfoUseCase(token: token);
  //   failureOrData.fold((l) {
  //     emit(GetProfileErrorState(error: mapFailureToString(l)));
  //   }, (r) {
  //     userModel = r;
  //     print(r.name);
  //     emit(GetProfileSuccessState());
  //   });
  // }

  void getUserData(){
    emit(ShopLoadinGetUserDataState());
    DioHelper.getData(url: PROFILE_INFO,
        token: toKen
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(ShopSuccessGetUserDataState(value.data));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetUserDataState(error.toString()));
    });
  }

  var picker = ImagePicker();
  File? profileimage;
  Future<void> getcoverimage()async{
    final pickedfile = await picker.getImage(source: ImageSource.gallery);
    if(pickedfile != null){
      // emit(SocialCoverImagePickedLoadingState());
      profileimage =  File(pickedfile.path);
      print(profileimage!.path);
      emit(SocialCoverImagePickedSuccessState());
    }else{
      print('No Image Selected....');
      emit(SocialCoverImagePickedErrorState());
    }
  }
  // Future<void> updateProfileInfo({required String token,
  //   required String name,
  //   required String email,
  //   required String image}) async {
  //   emit(UpdateProfileLoadingState());
  //   final failureOrData = await updateProfileUseCase(
  //     token: token,
  //     name: name,
  //     email: email,
  //     image: image,
  //   );
  //   failureOrData.fold((l) {
  //     emit(UpdateProfileErrorState(error: mapFailureToString(l)));
  //   }, (r) {
  //     userModel = r;
  //     emit(UpdateProfileSuccessState());
  //   });
  // }

  void uploadprofileImage( {required String name, required String email, String? image}) {
    if (profileimage == null) {
      updateUserData(name: name, email: email, image: userModel?.data!.image);
    }else{
      var newImage = Uri
          .file(profileimage!.path)
          .pathSegments
          .last;
      updateUserData(name: name, email: email, image: newImage);
    }
      emit(ShopLoadinGetUserDataSuccessState());
    }
  void updateUserData({required String name, String? email, String? image}){
    emit(ShopLoadinUpdateUserDataState());
    DioHelper.postData(
        url: UPDATE_INFO,
        token: toKen,
        data: {
          'name':name,
          'image':image??userModel?.data!.image,
          'email':email
        }
    ).then((value) {
      userModel = UserModel.fromJson(value!.data);
      print(userModel);
      print(userModel!.data.toString());
      emit(ShopSuccessUpdateUserDataState(userModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUpdateUserDataState(error.toString()));
    });
  }

}
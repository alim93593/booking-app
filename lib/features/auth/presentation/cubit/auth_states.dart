// ignore_for_file: must_be_immutable, unused_import, prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

import '../../data/models/UserModel.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/user.dart';

abstract class AuthStates extends Equatable {
  const AuthStates();

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthStates {}

class ChangePasswordVisibilityState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final String tokeN;
  const LoginSuccessState(this.tokeN);
}

class LoginErrorState extends AuthStates {
   const LoginErrorState({required this.error});
  final String error;
   @override
   List<Object?> get props => [];
}


class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  const RegisterSuccessState({required this.userModel});
  final UserModel? userModel;
}

class RegisterErrorState extends AuthStates {
  const RegisterErrorState({required this.error});
  final String error;

  @override
  List<Object?> get props => [];
}
class UpdateProfileLoadingState extends AuthStates {}

class UpdateProfileSuccessState extends AuthStates {}

class UpdateProfileErrorState extends AuthStates {
  const UpdateProfileErrorState({required this.error});
  final String error;

  @override
  List<Object?> get props => [];
}

class ShopLoadinUpdateUserDataState extends AuthStates{}
class ShopSuccessUpdateUserDataState extends AuthStates{
  UserModel loginModel;
  ShopSuccessUpdateUserDataState(this.loginModel);
}

class GetProfileLoadingState extends AuthStates {}

class GetProfileSuccessState extends AuthStates {}

class SocialCoverImagePickedSuccessState extends AuthStates{}
class SocialCoverImagePickedLoadingState extends AuthStates{}
class SocialCoverImagePickedErrorState extends AuthStates{}
class ShopErrorUpdateUserDataState extends AuthStates{
  final String error;
  ShopErrorUpdateUserDataState(this.error);
}
class SocialUserUpdateErrorState extends AuthStates{}
class SocialUserLoadingUpdateState extends AuthStates{}
class GetProfileErrorState extends AuthStates {
  const GetProfileErrorState({required this.error});
  final String error;

  @override
  List<Object?> get props => [];
}

class ShopLoadinGetUserDataState extends AuthStates{}
class ShopSuccessGetUserDataState extends AuthStates{
  UserModel loginModel;
  ShopSuccessGetUserDataState(this.loginModel);
}
class ShopErrorGetUserDataState extends AuthStates{
  final String error;
  ShopErrorGetUserDataState(this.error);
}

class ShopLoadinGetUserDataSuccessState extends AuthStates{}
import 'package:equatable/equatable.dart';

import '../../domain/entities/getProfileEntity.dart';
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
 final UserModelEntity userModelEntity;

  const LoginSuccessState( {required this.userModelEntity});
}

class LoginErrorState extends AuthStates {
   const LoginErrorState({ this.userModelEntity,this.error});
   final UserModelEntity? userModelEntity;
  final String? error;
   @override
   List<Object?> get props => [];
}


class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  const RegisterSuccessState({required this.userModelEntity});
  final UserModelEntity userModelEntity;
}

class RegisterErrorState extends AuthStates {
  const RegisterErrorState({ this.userModelEntity,this.error});
  final UserModelEntity? userModelEntity;
  final String? error;

  @override
  List<Object?> get props => [];
}
class UpdateProfileLoadingState extends AuthStates {}

class UpdateProfileSuccessState extends AuthStates {

}

class UpdateProfileErrorState extends AuthStates {
  const UpdateProfileErrorState({required this.error});
  final String error;

  @override
  List<Object?> get props => [];
}

class GetProfileLoadingState extends AuthStates {}

class GetProfileSuccessState extends AuthStates {
 const GetProfileSuccessState({ required this.profileModelEntity});
  final ProfileModelEntity profileModelEntity;
}

class SocialProfileImagePickedSuccessState extends AuthStates{}
class SocialProfileImagePickedErrorState extends AuthStates{}

class GetProfileErrorState extends AuthStates {
  const GetProfileErrorState({required this.error});
  final String error;

  @override
  List<Object?> get props => [];
}
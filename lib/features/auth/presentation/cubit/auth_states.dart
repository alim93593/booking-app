import 'package:equatable/equatable.dart';

abstract class AuthStates extends Equatable {
  const AuthStates();

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthStates {}

class ChangePasswordVisibilityState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
   const LoginErrorState({required this.error});
  final String error;
   @override
   List<Object?> get props => [];
}


class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

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

class GetProfileLoadingState extends AuthStates {}

class GetProfileSuccessState extends AuthStates {}

class GetProfileErrorState extends AuthStates {
  const GetProfileErrorState({required this.error});
  final String error;

  @override
  List<Object?> get props => [];
}
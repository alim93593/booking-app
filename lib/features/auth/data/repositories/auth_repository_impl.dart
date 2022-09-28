// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:booking_app/core/errors/exceptions.dart';
import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/core/network/network_info.dart';
import 'package:booking_app/features/auth/data/datasources/local_datasource.dart';
import 'package:booking_app/features/auth/data/datasources/login_remote_data_source/login_remote_data_source.dart';
import 'package:booking_app/features/auth/data/datasources/register__remote_data_source/register_user_remote_data_source.dart';
import 'package:booking_app/features/auth/data/datasources/remote_datasource.dart';
import 'package:booking_app/features/auth/data/models/ProfileModel.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/get_profile_info__remote_data_source/get_profile_info_remote_data_source.dart';
import '../datasources/update_profile_info__remote_data_source/update_profile_info_remote_data_source.dart';
import '../models/UserModel.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.updateProfileInfoDataSource,
    required this.registerUserDataSource,
    required this.getProfileInfoDataSource,
    required this.loginDataSource,
    required this.localDatasource,
    required this.networkInfo,
  });
  final GetProfileInfoDataSource getProfileInfoDataSource;
  final LocalDatasource localDatasource;
  final NetworkInfo networkInfo;
  final LoginDataSource loginDataSource;
  final RegisterUserDataSource registerUserDataSource;
  final UpdateProfileInfoDataSource updateProfileInfoDataSource;


  // @override
  // Future<Either<Failure, Unit>> changePassword(
  //     {required String password,
  //     required String passwordConfirm,
  //     required String token,
  //     required String email}) async {
  //   if (await networkInfo.isConnected) {
  //     await remoteDatasource.changePassword(
  //         password: password,
  //         passwordConfirm: passwordConfirm,
  //         token: token,
  //         email: email,);
  //     return const Right(unit);
  //   } else {
  //     return Left(OfflineFailure());
  //   }
  // }

  @override
  Future<Either<Failure, ProfileModel>> getProfileInfo(
      {required String token}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData =
            await getProfileInfoDataSource.getProfileInfo(token: token);
        // await localDatasource.cacheUser(userModel: remoteData);
        return Right(remoteData);
      } on ApiException {
        return Left(ApiFailure());
      }
    } else {
      return Left(OfflineFailure());

      // try {
      //   final localData = await localDatasource.getCachedUser();
      //   return Right(localData);
      // } on EmptyCacheException {
      //   return Left(EmptyCacheFailure());
      // }
    }
  }

  @override
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      final user =
          await loginDataSource.login(email: email, password: password);
      // await localDatasource.cacheUser(userModel: user);
      return Right(user);
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserModelEntity>> registerUser(
      {required String email,
      required String password,
      required String name,
      required String password_confirmation}) async {
    if (await networkInfo.isConnected) {
      final user = await registerUserDataSource.registerUser(
          email: email,
          password: password,
          password_confirmation: password_confirmation,
          name: name);
      // await localDatasource.cacheUser(userModel: user);
      return Right(user);
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserModelEntity>> updateProfileInfo(
      {required String token,  required String name,
        required String email,
        required String image,}) async {
    if (await networkInfo.isConnected) {
      final user = await updateProfileInfoDataSource.updateProfileInfo(
          token: token);
      // await localDatasource.cacheUser(userModel: user);
      return Right(user);
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> changePassword({required String password, required String passwordConfirm, required String token, required String email}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  
}

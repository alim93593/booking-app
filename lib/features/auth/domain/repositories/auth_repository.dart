import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

import '../entities/getProfileEntity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModelEntity>> registerUser({
    required String email,
    required String password,
    required String name,
    required String password_confirmation,
  });

  Future<Either<Failure, UserModelEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, ProfileModelEntity>> getProfileInfo({required String token});

  Future<Either<Failure, UserModelEntity>> updateProfileInfo({
    required String token,
    required String name,
    required String email,
    required String image,



  });

  Future<Either<Failure, Unit>> changePassword({
    required String password,
    required String passwordConfirm,
    required String token,
    required String email,
  });
}

import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> registerUser({
    required String email,
    required String password,
    required String name,
    required String passwordConfirm,
  });

  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> getProfileInfo({required String token});

  Future<Either<Failure, User>> updateProfileInfo({
    required String email,
    required String token,
    required String name,
    required String image ,
  });

  Future<Either<Failure, Unit>> changePassword({
    required String password,
    required String passwordConfirm,
    required String token,
    required String email,
  });
}

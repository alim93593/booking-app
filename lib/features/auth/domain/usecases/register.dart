import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  const RegisterUseCase({required this.repository});

  final AuthRepository repository;

  Future<Either<Failure, UserModelEntity>> call({
    required String email,
    required String password,
    required String name,
    required String password_confirmation,
  }) async {
    return await repository.registerUser(
      email: email,
      password_confirmation: password_confirmation,
      password: password,
      name: name,
    );
  }
}

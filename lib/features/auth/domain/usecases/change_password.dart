import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  const ChangePasswordUseCase({required this.repository});

  final AuthRepository repository;

  Future<Either<Failure, Unit>> call({
    required String email,
    required String passwordConfirm,
    required String password,
    required String token,
  }) async {
    return await repository.changePassword(
      password: password,
      passwordConfirm: passwordConfirm,
      token: token,
      email: email,
    );
  }
}

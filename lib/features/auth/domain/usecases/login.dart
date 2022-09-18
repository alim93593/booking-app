import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
 const LoginUseCase({required this.repository});

  final AuthRepository repository;

  Future<Either<Failure, User>> call(
      {required String email, required String password}) async {
    return await repository.login(email: email, password: password);
  }
}

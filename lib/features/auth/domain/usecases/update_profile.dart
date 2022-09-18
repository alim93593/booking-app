import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUseCase {
  const UpdateProfileUseCase({required this.repository});

  final AuthRepository repository;

  Future<Either<Failure, User>> call({
    required String image,
    required String email,
    required String name,
    required String token,
  }) async {
    return await repository.updateProfileInfo(
      email: email,
      token: token,
      name: name,
      image: image,
    );
  }
}

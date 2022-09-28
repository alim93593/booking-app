import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUseCase {
  const UpdateProfileUseCase({required this.repository});

  final AuthRepository repository;

  Future<Either<Failure, UserModelEntity>> call({

    required String name,
    required String email,
    required String image,
    required String token,
  }) async {
    return await repository.updateProfileInfo(

      token: token, name: name, email: email, image: image,

    );
  }
}

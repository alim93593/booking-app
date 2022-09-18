import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetProfileInfoUseCase {
  const GetProfileInfoUseCase({required this.repository});

  final AuthRepository repository;

  Future<Either<Failure, User>> call({required String token}) async {
    return await repository.getProfileInfo(token: token);
  }
}

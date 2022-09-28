// ignore_for_file: unused_import

import 'package:booking_app/core/errors/failures.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/getProfileEntity.dart';

class GetProfileInfoUseCase {
  const GetProfileInfoUseCase({required this.repository});

  final AuthRepository repository;

  Future<Either<Failure, ProfileModelEntity>> call({required String token}) async {
    return await repository.getProfileInfo(token: token);
  }
}

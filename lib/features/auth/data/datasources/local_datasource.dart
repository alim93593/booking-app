import 'dart:convert';

import 'package:booking_app/core/errors/exceptions.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatasource {
  Future<UserModel> getCachedUser();

  Future<Unit> cacheUser({required UserModel userModel});
}

class LocalDatasourceImpl implements LocalDatasource {
  const LocalDatasourceImpl({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  @override
  Future<Unit> cacheUser({required UserModel userModel}) {
    sharedPreferences.setString(CACHED_USER, json.encode(userModel.toJson()));
    return Future.value(unit);
  }

  @override
  Future<UserModel> getCachedUser() {
    final jsonString = sharedPreferences.getString(CACHED_USER);
    if (jsonString != null) {
      Map<String, dynamic> decodedJsonData = json.decode(jsonString);
      UserModel model = UserModel.fromJson(decodedJsonData);
      return Future.value(model);
    } else {
      throw EmptyCacheException();
    }
  }
}

import 'dart:convert';

import 'package:booking_app/core/errors/exceptions.dart';
import 'package:booking_app/core/network/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../models/UserModel.dart';

abstract class RemoteDatasource {
  Future<UserModel> registerUser({
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
  });

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<UserModel> getProfileInfo({required String token});

  Future<UserModel> updateProfile({
    required String email,
    required String token,
    required String name,
    required String image,
  });

  Future<Unit> changePassword({
    required String password,
    required String passwordConfirm,
    required String token,
    required String email,
  });
}

class RemoteDatasourceImpl implements RemoteDatasource {
 const  RemoteDatasourceImpl({required this.client});

  final http.Client client;



  @override
  Future<UserModel> getProfileInfo({required String token}) async {
    final response = await client.get(
        Uri.parse(
          '$BASE_URL$VERSION$PROFILE_INFO',
        ),
        headers: {"token": token});
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      UserModel user = UserModel.fromJson(decodedJson['data']);
      return user;
    }
    throw ApiException();
  }

  @override
  Future<Unit> changePassword(
      {required String password,
      required String passwordConfirm,
      required String token,
      required String email}) async {
    final response = await client.post(
      Uri.parse('$BASE_URL$VERSION$PASSWORD_CHANGE'),
      body: {
        "password": password,
        "password_confirmation": passwordConfirm,
        "email": email,
      },
      headers: {
        "token": token,
      },
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    }
    throw ApiException();
  }

  @override
  Future<UserModel> updateProfile({
    required String email,
    required String token,
    required String name,
    required String image,
  }) async {
    final response = await client.post(
        Uri.parse(
          '$BASE_URL$VERSION$UPDATE_INFO',
        ),
        headers: {
          'token': token,
        },
        body: {
          "email": email,
          "name": name,
          "image": image,
        });
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      UserModel user = UserModel.fromJson(decodedJson['data']);
      return user;
    }
    throw ApiException();
  }

  @override
  Future<UserModel> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserModel> registerUser({required String email, required String password, required String passwordConfirm, required String name}) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}


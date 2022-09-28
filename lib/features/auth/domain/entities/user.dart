// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../data/models/UserModel.dart';

class User extends Equatable {
   User(
      { this.id,
       this.name,
       this.email,
       this.emailVerifiedAt,
       this.apiToken,
       this.image,
       this.createdAt,
       this.updatedAt,
       this.googleId,
       this.provider});

  num? id;
   String? name;
   String? email;
   dynamic emailVerifiedAt;
   String? apiToken;
   dynamic image;
   String? createdAt;
   String? updatedAt;
   dynamic googleId;
   dynamic provider;

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        image,
        emailVerifiedAt,
        apiToken,
        createdAt,
        updatedAt,
        googleId,
        provider
      ];
}
class UserModelEntity extends Equatable {
  UserModelEntity(
      {this.data,this.status});

  Status? status;
  UserData? data;

  @override
  List<Object?> get props => [

  ];
}

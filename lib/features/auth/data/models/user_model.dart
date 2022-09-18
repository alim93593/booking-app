import 'package:booking_app/core/utils/constants.dart';
import 'package:booking_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required int id,
    required String name,
    required String email,
    required String token,
    required String image,
  }) : super(
          id: id,
          name: name,
          email: email,
          image: image,
          token: token,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'] ?? defaultUserImage,
      token: json['api_token'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
    };
  }
}

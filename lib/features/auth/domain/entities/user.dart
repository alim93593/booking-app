import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    this.id,
    this.name,
    this.email,
    this.image,
    this.token
  });

  final int? id;
  final String? name;
  final String? email;
  final String? image;
  final String? token;

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [id, name, email, image,token];
}



// class UserModel extends User {
//   const UserModel({
//      num? id,
//      String? name,
//      String? email,
//      String? token,
//      String? image,
//   }) : super(
//           id: id,
//           name: name,
//           email: email,
//           image: image,
//           token: token,
//         );
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       image: json['image'] ?? defaultUserImage,
//       token: json['api_token'],
//     );
//   }
//   //
//   // @override
//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'id': id,
//   //     'name': name,
//   //     'email': email,
//   //     'image': image,
//   //   };
//   // }
// }

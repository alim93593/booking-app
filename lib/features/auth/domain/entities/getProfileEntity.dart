
import 'package:equatable/equatable.dart';

import '../../data/models/ProfileModel.dart';
import '../../data/models/UserModel.dart';

class ProfileModelEntity extends Equatable {
  ProfileModelEntity(
      { this.data,  this.status});

  StatusProfile? status;
  UserProfileData? data;

  @override
  List<Object?> get props => [

  ];
}

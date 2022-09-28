
// ignore_for_file: unused_import, must_be_immutable, file_names

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

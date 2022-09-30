// ignore_for_file: must_be_immutable, unused_import

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/CreateBookingModel.dart';
import '../../data/models/UpdateBookingStatus.dart';

class UpdateBookingEntity extends Equatable {

  UpdateStatus? status;



  Map<String, dynamic> toJson() => {};
  @override
  List<Object?> get props => [status];

  UpdateBookingEntity({
    this.status});
}

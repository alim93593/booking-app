// ignore_for_file: must_be_immutable, unused_import

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/CreateBookingModel.dart';

class CreateBookingEntity extends Equatable {

  BookingStatus? status;



  Map<String, dynamic> toJson() => {};
  @override
  List<Object?> get props => [status];

  CreateBookingEntity({
   this.status});
}

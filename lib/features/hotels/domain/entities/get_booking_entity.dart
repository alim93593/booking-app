// ignore_for_file: must_be_immutable, unused_import

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/CreateBookingModel.dart';
import '../../data/models/GetBookingModel.dart';

class GetBookingEntity extends Equatable {

  Status? status;
  Data? data;


  Map<String, dynamic> toJson() => {};
  @override
  List<Object?> get props => [status,data];

  GetBookingEntity({this.data,
    this.status});
}

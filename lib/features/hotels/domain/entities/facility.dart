// ignore_for_file: must_be_immutable, unused_import

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Facility extends Equatable {


  num? id;
  String? hotelId;
  String? facilityId;
  dynamic createdAt;
  dynamic updatedAt;


  Map<String, dynamic> toJson() => {};
  @override
  List<Object?> get props => [id, hotelId, facilityId,createdAt,updatedAt];

  Facility({
      this.id, this.hotelId, this.facilityId, this.createdAt, this.updatedAt});
}

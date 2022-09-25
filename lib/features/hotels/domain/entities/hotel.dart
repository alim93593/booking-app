import 'package:booking_app/features/hotels/domain/entities/facility.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/HotelsModel.dart';

class Hotel extends Equatable {
  num? id;
  String? name;
  String? description;
  String? price;
  String? address;
  String? longitude;
  String? latitude;
  String? rate;
  String? createdAt;
  String? updatedAt;
  List<HotelImages>? hotelImages;
  List<HotelFacilities>? hotelFacilities;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        address,
        latitude,
        longitude,
        rate,
        hotelImages,
        hotelFacilities,
      ];

  Hotel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.address,
      this.longitude,
      this.latitude,
      this.rate,
      this.createdAt,
      this.updatedAt,
      this.hotelImages,
      this.hotelFacilities});
}

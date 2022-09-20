import 'package:booking_app/features/hotels/data/models/facility_model.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';

class HotelModel extends Hotel {
  const HotelModel({
    required int id,
    required String name,
    required String description,
    required int price,
    required String address,
    required double latitude,
    required double longitude,
    required double rate,
    required List<String> images,
    required List<FacilityModel> facilities,
  }) : super(
          id: id,
          name: name,
          description: description,
          price: price,
          address: address,
          latitude: latitude,
          longitude: longitude,
          rate: rate,
          images: images,
          facilities: facilities,
        );

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    final List<FacilityModel> facilitiesList = [];
    final List<String> imagesList = [];
    for (var element in json['hotel_images']) {
      imagesList.add(element);
    }
    for (var element in json["hotel_facilities"]) {
      facilitiesList.add(FacilityModel.fromJson(element));
    }
    return HotelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      rate: json['rate'],
      images: imagesList,
      facilities: facilitiesList,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': id,
      'description': description,
      'price': price,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'rate': rate,
      'hotel_images': images!.asMap(),
      'hotel_facilities': facilities!.map((e) => e.toJson()).toList(),
    };
  }
}

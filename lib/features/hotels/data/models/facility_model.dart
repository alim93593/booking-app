import 'package:booking_app/features/hotels/domain/entities/facility.dart';

class FacilityModel extends Facility {
  const FacilityModel({
    required int id,
    required String name,
    required String image,
  }) : super(
          id: id,
          name: name,
          image: image,
        );

  factory FacilityModel.fromJson(Map<String, dynamic> json) {
    return FacilityModel(
        id: json['id'], name: json['name'], image: json['image']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}

import 'package:booking_app/features/hotels/domain/entities/facility.dart';
import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  const Hotel({
    this.id, this.name, this.description, this.price, this.address,
    this.latitude, this.longitude, this.rate, this.images, this.facilities
});

  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final String? address;
  final double? latitude;
  final double? longitude;
  final double? rate;
  final List<String>? images;
  final List<Facility>? facilities;

  Map<String, dynamic> toJson() => {};

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
        images,
        facilities,
      ];
}

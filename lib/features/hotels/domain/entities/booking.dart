import 'package:booking_app/features/auth/domain/entities/user.dart';
import 'package:booking_app/features/hotels/domain/entities/hotel.dart';
import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  const Booking({
    this.id,
    this.userId,
    this.hotelId,
    this.type,
    this.user,
    this.hotel,
  });

  final int? id;
  final int? userId;
  final int? hotelId;
  final String? type;
  final User? user;
  final Hotel? hotel;

  Map<String, dynamic> toJson() => {};

  @override
  List<Object?> get props => [
        id,
        userId,
        hotelId,
        type,
        user,
        hotel,
      ];
}

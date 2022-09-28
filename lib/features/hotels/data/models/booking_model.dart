
import '../../../auth/data/models/UserModel.dart';
import '../../domain/entities/booking.dart';
import 'HotelsModel.dart';

class BookingModel extends Booking {
  const BookingModel({
    required int id,
    required int userId,
    required int hotelId,
    required String type,
    required UserModel user,
    required HotelModel hotel,
  }) : super(
          id: id,
          userId: userId,
          hotelId: hotelId,
          type: type,
          // user: user,
          hotel: hotel,
        );

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      userId: json['user_id'],
      hotelId: json['hotel_id'],
      type: json['type'],
      user: UserModel.fromJson(json['user']),
      hotel: HotelModel.fromJson(
        json['hotel'],
      ),
    );
  }

  // @override
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'user_id': userId,
  //     'hotel_id': hotelId,
  //     'type': type,
  //     'user': user!.toJson(),
  //     'hotel': hotel!.toJson(),
  //   };
  // }
}

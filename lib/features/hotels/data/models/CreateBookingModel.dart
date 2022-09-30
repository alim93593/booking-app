import '../../domain/entities/create_booking_entity.dart';

/// status : {"type":"1","title":{"ar":"تم إنشاء الحجز بنجاح","en":"succefully create"},"booking_id":1147}

class CreateBookingModel extends CreateBookingEntity {
  CreateBookingModel({
    BookingStatus? status
  }):super(status:status);

  CreateBookingModel.fromJson(dynamic json) {
    status = json['status'] != null ? BookingStatus.fromJson(json['status']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (status != null) {
      map['status'] = status?.toJson();
    }
    return map;
  }

}

/// type : "1"
/// title : {"ar":"تم إنشاء الحجز بنجاح","en":"succefully create"}
/// booking_id : 1147

class BookingStatus {
  BookingStatus({
      this.type, 
      this.title, 
      this.bookingId,});

  BookingStatus.fromJson(dynamic json) {
    type = json['type'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    bookingId = json['booking_id'];
  }
  String? type;
  Title? title;
  num? bookingId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    if (title != null) {
      map['title'] = title?.toJson();
    }
    map['booking_id'] = bookingId;
    return map;
  }

}

/// ar : "تم إنشاء الحجز بنجاح"
/// en : "succefully create"

class Title {
  Title({
      this.ar, 
      this.en,});

  Title.fromJson(dynamic json) {
    ar = json['ar'];
    en = json['en'];
  }
  String? ar;
  String? en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ar'] = ar;
    map['en'] = en;
    return map;
  }

}
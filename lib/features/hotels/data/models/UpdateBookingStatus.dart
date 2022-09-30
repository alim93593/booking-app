import 'package:booking_app/features/hotels/domain/entities/update_booking_status.dart';

/// status : {"type":"1","title":{"ar":"تم تعديل نوع الحجز بنجاح","en":"succefully updated"}}

class UpdateBookingStatus extends UpdateBookingEntity{
  UpdateBookingStatus({
    UpdateStatus? status
    ,}):super(status:status);

  UpdateBookingStatus.fromJson(dynamic json) {
    status = json['status'] != null ? UpdateStatus.fromJson(json['status']) : null;
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
/// title : {"ar":"تم تعديل نوع الحجز بنجاح","en":"succefully updated"}

class UpdateStatus {
  UpdateStatus({
      this.type, 
      this.title,});

  UpdateStatus.fromJson(dynamic json) {
    type = json['type'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }
  String? type;
  Title? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    if (title != null) {
      map['title'] = title?.toJson();
    }
    return map;
  }

}

/// ar : "تم تعديل نوع الحجز بنجاح"
/// en : "succefully updated"

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
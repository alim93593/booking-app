// ignore_for_file: must_be_immutable, annotate_overrides, file_names

import 'package:booking_app/features/hotels/domain/entities/facility.dart';

import '../../domain/entities/hotel.dart';

/// status : {"type":"1"}
/// data : {"current_page":1,"data":[{"id":9,"name":"hotel2","description":"desc4","price":"200","address":"tanta","longitude":"100","latitude":"200","rate":"10.50","created_at":"2022-09-11T13:44:00.000000Z","updated_at":"2022-09-11T13:44:00.000000Z","hotel_images":[{"id":7,"hotel_id":"9","image":"35321662903840.jpg","created_at":null,"updated_at":null},{"id":8,"hotel_id":"9","image":"21831662903840.png","created_at":null,"updated_at":null}],"hotel_facilities":[{"id":7,"hotel_id":"9","facility_id":"1","created_at":null,"updated_at":null},{"id":8,"hotel_id":"9","facility_id":"2","created_at":null,"updated_at":null}]},{"id":10,"name":"hotel23","description":"desc4","price":"200","address":"rome","longitude":"100","latitude":"200","rate":"10.50","created_at":"2022-09-11T13:45:09.000000Z","updated_at":"2022-09-11T13:45:09.000000Z","hotel_images":[],"hotel_facilities":[{"id":9,"hotel_id":"10","facility_id":"1","created_at":null,"updated_at":null},{"id":10,"hotel_id":"10","facility_id":"2","created_at":null,"updated_at":null}]},{"id":11,"name":"Roma fgfgm","description":"description","price":"100","address":"rome","longitude":"100","latitude":"200","rate":"4.50","created_at":"2022-09-11T13:46:47.000000Z","updated_at":"2022-09-11T13:46:47.000000Z","hotel_images":[],"hotel_facilities":[]},{"id":12,"name":"Roma fgfgm gfn","description":"description","price":"200","address":"rome","longitude":"100","latitude":"200","rate":"4.50","created_at":"2022-09-11T13:47:24.000000Z","updated_at":"2022-09-11T13:47:24.000000Z","hotel_images":[],"hotel_facilities":[{"id":11,"hotel_id":"12","facility_id":"3","created_at":null,"updated_at":null},{"id":12,"hotel_id":"12","facility_id":"4","created_at":null,"updated_at":null}]},{"id":13,"name":"With images","description":"description","price":"200","address":"rome","longitude":"100","latitude":"200","rate":"4.50","created_at":"2022-09-11T13:58:30.000000Z","updated_at":"2022-09-11T13:58:30.000000Z","hotel_images":[{"id":9,"hotel_id":"13","image":"45911662904710.png","created_at":null,"updated_at":null},{"id":10,"hotel_id":"13","image":"81321662904710.png","created_at":null,"updated_at":null}],"hotel_facilities":[{"id":13,"hotel_id":"13","facility_id":"3","created_at":null,"updated_at":null},{"id":14,"hotel_id":"13","facility_id":"4","created_at":null,"updated_at":null}]},{"id":14,"name":"Nasr Cirt","description":"description","price":"400","address":"rome","longitude":"31.3590117","latitude":"30.0504042","rate":"4.50","created_at":"2022-09-13T06:00:22.000000Z","updated_at":"2022-09-13T06:00:22.000000Z","hotel_images":[{"id":11,"hotel_id":"14","image":"66121663048822.png","created_at":null,"updated_at":null},{"id":12,"hotel_id":"14","image":"53431663048822.png","created_at":null,"updated_at":null}],"hotel_facilities":[{"id":15,"hotel_id":"14","facility_id":"3","created_at":null,"updated_at":null},{"id":16,"hotel_id":"14","facility_id":"4","created_at":null,"updated_at":null}]},{"id":15,"name":"Nasr Ciry Price 5000","description":"description","price":"5000","address":"tanta","longitude":"31.3590117","latitude":"30.0504042","rate":"4.50","created_at":"2022-09-13T06:02:04.000000Z","updated_at":"2022-09-13T06:02:04.000000Z","hotel_images":[{"id":13,"hotel_id":"15","image":"39761663048924.png","created_at":null,"updated_at":null},{"id":14,"hotel_id":"15","image":"26751663048924.png","created_at":null,"updated_at":null}],"hotel_facilities":[{"id":17,"hotel_id":"15","facility_id":"3","created_at":null,"updated_at":null},{"id":18,"hotel_id":"15","facility_id":"4","created_at":null,"updated_at":null}]}],"first_page_url":"http://api.mahmoudtaha.com/api/hotels?page=1","from":1,"last_page":1,"last_page_url":"http://api.mahmoudtaha.com/api/hotels?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://api.mahmoudtaha.com/api/hotels?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"http://api.mahmoudtaha.com/api/hotels","per_page":"10","prev_page_url":null,"to":7,"total":7}

class HotelsModel {
  HotelsModel({
    this.status,
    this.data,
  });

  HotelsModel.fromJson(dynamic json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? PageData.fromJson(json['data']) : null;
  }
  Status? status;
  PageData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (status != null) {
      map['status'] = status?.toJson();
    }
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// current_page : 1
/// data : [{"id":9,"name":"hotel2","description":"desc4","price":"200","address":"tanta","longitude":"100","latitude":"200","rate":"10.50","created_at":"2022-09-11T13:44:00.000000Z","updated_at":"2022-09-11T13:44:00.000000Z","hotel_images":[{"id":7,"hotel_id":"9","image":"35321662903840.jpg","created_at":null,"updated_at":null},{"id":8,"hotel_id":"9","image":"21831662903840.png","created_at":null,"updated_at":null}],"hotel_facilities":[{"id":7,"hotel_id":"9","facility_id":"1","created_at":null,"updated_at":null},{"id":8,"hotel_id":"9","facility_id":"2","created_at":null,"updated_at":null}]},{"id":10,"name":"hotel23","description":"desc4","price":"200","address":"rome","longitude":"100","latitude":"200","rate":"10.50","created_at":"2022-09-11T13:45:09.000000Z","updated_at":"2022-09-11T13:45:09.000000Z","hotel_images":[],"hotel_facilities":[{"id":9,"hotel_id":"10","facility_id":"1","created_at":null,"updated_at":null},{"id":10,"hotel_id":"10","facility_id":"2","created_at":null,"updated_at":null}]},{"id":11,"name":"Roma fgfgm","description":"description","price":"100","address":"rome","longitude":"100","latitude":"200","rate":"4.50","created_at":"2022-09-11T13:46:47.000000Z","updated_at":"2022-09-11T13:46:47.000000Z","hotel_images":[],"hotel_facilities":[]},{"id":12,"name":"Roma fgfgm gfn","description":"description","price":"200","address":"rome","longitude":"100","latitude":"200","rate":"4.50","created_at":"2022-09-11T13:47:24.000000Z","updated_at":"2022-09-11T13:47:24.000000Z","hotel_images":[],"hotel_facilities":[{"id":11,"hotel_id":"12","facility_id":"3","created_at":null,"updated_at":null},{"id":12,"hotel_id":"12","facility_id":"4","created_at":null,"updated_at":null}]},{"id":13,"name":"With images","description":"description","price":"200","address":"rome","longitude":"100","latitude":"200","rate":"4.50","created_at":"2022-09-11T13:58:30.000000Z","updated_at":"2022-09-11T13:58:30.000000Z","hotel_images":[{"id":9,"hotel_id":"13","image":"45911662904710.png","created_at":null,"updated_at":null},{"id":10,"hotel_id":"13","image":"81321662904710.png","created_at":null,"updated_at":null}],"hotel_facilities":[{"id":13,"hotel_id":"13","facility_id":"3","created_at":null,"updated_at":null},{"id":14,"hotel_id":"13","facility_id":"4","created_at":null,"updated_at":null}]},{"id":14,"name":"Nasr Cirt","description":"description","price":"400","address":"rome","longitude":"31.3590117","latitude":"30.0504042","rate":"4.50","created_at":"2022-09-13T06:00:22.000000Z","updated_at":"2022-09-13T06:00:22.000000Z","hotel_images":[{"id":11,"hotel_id":"14","image":"66121663048822.png","created_at":null,"updated_at":null},{"id":12,"hotel_id":"14","image":"53431663048822.png","created_at":null,"updated_at":null}],"hotel_facilities":[{"id":15,"hotel_id":"14","facility_id":"3","created_at":null,"updated_at":null},{"id":16,"hotel_id":"14","facility_id":"4","created_at":null,"updated_at":null}]},{"id":15,"name":"Nasr Ciry Price 5000","description":"description","price":"5000","address":"tanta","longitude":"31.3590117","latitude":"30.0504042","rate":"4.50","created_at":"2022-09-13T06:02:04.000000Z","updated_at":"2022-09-13T06:02:04.000000Z","hotel_images":[{"id":13,"hotel_id":"15","image":"39761663048924.png","created_at":null,"updated_at":null},{"id":14,"hotel_id":"15","image":"26751663048924.png","created_at":null,"updated_at":null}],"hotel_facilities":[{"id":17,"hotel_id":"15","facility_id":"3","created_at":null,"updated_at":null},{"id":18,"hotel_id":"15","facility_id":"4","created_at":null,"updated_at":null}]}]
/// first_page_url : "http://api.mahmoudtaha.com/api/hotels?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "http://api.mahmoudtaha.com/api/hotels?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://api.mahmoudtaha.com/api/hotels?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "http://api.mahmoudtaha.com/api/hotels"
/// per_page : "10"
/// prev_page_url : null
/// to : 7
/// total : 7

class PageData {
  PageData({
    this.currentPage,
    this.hotels,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  PageData.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      hotels = [];
      json['data'].forEach((v) {
        hotels?.add(HotelModel.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
  num? currentPage;
  List<HotelModel>? hotels;
  String? firstPageUrl;
  num? from;
  num? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  String? perPage;
  dynamic prevPageUrl;
  num? to;
  num? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (hotels != null) {
      map['data'] = hotels?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['last_page'] = lastPage;
    map['last_page_url'] = lastPageUrl;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    map['total'] = total;
    return map;
  }
}

/// url : null
/// label : "&laquo; Previous"
/// active : false

class Links {
  Links({
    this.url,
    this.label,
    this.active,
  });

  Links.fromJson(dynamic json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
  dynamic url;
  String? label;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['active'] = active;
    return map;
  }
}

/// id : 9
/// name : "hotel2"
/// description : "desc4"
/// price : "200"
/// address : "tanta"
/// longitude : "100"
/// latitude : "200"
/// rate : "10.50"
/// created_at : "2022-09-11T13:44:00.000000Z"
/// updated_at : "2022-09-11T13:44:00.000000Z"
/// hotel_images : [{"id":7,"hotel_id":"9","image":"35321662903840.jpg","created_at":null,"updated_at":null},{"id":8,"hotel_id":"9","image":"21831662903840.png","created_at":null,"updated_at":null}]
/// hotel_facilities : [{"id":7,"hotel_id":"9","facility_id":"1","created_at":null,"updated_at":null},{"id":8,"hotel_id":"9","facility_id":"2","created_at":null,"updated_at":null}]

class HotelModel extends HotelEntity {
  HotelModel({
    num? id,
    String? name,
    String? description,
    String? price,
    String? address,
    String? longitude,
    String? latitude,
    String? rate,
    String? createdAt,
    String? updatedAt,
    List<dynamic>? hotelImages,
    List<HotelFacilities>? hotelFacilities,
  }) : super(
            id: id,
            name: name,
            description: description,
            price: price,
            address: address,
            hotelFacilities: hotelFacilities,
            hotelImages: hotelImages,
            latitude: latitude,
            longitude: longitude,
            rate: rate);

  HotelModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hotelImages = List<String>.from(json['hotel_images'].map((x) => x['image']));
    if (json['hotel_facilities'] != null) {
      hotelFacilities = [];
      json['hotel_facilities'].forEach((v) {
        hotelFacilities?.add(HotelFacilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['address'] = address;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    map['rate'] = rate;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['hotel_images'] = hotelImages;
    if (hotelFacilities != null) {
      map['hotel_facilities'] =
          hotelFacilities?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 7
/// hotel_id : "9"
/// facility_id : "1"
/// created_at : null
/// updated_at : null

class HotelFacilities extends Facility {
  HotelFacilities({
    num? id,
    String? hotelId,
    String? facilityId,
    dynamic createdAt,
    dynamic updatedAt,
  }) : super(
            id: id,
            hotelId: hotelId,
            facilityId: facilityId,
            createdAt: createdAt,
            updatedAt: updatedAt);

  HotelFacilities.fromJson(dynamic json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    facilityId = json['facility_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['hotel_id'] = hotelId;
    map['facility_id'] = facilityId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// id : 7
/// hotel_id : "9"
/// image : "35321662903840.jpg"
/// created_at : null
/// updated_at : null

class HotelImages {
  HotelImages({
    this.id,
    this.hotelId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  HotelImages.fromJson(dynamic json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? hotelId;
  String? image;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['hotel_id'] = hotelId;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// type : "1"

class Status {
  Status({
    this.type,
  });

  Status.fromJson(dynamic json) {
    type = json['type'];
  }
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    return map;
  }
}

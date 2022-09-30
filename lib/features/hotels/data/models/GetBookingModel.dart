import 'package:booking_app/features/hotels/domain/entities/booking.dart';
import 'package:booking_app/features/hotels/domain/entities/get_booking_entity.dart';

/// status : {"type":"1"}
/// data : {"current_page":1,"data":[{"id":1199,"user_id":"321","hotel_id":"18","type":"upcomming","created_at":"2022-09-29T22:34:15.000000Z","updated_at":"2022-09-29T22:34:15.000000Z","user":{"id":321,"name":"samydsf","email":"sa@gmail.com","email_verified_at":null,"api_token":"DbEKpvqg2uKSMVONmzLyAEZyInLsWdVIZcVTsjP2ivgfNzqgJ9MRCDt95KaB","image":null,"created_at":"2022-09-26T22:29:55.000000Z","updated_at":"2022-09-26T22:29:55.000000Z","google_id":null,"provider":null},"hotel":{"id":18,"name":"Palm Inn Hotel","description":"Palm Inn Hotel features a restaurant, outdoor swimming pool, a shared lounge and garden in Hurghada. Featuring family rooms, this property also provides guests with a terrace. The accommodation provides a 24-hour front desk, room service and currency exchange for guests.\n\nGuest rooms at the hotel are equipped with a seating area. Rooms are complete with a private bathroom equipped with a bath, all units at Palm Inn Hotel have a flat-screen TV and air conditioning, and selected rooms have a balcony. At the accommodation every room is equipped with bed linen and towels.\n\nA continental breakfast is available daily at Palm Inn Hotel.\n\nGuests at the hotel will be able to enjoy activities in and around Hurghada, like cycling.\n\nPopular points of interest near Palm Inn Hotel include Elysees Dream Beach, Qesm Hurghada Public Beach and El Sawaki Beach. The nearest airport is Hurghada International Airport, 13 km from the accommodation.\n\nCouples particularly like the location — they rated it 8.0 for a two-person trip.","price":"38","address":"El Dahar, Abdel-Moneim Riad Square, 84511 Hurghada, Egypt","longitude":"33.812999","latitude":"27.259102","rate":"8.00","created_at":"2022-09-28T10:53:41.000000Z","updated_at":"2022-09-28T10:53:41.000000Z","hotel_images":[{"id":16,"hotel_id":"18","image":"33391664362421.jpeg","created_at":null,"updated_at":null},{"id":17,"hotel_id":"18","image":"87741664362421.jpeg","created_at":null,"updated_at":null},{"id":18,"hotel_id":"18","image":"24311664362421.jpeg","created_at":null,"updated_at":null},{"id":19,"hotel_id":"18","image":"13321664362421.jpeg","created_at":null,"updated_at":null},{"id":20,"hotel_id":"18","image":"68051664362421.jpeg","created_at":null,"updated_at":null}],"facilities":[{"id":5,"name":"A/C","image":"8801664361358.png","created_at":"2022-09-28T10:35:58.000000Z","updated_at":"2022-09-28T10:35:58.000000Z"},{"id":6,"name":"Wifi","image":"74901664361371.png","created_at":"2022-09-28T10:36:11.000000Z","updated_at":"2022-09-28T10:36:11.000000Z"},{"id":7,"name":"Garden","image":"75771664361381.png","created_at":"2022-09-28T10:36:21.000000Z","updated_at":"2022-09-28T10:36:21.000000Z"}]}},{"id":1200,"user_id":"321","hotel_id":"18","type":"upcomming","created_at":"2022-09-29T22:35:47.000000Z","updated_at":"2022-09-29T22:35:47.000000Z","user":{"id":321,"name":"samydsf","email":"sa@gmail.com","email_verified_at":null,"api_token":"DbEKpvqg2uKSMVONmzLyAEZyInLsWdVIZcVTsjP2ivgfNzqgJ9MRCDt95KaB","image":null,"created_at":"2022-09-26T22:29:55.000000Z","updated_at":"2022-09-26T22:29:55.000000Z","google_id":null,"provider":null},"hotel":{"id":18,"name":"Palm Inn Hotel","description":"Palm Inn Hotel features a restaurant, outdoor swimming pool, a shared lounge and garden in Hurghada. Featuring family rooms, this property also provides guests with a terrace. The accommodation provides a 24-hour front desk, room service and currency exchange for guests.\n\nGuest rooms at the hotel are equipped with a seating area. Rooms are complete with a private bathroom equipped with a bath, all units at Palm Inn Hotel have a flat-screen TV and air conditioning, and selected rooms have a balcony. At the accommodation every room is equipped with bed linen and towels.\n\nA continental breakfast is available daily at Palm Inn Hotel.\n\nGuests at the hotel will be able to enjoy activities in and around Hurghada, like cycling.\n\nPopular points of interest near Palm Inn Hotel include Elysees Dream Beach, Qesm Hurghada Public Beach and El Sawaki Beach. The nearest airport is Hurghada International Airport, 13 km from the accommodation.\n\nCouples particularly like the location — they rated it 8.0 for a two-person trip.","price":"38","address":"El Dahar, Abdel-Moneim Riad Square, 84511 Hurghada, Egypt","longitude":"33.812999","latitude":"27.259102","rate":"8.00","created_at":"2022-09-28T10:53:41.000000Z","updated_at":"2022-09-28T10:53:41.000000Z","hotel_images":[{"id":16,"hotel_id":"18","image":"33391664362421.jpeg","created_at":null,"updated_at":null},{"id":17,"hotel_id":"18","image":"87741664362421.jpeg","created_at":null,"updated_at":null},{"id":18,"hotel_id":"18","image":"24311664362421.jpeg","created_at":null,"updated_at":null},{"id":19,"hotel_id":"18","image":"13321664362421.jpeg","created_at":null,"updated_at":null},{"id":20,"hotel_id":"18","image":"68051664362421.jpeg","created_at":null,"updated_at":null}],"facilities":[{"id":5,"name":"A/C","image":"8801664361358.png","created_at":"2022-09-28T10:35:58.000000Z","updated_at":"2022-09-28T10:35:58.000000Z"},{"id":6,"name":"Wifi","image":"74901664361371.png","created_at":"2022-09-28T10:36:11.000000Z","updated_at":"2022-09-28T10:36:11.000000Z"},{"id":7,"name":"Garden","image":"75771664361381.png","created_at":"2022-09-28T10:36:21.000000Z","updated_at":"2022-09-28T10:36:21.000000Z"}]}}],"first_page_url":"http://api.mahmoudtaha.com/api/get-bookings?page=1","from":1,"last_page":1,"last_page_url":"http://api.mahmoudtaha.com/api/get-bookings?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://api.mahmoudtaha.com/api/get-bookings?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"http://api.mahmoudtaha.com/api/get-bookings","per_page":"10","prev_page_url":null,"to":2,"total":2}

class GetBookingModel extends GetBookingEntity{
  GetBookingModel({
    Status? status,
    Data? data}):super(data:data,status:status);

  GetBookingModel.fromJson(dynamic json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


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
/// data : [{"id":1199,"user_id":"321","hotel_id":"18","type":"upcomming","created_at":"2022-09-29T22:34:15.000000Z","updated_at":"2022-09-29T22:34:15.000000Z","user":{"id":321,"name":"samydsf","email":"sa@gmail.com","email_verified_at":null,"api_token":"DbEKpvqg2uKSMVONmzLyAEZyInLsWdVIZcVTsjP2ivgfNzqgJ9MRCDt95KaB","image":null,"created_at":"2022-09-26T22:29:55.000000Z","updated_at":"2022-09-26T22:29:55.000000Z","google_id":null,"provider":null},"hotel":{"id":18,"name":"Palm Inn Hotel","description":"Palm Inn Hotel features a restaurant, outdoor swimming pool, a shared lounge and garden in Hurghada. Featuring family rooms, this property also provides guests with a terrace. The accommodation provides a 24-hour front desk, room service and currency exchange for guests.\n\nGuest rooms at the hotel are equipped with a seating area. Rooms are complete with a private bathroom equipped with a bath, all units at Palm Inn Hotel have a flat-screen TV and air conditioning, and selected rooms have a balcony. At the accommodation every room is equipped with bed linen and towels.\n\nA continental breakfast is available daily at Palm Inn Hotel.\n\nGuests at the hotel will be able to enjoy activities in and around Hurghada, like cycling.\n\nPopular points of interest near Palm Inn Hotel include Elysees Dream Beach, Qesm Hurghada Public Beach and El Sawaki Beach. The nearest airport is Hurghada International Airport, 13 km from the accommodation.\n\nCouples particularly like the location — they rated it 8.0 for a two-person trip.","price":"38","address":"El Dahar, Abdel-Moneim Riad Square, 84511 Hurghada, Egypt","longitude":"33.812999","latitude":"27.259102","rate":"8.00","created_at":"2022-09-28T10:53:41.000000Z","updated_at":"2022-09-28T10:53:41.000000Z","hotel_images":[{"id":16,"hotel_id":"18","image":"33391664362421.jpeg","created_at":null,"updated_at":null},{"id":17,"hotel_id":"18","image":"87741664362421.jpeg","created_at":null,"updated_at":null},{"id":18,"hotel_id":"18","image":"24311664362421.jpeg","created_at":null,"updated_at":null},{"id":19,"hotel_id":"18","image":"13321664362421.jpeg","created_at":null,"updated_at":null},{"id":20,"hotel_id":"18","image":"68051664362421.jpeg","created_at":null,"updated_at":null}],"facilities":[{"id":5,"name":"A/C","image":"8801664361358.png","created_at":"2022-09-28T10:35:58.000000Z","updated_at":"2022-09-28T10:35:58.000000Z"},{"id":6,"name":"Wifi","image":"74901664361371.png","created_at":"2022-09-28T10:36:11.000000Z","updated_at":"2022-09-28T10:36:11.000000Z"},{"id":7,"name":"Garden","image":"75771664361381.png","created_at":"2022-09-28T10:36:21.000000Z","updated_at":"2022-09-28T10:36:21.000000Z"}]}},{"id":1200,"user_id":"321","hotel_id":"18","type":"upcomming","created_at":"2022-09-29T22:35:47.000000Z","updated_at":"2022-09-29T22:35:47.000000Z","user":{"id":321,"name":"samydsf","email":"sa@gmail.com","email_verified_at":null,"api_token":"DbEKpvqg2uKSMVONmzLyAEZyInLsWdVIZcVTsjP2ivgfNzqgJ9MRCDt95KaB","image":null,"created_at":"2022-09-26T22:29:55.000000Z","updated_at":"2022-09-26T22:29:55.000000Z","google_id":null,"provider":null},"hotel":{"id":18,"name":"Palm Inn Hotel","description":"Palm Inn Hotel features a restaurant, outdoor swimming pool, a shared lounge and garden in Hurghada. Featuring family rooms, this property also provides guests with a terrace. The accommodation provides a 24-hour front desk, room service and currency exchange for guests.\n\nGuest rooms at the hotel are equipped with a seating area. Rooms are complete with a private bathroom equipped with a bath, all units at Palm Inn Hotel have a flat-screen TV and air conditioning, and selected rooms have a balcony. At the accommodation every room is equipped with bed linen and towels.\n\nA continental breakfast is available daily at Palm Inn Hotel.\n\nGuests at the hotel will be able to enjoy activities in and around Hurghada, like cycling.\n\nPopular points of interest near Palm Inn Hotel include Elysees Dream Beach, Qesm Hurghada Public Beach and El Sawaki Beach. The nearest airport is Hurghada International Airport, 13 km from the accommodation.\n\nCouples particularly like the location — they rated it 8.0 for a two-person trip.","price":"38","address":"El Dahar, Abdel-Moneim Riad Square, 84511 Hurghada, Egypt","longitude":"33.812999","latitude":"27.259102","rate":"8.00","created_at":"2022-09-28T10:53:41.000000Z","updated_at":"2022-09-28T10:53:41.000000Z","hotel_images":[{"id":16,"hotel_id":"18","image":"33391664362421.jpeg","created_at":null,"updated_at":null},{"id":17,"hotel_id":"18","image":"87741664362421.jpeg","created_at":null,"updated_at":null},{"id":18,"hotel_id":"18","image":"24311664362421.jpeg","created_at":null,"updated_at":null},{"id":19,"hotel_id":"18","image":"13321664362421.jpeg","created_at":null,"updated_at":null},{"id":20,"hotel_id":"18","image":"68051664362421.jpeg","created_at":null,"updated_at":null}],"facilities":[{"id":5,"name":"A/C","image":"8801664361358.png","created_at":"2022-09-28T10:35:58.000000Z","updated_at":"2022-09-28T10:35:58.000000Z"},{"id":6,"name":"Wifi","image":"74901664361371.png","created_at":"2022-09-28T10:36:11.000000Z","updated_at":"2022-09-28T10:36:11.000000Z"},{"id":7,"name":"Garden","image":"75771664361381.png","created_at":"2022-09-28T10:36:21.000000Z","updated_at":"2022-09-28T10:36:21.000000Z"}]}}]
/// first_page_url : "http://api.mahmoudtaha.com/api/get-bookings?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "http://api.mahmoudtaha.com/api/get-bookings?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://api.mahmoudtaha.com/api/get-bookings?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "http://api.mahmoudtaha.com/api/get-bookings"
/// per_page : "10"
/// prev_page_url : null
/// to : 2
/// total : 2

class Data {
  Data({
      this.currentPage, 
      this.data, 
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
      this.total,});

  Data.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BookingData.fromJson(v));
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
  List<BookingData>? data;
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
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
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
      this.active,});

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

/// id : 1199
/// user_id : "321"
/// hotel_id : "18"
/// type : "upcomming"
/// created_at : "2022-09-29T22:34:15.000000Z"
/// updated_at : "2022-09-29T22:34:15.000000Z"
/// user : {"id":321,"name":"samydsf","email":"sa@gmail.com","email_verified_at":null,"api_token":"DbEKpvqg2uKSMVONmzLyAEZyInLsWdVIZcVTsjP2ivgfNzqgJ9MRCDt95KaB","image":null,"created_at":"2022-09-26T22:29:55.000000Z","updated_at":"2022-09-26T22:29:55.000000Z","google_id":null,"provider":null}
/// hotel : {"id":18,"name":"Palm Inn Hotel","description":"Palm Inn Hotel features a restaurant, outdoor swimming pool, a shared lounge and garden in Hurghada. Featuring family rooms, this property also provides guests with a terrace. The accommodation provides a 24-hour front desk, room service and currency exchange for guests.\n\nGuest rooms at the hotel are equipped with a seating area. Rooms are complete with a private bathroom equipped with a bath, all units at Palm Inn Hotel have a flat-screen TV and air conditioning, and selected rooms have a balcony. At the accommodation every room is equipped with bed linen and towels.\n\nA continental breakfast is available daily at Palm Inn Hotel.\n\nGuests at the hotel will be able to enjoy activities in and around Hurghada, like cycling.\n\nPopular points of interest near Palm Inn Hotel include Elysees Dream Beach, Qesm Hurghada Public Beach and El Sawaki Beach. The nearest airport is Hurghada International Airport, 13 km from the accommodation.\n\nCouples particularly like the location — they rated it 8.0 for a two-person trip.","price":"38","address":"El Dahar, Abdel-Moneim Riad Square, 84511 Hurghada, Egypt","longitude":"33.812999","latitude":"27.259102","rate":"8.00","created_at":"2022-09-28T10:53:41.000000Z","updated_at":"2022-09-28T10:53:41.000000Z","hotel_images":[{"id":16,"hotel_id":"18","image":"33391664362421.jpeg","created_at":null,"updated_at":null},{"id":17,"hotel_id":"18","image":"87741664362421.jpeg","created_at":null,"updated_at":null},{"id":18,"hotel_id":"18","image":"24311664362421.jpeg","created_at":null,"updated_at":null},{"id":19,"hotel_id":"18","image":"13321664362421.jpeg","created_at":null,"updated_at":null},{"id":20,"hotel_id":"18","image":"68051664362421.jpeg","created_at":null,"updated_at":null}],"facilities":[{"id":5,"name":"A/C","image":"8801664361358.png","created_at":"2022-09-28T10:35:58.000000Z","updated_at":"2022-09-28T10:35:58.000000Z"},{"id":6,"name":"Wifi","image":"74901664361371.png","created_at":"2022-09-28T10:36:11.000000Z","updated_at":"2022-09-28T10:36:11.000000Z"},{"id":7,"name":"Garden","image":"75771664361381.png","created_at":"2022-09-28T10:36:21.000000Z","updated_at":"2022-09-28T10:36:21.000000Z"}]}

class BookingData {
  BookingData({
      this.id, 
      this.userId, 
      this.hotelId, 
      this.type, 
      this.createdAt, 
      this.updatedAt, 
      this.user, 
      this.hotel,});

  BookingData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
  }
  num? id;
  String? userId;
  String? hotelId;
  String? type;
  String? createdAt;
  String? updatedAt;
  User? user;
  Hotel? hotel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['hotel_id'] = hotelId;
    map['type'] = type;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (hotel != null) {
      map['hotel'] = hotel?.toJson();
    }
    return map;
  }

}

/// id : 18
/// name : "Palm Inn Hotel"
/// description : "Palm Inn Hotel features a restaurant, outdoor swimming pool, a shared lounge and garden in Hurghada. Featuring family rooms, this property also provides guests with a terrace. The accommodation provides a 24-hour front desk, room service and currency exchange for guests.\n\nGuest rooms at the hotel are equipped with a seating area. Rooms are complete with a private bathroom equipped with a bath, all units at Palm Inn Hotel have a flat-screen TV and air conditioning, and selected rooms have a balcony. At the accommodation every room is equipped with bed linen and towels.\n\nA continental breakfast is available daily at Palm Inn Hotel.\n\nGuests at the hotel will be able to enjoy activities in and around Hurghada, like cycling.\n\nPopular points of interest near Palm Inn Hotel include Elysees Dream Beach, Qesm Hurghada Public Beach and El Sawaki Beach. The nearest airport is Hurghada International Airport, 13 km from the accommodation.\n\nCouples particularly like the location — they rated it 8.0 for a two-person trip."
/// price : "38"
/// address : "El Dahar, Abdel-Moneim Riad Square, 84511 Hurghada, Egypt"
/// longitude : "33.812999"
/// latitude : "27.259102"
/// rate : "8.00"
/// created_at : "2022-09-28T10:53:41.000000Z"
/// updated_at : "2022-09-28T10:53:41.000000Z"
/// hotel_images : [{"id":16,"hotel_id":"18","image":"33391664362421.jpeg","created_at":null,"updated_at":null},{"id":17,"hotel_id":"18","image":"87741664362421.jpeg","created_at":null,"updated_at":null},{"id":18,"hotel_id":"18","image":"24311664362421.jpeg","created_at":null,"updated_at":null},{"id":19,"hotel_id":"18","image":"13321664362421.jpeg","created_at":null,"updated_at":null},{"id":20,"hotel_id":"18","image":"68051664362421.jpeg","created_at":null,"updated_at":null}]
/// facilities : [{"id":5,"name":"A/C","image":"8801664361358.png","created_at":"2022-09-28T10:35:58.000000Z","updated_at":"2022-09-28T10:35:58.000000Z"},{"id":6,"name":"Wifi","image":"74901664361371.png","created_at":"2022-09-28T10:36:11.000000Z","updated_at":"2022-09-28T10:36:11.000000Z"},{"id":7,"name":"Garden","image":"75771664361381.png","created_at":"2022-09-28T10:36:21.000000Z","updated_at":"2022-09-28T10:36:21.000000Z"}]

class Hotel {
  Hotel({
      this.id,
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
      this.facilities,});

  Hotel.fromJson(dynamic json) {
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
    if (json['hotel_images'] != null) {
      hotelImages = [];
      json['hotel_images'].forEach((v) {
        hotelImages?.add(HotelImages.fromJson(v));
      });
    }
    if (json['facilities'] != null) {
      facilities = [];
      json['facilities'].forEach((v) {
        facilities?.add(Facilities.fromJson(v));
      });
    }
  }
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
  List<Facilities>? facilities;

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
    if (hotelImages != null) {
      map['hotel_images'] = hotelImages?.map((v) => v.toJson()).toList();
    }
    if (facilities != null) {
      map['facilities'] = facilities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 5
/// name : "A/C"
/// image : "8801664361358.png"
/// created_at : "2022-09-28T10:35:58.000000Z"
/// updated_at : "2022-09-28T10:35:58.000000Z"

class Facilities {
  Facilities({
      this.id,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,});

  Facilities.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 16
/// hotel_id : "18"
/// image : "33391664362421.jpeg"
/// created_at : null
/// updated_at : null

class HotelImages {
  HotelImages({
      this.id,
      this.hotelId,
      this.image,
      this.createdAt,
      this.updatedAt,});

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

/// id : 321
/// name : "samydsf"
/// email : "sa@gmail.com"
/// email_verified_at : null
/// api_token : "DbEKpvqg2uKSMVONmzLyAEZyInLsWdVIZcVTsjP2ivgfNzqgJ9MRCDt95KaB"
/// image : null
/// created_at : "2022-09-26T22:29:55.000000Z"
/// updated_at : "2022-09-26T22:29:55.000000Z"
/// google_id : null
/// provider : null

class User {
  User({
      this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.apiToken,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.googleId,
      this.provider,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    apiToken = json['api_token'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    googleId = json['google_id'];
    provider = json['provider'];
  }
  num? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? apiToken;
  dynamic image;
  String? createdAt;
  String? updatedAt;
  dynamic googleId;
  dynamic provider;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['api_token'] = apiToken;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['google_id'] = googleId;
    map['provider'] = provider;
    return map;
  }

}

/// type : "1"

class Status {
  Status({
      this.type,});

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
import 'package:booking_app/features/hotels/data/models/HotelsModel.dart';

/// status : {"type":"1"}
/// data : {"current_page":1,"data":[{"id":10,"name":"hotel23","description":"desc4","price":"200","address":"rome","longitude":"100","latitude":"200","rate":"10.50","created_at":"2022-09-11T13:45:09.000000Z","updated_at":"2022-09-11T13:45:09.000000Z","hotel_images":[],"facilities":[{"id":1,"name":"facilit5","image":"37371662897079.jpg","created_at":"2022-09-11T11:51:19.000000Z","updated_at":"2022-09-11T11:51:19.000000Z"},{"id":2,"name":"Wifi","image":"71711662902782.jpeg","created_at":"2022-09-11T13:26:22.000000Z","updated_at":"2022-09-11T13:26:22.000000Z"}]},{"id":9,"name":"hotel2","description":"desc4","price":"200","address":"tanta","longitude":"100","latitude":"200","rate":"10.50","created_at":"2022-09-11T13:44:00.000000Z","updated_at":"2022-09-11T13:44:00.000000Z","hotel_images":[{"id":7,"hotel_id":"9","image":"35321662903840.jpg","created_at":null,"updated_at":null},{"id":8,"hotel_id":"9","image":"21831662903840.png","created_at":null,"updated_at":null}],"facilities":[{"id":1,"name":"facilit5","image":"37371662897079.jpg","created_at":"2022-09-11T11:51:19.000000Z","updated_at":"2022-09-11T11:51:19.000000Z"},{"id":2,"name":"Wifi","image":"71711662902782.jpeg","created_at":"2022-09-11T13:26:22.000000Z","updated_at":"2022-09-11T13:26:22.000000Z"}]}],"first_page_url":"http://api.mahmoudtaha.com/api/search-hotels?page=1","from":1,"last_page":1,"last_page_url":"http://api.mahmoudtaha.com/api/search-hotels?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://api.mahmoudtaha.com/api/search-hotels?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"http://api.mahmoudtaha.com/api/search-hotels","per_page":"20","prev_page_url":null,"to":2,"total":2}

class SearchModel {
  SearchModel({
      this.status, 
      this.data,});

  SearchModel.fromJson(dynamic json) {
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
/// data : [{"id":10,"name":"hotel23","description":"desc4","price":"200","address":"rome","longitude":"100","latitude":"200","rate":"10.50","created_at":"2022-09-11T13:45:09.000000Z","updated_at":"2022-09-11T13:45:09.000000Z","hotel_images":[],"facilities":[{"id":1,"name":"facilit5","image":"37371662897079.jpg","created_at":"2022-09-11T11:51:19.000000Z","updated_at":"2022-09-11T11:51:19.000000Z"},{"id":2,"name":"Wifi","image":"71711662902782.jpeg","created_at":"2022-09-11T13:26:22.000000Z","updated_at":"2022-09-11T13:26:22.000000Z"}]},{"id":9,"name":"hotel2","description":"desc4","price":"200","address":"tanta","longitude":"100","latitude":"200","rate":"10.50","created_at":"2022-09-11T13:44:00.000000Z","updated_at":"2022-09-11T13:44:00.000000Z","hotel_images":[{"id":7,"hotel_id":"9","image":"35321662903840.jpg","created_at":null,"updated_at":null},{"id":8,"hotel_id":"9","image":"21831662903840.png","created_at":null,"updated_at":null}],"facilities":[{"id":1,"name":"facilit5","image":"37371662897079.jpg","created_at":"2022-09-11T11:51:19.000000Z","updated_at":"2022-09-11T11:51:19.000000Z"},{"id":2,"name":"Wifi","image":"71711662902782.jpeg","created_at":"2022-09-11T13:26:22.000000Z","updated_at":"2022-09-11T13:26:22.000000Z"}]}]
/// first_page_url : "http://api.mahmoudtaha.com/api/search-hotels?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "http://api.mahmoudtaha.com/api/search-hotels?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://api.mahmoudtaha.com/api/search-hotels?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "http://api.mahmoudtaha.com/api/search-hotels"
/// per_page : "20"
/// prev_page_url : null
/// to : 2
/// total : 2

class PageData {
  PageData({
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

  PageData.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(HotelModel.fromJson(v));
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
  List<HotelModel>? data;
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

/// id : 10
/// name : "hotel23"
/// description : "desc4"
/// price : "200"
/// address : "rome"
/// longitude : "100"
/// latitude : "200"
/// rate : "10.50"
/// created_at : "2022-09-11T13:45:09.000000Z"
/// updated_at : "2022-09-11T13:45:09.000000Z"
/// hotel_images : []
/// facilities : [{"id":1,"name":"facilit5","image":"37371662897079.jpg","created_at":"2022-09-11T11:51:19.000000Z","updated_at":"2022-09-11T11:51:19.000000Z"},{"id":2,"name":"Wifi","image":"71711662902782.jpeg","created_at":"2022-09-11T13:26:22.000000Z","updated_at":"2022-09-11T13:26:22.000000Z"}]


/// id : 1
/// name : "facilit5"
/// image : "37371662897079.jpg"
/// created_at : "2022-09-11T11:51:19.000000Z"
/// updated_at : "2022-09-11T11:51:19.000000Z"


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
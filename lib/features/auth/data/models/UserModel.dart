/// status : {"type":"1","title":{"ar":"تم تسجيل الدخول بنجاح","en":"signed in successfuly"}}
/// data : {"id":320,"name":"samio","email":"s@gmail.com","email_verified_at":null,"api_token":"iTqDmvbFGEaTQdjBmOZ2G6Y6T1EuxQR2i5OkyMZl3boQqR0KLKFCpImYeXOA","image":null,"created_at":"2022-09-26T22:02:40.000000Z","updated_at":"2022-09-26T22:02:40.000000Z","google_id":null,"provider":null}

class UserModel {
  UserModel({
      this.status, 
      this.data,});

  UserModel.fromJson(dynamic json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Status? status;
  Data? data;

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

/// id : 320
/// name : "samio"
/// email : "s@gmail.com"
/// email_verified_at : null
/// api_token : "iTqDmvbFGEaTQdjBmOZ2G6Y6T1EuxQR2i5OkyMZl3boQqR0KLKFCpImYeXOA"
/// image : null
/// created_at : "2022-09-26T22:02:40.000000Z"
/// updated_at : "2022-09-26T22:02:40.000000Z"
/// google_id : null
/// provider : null

class Data {
  Data({
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

  Data.fromJson(dynamic json) {
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
/// title : {"ar":"تم تسجيل الدخول بنجاح","en":"signed in successfuly"}

class Status {
  Status({
      this.type, 
      this.title,});

  Status.fromJson(dynamic json) {
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

/// ar : "تم تسجيل الدخول بنجاح"
/// en : "signed in successfuly"

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
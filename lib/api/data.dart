import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class ResponseDataUrl{
  late  String message;
  late String status;
  ResponseDataUrl({required this.message, required this.status});
  factory ResponseDataUrl.fromJson(Map<String, dynamic> json) => _$ResponseDataUrlFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataUrlToJson(this);

}

@JsonSerializable()
class ResponseData{
  late  Map<String, dynamic> message;
  late String status;
  ResponseData({required this.message, required this.status});
  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);

}

@JsonSerializable()
class User {
  late Map<String, dynamic> data;

  User({required this.data});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Login {
  late String token;

  Login({required this.token});
  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

@JsonSerializable()
class Post {
  late String email;
  late String password;

  Post({required this.email, required this.password});
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
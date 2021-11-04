// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDataUrl _$ResponseDataUrlFromJson(Map<String, dynamic> json) =>
    ResponseDataUrl(
      message: json['message'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$ResponseDataUrlToJson(ResponseDataUrl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      message: json['message'] as Map<String, dynamic>,
      status: json['status'] as String,
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'data': instance.data,
    };

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'token': instance.token,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

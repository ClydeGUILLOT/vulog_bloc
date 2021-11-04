import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'data.dart';
part 'request.g.dart';

Map<String, dynamic> _data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};

@RestApi(baseUrl: "https://dog.ceo/api/")
abstract class ApiRequest{
  factory ApiRequest(Dio dio,{required String baseUrl}) =_ApiRequest;

  @GET("/breeds/list/all")
  Future<ResponseData> getDogList();

  @GET("/breed/{name}/images/random")
  Future<ResponseDataUrl> getDogImage(@Path("name") String name);
}

@RestApi(baseUrl: "https://reqres.in/api")
abstract class ApiRequestUser{
  factory ApiRequestUser(Dio dio,{required String baseUrl}) =_ApiRequestUser;

  @GET("/users/{id}")
  Future<User> getUserData(@Path("id") String id);

  @POST("/login")
  Future<Login> login(@Body() Post post);
}

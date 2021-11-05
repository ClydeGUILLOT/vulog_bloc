// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiRequest implements ApiRequest {
  _ApiRequest(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://dog.ceo/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ResponseData> getDogList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseData>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/breeds/list/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ResponseDataUrl> getDogImage(name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseDataUrl>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/breed/$name/images/random',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseDataUrl.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

class _ApiRequestUser implements ApiRequestUser {
  _ApiRequestUser(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://reqres.in/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<User> getUserData(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/users/$id',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Login> login(post) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(post.toJson());
    try {
      final _result = await _dio.fetch<Map<String, dynamic>>(
          _setStreamType<Login>(
              Options(method: 'POST', headers: _headers, extra: _extra)
                  .compose(_dio.options, '/login',
                  queryParameters: queryParameters, data: _data)
                  .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
      final value = Login.fromJson(_result.data!);
      return value;
    } catch (err) {
      return Login.fromJson({"token": ""});
    }
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

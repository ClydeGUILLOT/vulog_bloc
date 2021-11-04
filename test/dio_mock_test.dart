import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([
    this._message,
    this._prefix,
  ]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, 'Unauthorised: ');
}

class InvalidRequestException extends AppException {
  InvalidRequestException([message]) : super(message, 'Invalid Request: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([message]) : super(message, 'Invalid Input: ');
}

class FetchDataException extends AppException {
  FetchDataException([message])
      : super(message, 'Error During Communication: ');
}

const successMessage = {'message': 'Success'};
const errorMessage = {'message': 'error'};
const testPath = 'test';
const testData = {'data': 'sample data'};
const header = {'Content-Type': 'application/json'};

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  var baseUrl;

  setUp(() {
    dio.httpClientAdapter = dioAdapter;
    baseUrl = 'https://dog.ceo/api/breeds/list/all';
  });

  group('- ApiService class methods test', () {
    group('- Get Method', () {
      test('- Get Method Success test', () async {

        dioAdapter.onGet(
          '$baseUrl$testPath',
              (request) {
            return request.reply(200, successMessage);
          },
          data: null,
          queryParameters: {},
          headers: {},
        );


        final service = ApiService(
          dio: dio,
        );

        final response = await service.get('test');

        expect(response, successMessage);
      });
    });

    group('- Post Method', () {
      test('- Post Method Success test', () async {

        dioAdapter.onPost(
          '$baseUrl$testPath',
              (request) {
            return request.reply(201, successMessage);
          },
          data: json.encode(testData),
          queryParameters: {},
          headers: header,
        );


        final service = ApiService(
          dio: dio,
        );

        final response = await service.post('test', json.encode(testData));

        expect(response, successMessage);
      });
    });
  });
}

class ApiService {
  final String _baseURL = 'https://dog.ceo/api/breeds/list/all';
  Dio _dio = Dio();

  ApiService({Dio? dio}) {
    _dio = dio ?? Dio(); /// Dependency Injection
    _dio.options.baseUrl = _baseURL;
  }

  Future<dynamic> get(String path) async {
    var responseJson;
    try {
      final response = await _dio.get(_baseURL + path);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> post(String path, dynamic data) async {
    var responseJson;
    try {
      final response = await _dio.post(_baseURL + path,
          data: data,
          options: Options()..headers = {'Content-Type': 'application/json'});
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  @override
  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 404:
        return response.data;
      case 400:
        throw InvalidRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
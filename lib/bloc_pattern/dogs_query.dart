import 'dart:async';

import 'package:blocpattern/api/request.dart';
import 'package:blocpattern/bloc_pattern/bloc.dart';
import 'package:blocpattern/functions/map_to_list.dart';
import 'package:dio/dio.dart';

class DogsQueryBloc implements Bloc {
  late List<String> _dogsNames;
  late List<String> _dogsUrls;

  List<String> get dogsNames => _dogsNames;
  List<String> get dogsUrls => _dogsUrls;

  final _controller = StreamController<List<String>>();
  StreamSink<List<String>> get dogsSink => _controller.sink;
  Stream<List<String>> get dogsStream => _controller.stream;

  void addMap(Map<String, dynamic> query) {
    _dogsNames = mapToList(query);
    _controller.sink.add(_dogsNames);
  }
  void addString(String query) {
    _dogsUrls.add(query);
    _controller.sink.add(_dogsUrls);
  }
  DogsQueryBloc();

  @override
  void dispose() {
    _controller.close();
  }
}
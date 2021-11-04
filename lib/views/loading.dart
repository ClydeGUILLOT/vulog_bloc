import 'dart:async';

import 'package:blocpattern/bloc_pattern/bloc_provider.dart';
import 'package:blocpattern/bloc_pattern/dogs_query.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:blocpattern/functions/map_to_list_url.dart';

import '../api/request.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(BlocProvider.of<DogsQueryBloc>(context), context)
    );
  }

  Widget _buildBody(bloc, context) {

    final client = ApiRequest(Dio(BaseOptions(contentType: "application/json")),
        baseUrl: 'https://dog.ceo/api/');
    Future _future = client.getDogList();
    _future.then((value) {
      bloc.addMap(value.message);
      mapToListUrl(value.message);
      Navigator.pushReplacementNamed(context, '/home');
    });
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
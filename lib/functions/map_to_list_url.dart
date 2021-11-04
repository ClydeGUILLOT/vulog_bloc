import 'package:dio/dio.dart';
import 'package:blocpattern/api/request.dart';
import 'package:blocpattern/globals.dart' as globals;

void mapToListUrl(Map<String, dynamic> map) {
  map.forEach((key, value) {
    value.isNotEmpty ? value.forEach((element) {
      getUrl(race: key, name: "/$element");
    }) : getUrl(race: key);
  });
}

void getUrl({String race = "", String name = ""})  {
    final client = ApiRequest(Dio(BaseOptions(contentType: "application/json")),
        baseUrl: 'https://dog.ceo/api/');
    Future _future = client.getDogImage(race + name);
    _future.then((value) {
      globals.listUrls.add(value.message);
      // bloc.addString(value.message);
      // print(value.message.toString());
      // Provider.of<DOGS>(context, listen: false).allUrl = value.message.toString();
    });

}

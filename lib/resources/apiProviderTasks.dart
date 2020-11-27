import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;

import '../data.dart';


class TasksApiProvider {
  Client client = Client();
  final _apiKey = 'api-key';
  final String baseUrl;
  TasksApiProvider({this.baseUrl});
  Future<List<Map<String,dynamic>>> fetchMovieList() async {
    Response response;
//    if(_apiKey != 'api-key') {
      response = await client.get("$baseUrl&api_token="+apiToken);
//    }else{
//      throw Exception('Please add your API key');
//    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<Map<String, dynamic>> listmaps= [];
      List<dynamic> datalist = json.decode(response.body);
      datalist.forEach((element) {
        listmaps.add(element);
      });
      return listmaps;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

}
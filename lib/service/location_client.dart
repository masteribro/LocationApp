import 'dart:convert';

import '../model/lat_and_log.dart';
import 'package:http/http.dart' as http;


class LocationClient{
  Future<LatAndLong?> getLatAndLong(String? location) async {
var endPoint =  Uri.parse("https://api.openweathermap.org/geo/1.0/direct?q=${location}&limit=5&appid=8447d279d8f9e05c6560f4dc1736e37a");
var response = await http.get(endPoint);
var body = jsonDecode(response.body);
print(LatAndLong.fromJson(body[0]).country);
return LatAndLong.fromJson(body[0]);
  }

}
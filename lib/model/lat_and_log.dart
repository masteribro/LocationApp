import 'dart:core';

class LatAndLong {
  String? name;
  double? lat;
  double? lon;
  String? country;
  String? state;

  LatAndLong({this.name, this.lat, this.lon, this.country, this.state});

  LatAndLong.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
  }


}








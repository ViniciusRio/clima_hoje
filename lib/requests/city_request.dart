import 'dart:convert';
import 'package:clima_hoje/app/city.dart';
import 'package:clima_hoje/app/location.dart';
import 'package:clima_hoje/app/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

fetchCity() async {
  final geoKey = dotenv.env['API_KEY_GEO'];
  var locationData = await getLocation();
  var lat = locationData!.latitude;
  var long = locationData.longitude;

  final responseGeo = await http.get(Uri.parse(
      'https://api.geoapify.com/v1/geocode/reverse?lat=$lat&lon=$long&format=json&apiKey=$geoKey'
  ));

  if (responseGeo.statusCode == 200) {
    return City.fromJson(jsonDecode(responseGeo.body));
  } else {
    throw Exception('Falied to fetch city');
  }
}

import 'dart:convert';
import 'package:clima_hoje/app/city.dart';
import 'package:clima_hoje/app/location.dart';
import 'package:clima_hoje/app/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'city_request.dart';

Future<Weather> fetchWeather() async {
  final apiKey = dotenv.env['API_KEY_WEATHER'];
  final City city = await fetchCity();
  final response = await http.get(Uri.parse(
      'http://api.weatherstack.com/current?access_key=$apiKey&query=${city.city}'
  ));

  if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falied to Weather');
  }
}






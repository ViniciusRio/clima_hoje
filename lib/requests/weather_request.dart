import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future<Weather> fetchWeather() async {
  final apiKey = dotenv.env['API_KEY'];
  final response = await http.get(Uri.parse(
      'http://api.weatherstack.com/current?access_key=$apiKey&query=New%20York'
      //http://api.weatherstack.com/current?access_key=d2e52449fce100ea45c2e304f319f299&query=New%20York
  ));

  if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falied to Weather');
  }
}

class Weather {
  late String city;
  late int temperature;
  late int humidity;
  late int feelslike;
  late String weatherDescriptions;
  late String icon;

  Weather({
    required this.city,
    required this.temperature,
    required this.humidity,
    required this.feelslike,
    required this.weatherDescriptions,
    required this.icon

  });

  factory Weather.fromJson(Map<dynamic, dynamic> json) {
    return Weather(
      city: json['location']['name'],
      temperature: json['current']['temperature'],
      humidity: json['current']['humidity'],
      feelslike: json['current']['feelslike'],
      weatherDescriptions: json['current']['weather_descriptions'][0],
      icon: json['current']['weather_icons'][0]
    );
  }
}




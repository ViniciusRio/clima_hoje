import 'dart:convert';

import 'package:http/http.dart' as http;


Future<Weather> fetchWeather() async{
  final response = await http.get(Uri.parse(
      'http://api.weatherstack.com/current?access_key=8ef49646c8b26fcce95334457de54c51&query=New%20York'
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

  Weather({
    required this.city,
    required this.temperature,
    required this.humidity
  });

  factory Weather.fromJson(Map<dynamic, dynamic> json) {
    return Weather(
      city: json['location']['name'],
      temperature: json['current']['temperature'],
      humidity: json['current']['humidity']
    );
  }
}




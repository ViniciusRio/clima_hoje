import 'dart:convert';
import 'package:clima_hoje/app/weather.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Weather> fetchWeather() async {
  final apiKey = dotenv.env['API_KEY'];
  final response = await http.get(Uri.parse(
      'http://api.weatherstack.com/current?access_key=$apiKey&query=New%20York'
  ));

  if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falied to Weather');
  }
}






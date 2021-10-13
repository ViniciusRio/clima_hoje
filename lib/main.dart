import 'package:clima_hoje/requests/weather_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/clima_hoje.dart';

//dotenv.env['VAR_NAME'];
//http://api.weatherstack.com/current?access_key=8ef49646c8b26fcce95334457de54c51&query=New%20York

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(ClimaHoje());
}



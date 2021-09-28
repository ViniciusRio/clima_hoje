import 'package:clima_hoje/requests/weather_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//dotenv.env['VAR_NAME'];
//http://api.weatherstack.com/current?access_key=8ef49646c8b26fcce95334457de54c51&query=New%20York

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(ClimaHoje());
}

class ClimaHoje extends StatefulWidget {
  ClimaHoje({Key? key}) : super(key: key);

  @override
  _ClimaHoje createState() => _ClimaHoje();

}

class _ClimaHoje extends State<ClimaHoje> {
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();

    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Clima Hoje',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Clima Hoje'),
          ),
          body: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Icon(Icons.circle, color: Colors.blue),
                        Text('Ensolarado')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        FutureBuilder<Weather>(
                          future: futureWeather,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List dateTemperature = [
                                {"temperature": snapshot.data!.temperature}

                              ];

                              return Text(dateTemperature[0]['temperature'].toString() + '°');
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            // By default, show a loading spinner.
                            return const CircularProgressIndicator();
                          },
                        )
                      ],
                    ),
                    Column(
                      children:  [
                        FutureBuilder<Weather>(
                          future: futureWeather,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(snapshot.data!.city);
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            // By default, show a loading spinner.
                            return const CircularProgressIndicator();
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text('Sensação Térmica'),
                      Text('40°')
                    ],
                  ),
                  Column(
                    children: const [
                      Text('Umidade'),
                      Text('86%')
                    ],
                  )
                ],
              ),

            ],
          )),
    );
  }
}

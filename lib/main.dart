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
                      children: [
                        Image.network(
                            FutureBuilder<Weather>(
                              future: futureWeather,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List icon = [
                                    {"icon": snapshot.data!.icon}

                                  ];

                                  return Text(icon[0]['icon'].toString());
                                } else if (snapshot.hasError) {
                                  return Text('error');
                                }
                                return Text('error two');

                              },
                            ).toString()
                        ),
                        FutureBuilder<Weather>(
                          future: futureWeather,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List dateWeatherDescriptions = [
                                {"weatherDescriptions": snapshot.data!.weatherDescriptions}

                              ];

                              return Text(dateWeatherDescriptions[0]['weatherDescriptions'].toString());
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            // By default, show a loading spinner.
                            return const CircularProgressIndicator();
                          },
                        )
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
                    children: [
                      Text('Sensação Térmica'),
                      FutureBuilder<Weather>(
                        future: futureWeather,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List dateFeelslike = [
                              {"feelslike": snapshot.data!.feelslike}

                            ];

                            return Text(dateFeelslike[0]['feelslike'].toString() + '°');
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
                    children: [
                      Text('Umidade'),
                      FutureBuilder<Weather>(
                        future: futureWeather,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List dateHumidity = [
                              {"humidity": snapshot.data!.humidity}

                            ];

                            return Text(dateHumidity[0]['humidity'].toString());
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

            ],
          )),
    );
  }
}

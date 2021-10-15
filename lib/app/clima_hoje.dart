import 'package:clima_hoje/app/weather.dart';
import 'package:clima_hoje/requests/weather_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClimaHoje extends StatefulWidget {
  const ClimaHoje({Key? key}) : super(key: key);

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
              FutureBuilder<Weather>(
                future: futureWeather,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List dataWeather = [
                      {
                        "city": snapshot.data!.city,
                        "temperature": snapshot.data!.temperature,
                        "humidity": snapshot.data!.humidity,
                        "feelslike": snapshot.data!.feelslike,
                        "weatherDescriptions":
                            snapshot.data!.weatherDescriptions,
                        "iconURL": snapshot.data!.iconURL
                      }
                    ];

                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(dataWeather[0]['iconURL']),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(dataWeather[0]['weatherDescriptions']),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                dataWeather[0]['temperature'].toString() + '°'),
                            const SizedBox(width: 5),
                            Text(dataWeather[0]['city'].toString()),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text('Sensação Térmica'),
                                Text(dataWeather[0]['feelslike'].toString() +
                                    '°'),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Umidade'),
                                Text(
                                    dataWeather[0]['humidity'].toString() + '%')
                              ],
                            )
                          ],
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              )
            ],
          )),
    );
  }
}

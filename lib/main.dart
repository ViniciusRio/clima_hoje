import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ClimaHoje());

class ClimaHoje extends StatelessWidget {
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
                      children: const [
                        Text('28°'),
                      ],
                    ),
                    Column(
                      children: const [
                        Text('João Pessoa'),
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
              )
            ],
          )),
    );
  }
}

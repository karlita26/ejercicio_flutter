import 'package:flutter/material.dart';

import 'flashC.dart';
import 'directionsWalk.dart';
import 'airport_shuttle.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Asynchronous calls';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        backgroundColor: Colors.cyan.shade100,
        appBar: AppBar(title: const Text(_title)),
        body: const StateWidget(),
      ),
    );
  }
}

class StateWidget extends StatefulWidget {
  const StateWidget({super.key});

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  final double _height = 50;
  final double _width = 50;

  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return const Material(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Bienvenidos",
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo)),
            ListScreen(),
            airport_shuttle(),
            directions_walk(),
          ]),
    ));
  }
}

import 'dart:async';

import 'package:asincronia/services/mockapi.dart';
import 'package:flutter/material.dart';

class airport_shuttle extends StatefulWidget {
  const airport_shuttle({Key? key}) : super(key: key);

  @override
  _ListStateScreen createState() => _ListStateScreen();
}

class _ListStateScreen extends State<airport_shuttle> {
  double _anchura = 0;
  int resultadobarra = 0;
  bool _activartexto = false;
  final Color _color = Colors.orange;
  bool _Expandido = false;
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Ink(
              width: 80,
              height: 80,
              decoration: const ShapeDecoration(
                color: Colors.orange,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.airport_shuttle,
                  color: Colors.black,
                  size: 50.0,
                ),
                color: Colors.white,
                onPressed: () async {
                  _alternarExpandir();
                  resultadobarra = await MockApi().getHyundaiInteger();
                  actualizar();
                  await Future.delayed(const Duration(seconds: 3));

                  _activartexto = true;
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(""),
            ),
            AnimatedContainer(
              width: _Expandido ? _anchura : _anchura,
              height: 15,
              decoration: BoxDecoration(
                color: _color,
              ),
              duration: Duration(seconds: _Expandido ? 3 : 0),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(""),
            ),
            Text(
              result().toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.orange),
            ),
          ],
        ));
  }

  actualizar() {
    setState(() {
      _anchura = 0;
      _Expandido = false;
    });
  }

  _alternarExpandir() {
    setState(() {
      _Expandido = !_Expandido;
      _anchura = 350;
    });
  }

  result() {
    return resultadobarra;
  }
}

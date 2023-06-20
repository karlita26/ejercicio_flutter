import 'dart:async';

import 'package:asincronia/services/mockapi.dart';
import 'package:flutter/material.dart';

class directions_walk extends StatefulWidget {
  const directions_walk({Key? key}) : super(key: key);

  @override
  _ListStateScreen createState() => _ListStateScreen();
}

class _ListStateScreen extends State<directions_walk> {
  double _anchura = 0;
  int resultadobarra = 0;
  bool _activartexto = false;
  final Color _color = Colors.redAccent;
  bool _Expandir = false;
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
                color: Colors.redAccent,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.directions_walk,
                  color: Colors.black,
                  size: 50.0,
                ),
                color: Colors.white,
                onPressed: () async {
                  _alternarExpandir();
                  resultadobarra =
                      await MockApi().getFisherPriceInteger();
                  actualizar();
                  await Future.delayed(const Duration(seconds: 10));

                  _activartexto = true;
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(""),
            ),
            AnimatedContainer(
              width: _Expandir ? _anchura : _anchura,
              height: 15,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
              ),
              duration: Duration(seconds: _Expandir ? 10 : 0),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(""),
            ),
            Text(
              resultado().toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.redAccent),
            ),
          ],
        ));
  }

  actualizar() {
    setState(() {
      _anchura = 0;
      _Expandir = false;
    });
  }

  _alternarExpandir() {
    setState(() {
      _Expandir = !_Expandir;
      _anchura = 350;
    });
  }

  resultado() {
    return resultadobarra;
  }
}

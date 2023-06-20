import 'dart:async';

import 'package:asincronia/services/mockapi.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListStateScreen createState() => _ListStateScreen();
}

class _ListStateScreen extends State<ListScreen> {
  double _anchura = 0;
  int resultadobarra = 0;
  bool _activartexto = false;
  final Color _color = Colors.green;
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
                color: Colors.green,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.flash_on_sharp,
                  color: Colors.black,
                  size: 50.0,
                ),
                color: Colors.white,
                onPressed: () async {
                  _alternarExpandir();
                  resultadobarra = await MockApi().getFerrariInteger();
                  actualizar();
                  await Future.delayed(const Duration(seconds: 1));

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
              duration: Duration(seconds: _Expandido ? 1 : 0),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(""),
            ),
            Text(
              resultado().toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.green),
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

  resultado() {
    return resultadobarra;
  }
}

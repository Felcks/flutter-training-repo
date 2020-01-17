import 'dart:math';

import 'package:cara_ou_coroa/GamePage.dart';
import 'package:cara_ou_coroa/MoedaType.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _definirResultado(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GamePage(MoedaType.values[Random().nextInt(MoedaType.values.length)]);
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("images/logo.png"),
            GestureDetector(
              onTap: _definirResultado,
              child: Image.asset("images/botao_jogar.png"),
            )
          ],
        ),
      ),
    );
  }
}

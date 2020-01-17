import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: "Frases do dia",
    home: Home(),
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> frases = [
    "Gratidão",
    "Foco",
    "Força",
    "Fé"
  ];

  int _randomNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
              "images/logo.png",
                fit: BoxFit.contain,
              ),
              Text(
                frases[_randomNumber],
                style: TextStyle(
                fontSize: 20,
                wordSpacing: 10,
                fontStyle: FontStyle.italic,
                ),
              ),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    _randomNumber = Random().nextInt(frases.length);
                  });
                },
                color: Colors.green,
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

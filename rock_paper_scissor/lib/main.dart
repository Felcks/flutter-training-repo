import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: "Rock paper scissor",
    home: Home(),
  )
);


enum Choice{
  rock,
  paper,
  scissor
}

class _HomeState extends State<Home> {

  var _result = "Escolha uma opção abaixo";
  final _draw = "Empate";
  final _victory = "Você venceu";
  final _lose = "Você perdeu";

  var _imagemApp = AssetImage("images/padrao.png");
  var _imagens = [
    AssetImage("images/pedra.png"),
    AssetImage("images/papel.png"),
    AssetImage("images/tesoura.png")
  ];

  void play(Choice playerChoice){

    setState(() {
      var randomNumber = Random().nextInt(Choice.values.length);
      var machineChoice = Choice.values[randomNumber];
      _imagemApp = _imagens[randomNumber];

      switch(playerChoice){
        case Choice.rock:
          switch(machineChoice) {
            case Choice.rock:
              _result = _draw;
              break;
            case Choice.paper:
              _result = _lose;
              break;
            case Choice.scissor:
              _result = _victory;
              break;
          }
          break;

        case Choice.paper:
          switch(machineChoice) {
            case Choice.rock:
              _result = _victory;
              break;
            case Choice.paper:
              _result = _draw;
              break;
            case Choice.scissor:
              _result = _lose;
              break;
          }
          break;

        case Choice.scissor:
          switch(machineChoice) {
            case Choice.rock:
              _result = _lose;
              break;
            case Choice.paper:
              _result = _victory;
              break;
            case Choice.scissor:
              _result = _draw;
              break;
          }
          break;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        "Rock paper scissor"
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Escolha do app",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image(
                image: _imagemApp,
                fit: BoxFit.none,
              ),
              Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  _result,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {play(Choice.rock);},
                    child: Image.asset(
                      "images/pedra.png",
                      fit: BoxFit.scaleDown,
                      height: 85,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {play(Choice.paper);},
                    child: Image.asset(
                      "images/papel.png",
                      fit: BoxFit.scaleDown,
                      height: 85,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {play(Choice.scissor);},
                    child: Image.asset(
                      "images/tesoura.png",
                      fit: BoxFit.scaleDown,
                      height: 85,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
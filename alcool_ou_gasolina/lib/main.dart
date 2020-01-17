import 'dart:typed_data';

import 'package:flutter/material.dart';

void main() {

  runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              title: Text("Alcool ou gasolina"),
          ),
          body: Home(),
        )
      )
  );

}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _textEditingControllerAlcool = TextEditingController();
  TextEditingController _textEditingControllerGasolina = TextEditingController();

  String _resultado = "";

  void _calculaMelhorOpcao(){

    double precoAlcool = double.tryParse(_textEditingControllerAlcool.text);
    double precoGasolina = double.tryParse(_textEditingControllerGasolina.text);

    if(precoAlcool != null && precoGasolina != null){

      setState(() {

        if(precoAlcool < precoGasolina){
          _resultado = "Melhor alcool";
        }
        else if(precoGasolina < precoAlcool){
          _resultado = "Melhor gasolina";
        }
        else{
          _resultado = "Tanto faz";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("images/logo.png"),
            Padding(
              padding: EdgeInsets.only(top: 32),
            ),
            Text(
                "Saiba qual é a melhor opção para abestecimento do seu carro",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                )
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Preço do alcool ex: 1.59"
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              controller: _textEditingControllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Pre;o da gasolina ex: 3.15"
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              controller: _textEditingControllerGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
            ),
            RaisedButton(
              child: Text(
                "Calcular",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              padding: EdgeInsets.all(16),
              color: Colors.blue,
              onPressed: _calculaMelhorOpcao,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _resultado,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

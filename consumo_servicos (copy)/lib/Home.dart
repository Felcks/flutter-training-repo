import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _recuperaCEP() async {

    String cep = "22640102";
    String url = "http://viacep.com.br/ws/$cep/json/";
    http.Response response;

    response = await http.get(url);

    print("resposta: ${response.body}");

    Map<String, dynamic> retorno = json.decode((response.body));

    print(retorno["ibge"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _recuperaCEP,
              child: Text("Clique aqui"),
            )
          ],
        ),
      ),
    );
  }
}

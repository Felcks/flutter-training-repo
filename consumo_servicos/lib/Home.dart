import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _recuperaCEP() async {
    
    String cep = _textEditingController.text.toString();
    String url = "http://viacep.com.br/ws/$cep/json/";
    http.Response response;

    response = await http.get(url);

    print("resposta: ${response.body}");

    Map<String, dynamic> retorno = json.decode((response.body));

    String logradouro =  retorno["logradouro"];
    String complemenmto= retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    setState(() {
      _resultado = "$logradouro $complemenmto, $bairro";
    });

  }

  TextEditingController _textEditingController = TextEditingController();
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              obscureText: false,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue,
                decorationColor: Colors.blue,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Insira seu cep Ex: 22640102",
              ),
              controller: _textEditingController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: RaisedButton(
                onPressed: _recuperaCEP,
                child: Text("Clique aqui"),
              ) ,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                _resultado
              ),
            )
          ],
        ),
      ),
    );
  }
}

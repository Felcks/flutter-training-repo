import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(
  MaterialApp(
    title: "Bitoin price",
    home: BitcoinHome(),
  )
);

class BitcoinHome extends StatefulWidget {
  @override
  _BitcoinHomeState createState() => _BitcoinHomeState();
}

class _BitcoinHomeState extends State<BitcoinHome> {

  void _resgataPrecoBitcoin() async{

    String url = "https://blockchain.info/ticker";
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode((response.body));

    setState(() {
      _precoAtual = retorno["BRL"]["sell"];
    });

  }

  double _precoAtual;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
          padding: EdgeInsets.all(32),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                  "images/bitcoin.png",
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child:  Text(
                  "RS ${_precoAtual.toString()}",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: _resgataPrecoBitcoin,
                color: Colors.orange,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Atualizar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}


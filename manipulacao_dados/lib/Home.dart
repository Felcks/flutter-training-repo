import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _resultado = "";
  String _digitado = "Digite algo";

  TextEditingController _textEditingController = TextEditingController();

  void _salva() async{

    String valorDigitado = _textEditingController.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);
  }

  void _remove() async{

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("nome");
  }

  void _le() async{

    final prefs = await SharedPreferences.getInstance();
    String mString = prefs.getString("nome");
    setState(() {
        _resultado = mString ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulacao de dados"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Text(
                _resultado
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: _digitado,
                ),
                controller: _textEditingController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      "Salvar",
                    ),
                    onPressed: _salva
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Ler"),
                    onPressed: _le
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Remover"),
                    onPressed: _remove
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

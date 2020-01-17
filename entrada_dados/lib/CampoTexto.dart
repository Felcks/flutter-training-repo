import "package:flutter/material.dart";

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Entrada de dados"
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite um valor"
              ),
              style: TextStyle(
                fontSize: 25,
                color: Colors.green,
              ),
//              onChanged: (value){
//                print(value);
//              },
//              onSubmitted: (value){
//                print(value);
//              },
//              obscureText: true,
//              enabled: false,
//              maxLength: 2,
//              maxLengthEnforced: false,
              controller: _textEditingController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16)
            ),
            RaisedButton(
              child: Text("Salvar"),
              color: Colors.lightGreen,
              onPressed: () {
                print(_textEditingController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}

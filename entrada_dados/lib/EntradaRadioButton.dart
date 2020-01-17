import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String _escolhaUsuario;
  int _escolhaUsuario2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Entrada de dados"
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            RadioListTile(
              title: Text("Masculino"),
              value: "m",
              groupValue: _escolhaUsuario,
              onChanged: (String value){
                setState(() {
                  _escolhaUsuario = value;
                });
              },
            ),
            RadioListTile(
              title: Text("Feminino"),
              value: "f",
              groupValue: _escolhaUsuario,
              onChanged: (String value){
                setState(() {
                  _escolhaUsuario = value;
                });
              },
            ),
            RaisedButton(
              child: Text(
                  "Salvar"
              ),
              onPressed: (){
                print("Escolha $_escolhaUsuario");
              },
            ),


            /*Text("Masculino"),
            Radio(
                value: "m",
                groupValue: _escolhaUsuario,
                onChanged: (String value){
                  print("Escolha $value");
                  setState(() {
                    _escolhaUsuario = value;
                  });
                }
            ),
            Text("Feminino"),
            Radio(
                value: "f",
                groupValue: _escolhaUsuario,
                onChanged: (String value){
                  print("Escolha $value");
                  setState(() {
                    _escolhaUsuario = value;
                  });
                }
            ),*/
          ],
        ),
      ),
    );
  }
}

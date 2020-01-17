import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _escolhaUsuario = false;
  bool _escolhaConfiguracao = false;

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
            SwitchListTile(
              title: Text("Receber notificações?"),
              value: _escolhaUsuario,
              onChanged: (bool value){
                _escolhaUsuario = value;
                setState(() {
                  value = _escolhaUsuario;
                });
              },
            ),
            SwitchListTile(
              title: Text("Escolha configuração?"),
              value: _escolhaConfiguracao,
              onChanged: (bool value){
                _escolhaConfiguracao = value;
                setState(() {
                  value = _escolhaConfiguracao;
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


//            Switch(
//              value: _escolhaUsuario,
//              onChanged: (bool value){
//                _escolhaUsuario = value;
//                setState(() {
//                  value = _escolhaUsuario;
//                });
//              },
//            )
          ],
        ),
      ),
    );
  }
}

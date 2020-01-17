import 'package:cara_ou_coroa/MoedaType.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {

  MoedaType selectedType;

  GamePage(this.selectedType){
   print(this.selectedType);
  }

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  
  List<Image> _moedas = [
      Image.asset("images/moeda_cara.png"),
      Image.asset("images/moeda_coroa.png")
  ];
  
  void _voltar(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _moedas[widget.selectedType.index],
            GestureDetector(
              onTap: _voltar,
              child: Image.asset("images/botao_voltar.png"),
            )
          ],
        ),
      ),
    );
  }
}

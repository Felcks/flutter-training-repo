import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  double mValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Entrada de dados"
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          children: <Widget>[
            Slider(
              value: mValue,
              min: 0,
              max: 5,
              divisions: 5,
              label: mValue.toString(),
              activeColor: Colors.red,
              inactiveColor: Colors.blue,
              onChanged: (double value){
                setState(() {
                  mValue = value;
                });
                print(mValue);
              },

            ),
            RaisedButton(
              child: Text(
                  "Salvar"
              ),
              onPressed: (){
                print(mValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

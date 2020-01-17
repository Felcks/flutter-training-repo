import "package:flutter/material.dart";

class EntradaCheckbox extends StatefulWidget {
  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;

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
            CheckboxListTile(
              title: Text("Comida brasileira"),
              subtitle: Text("A melhor comida do mundo"),
              activeColor: Colors.red,
              value: _comidaBrasileira,
              secondary: Icon(
                Icons.add_box
              ),
              onChanged: (bool value){
                print("Checkbox valor $value");
                setState(() {
                  _comidaBrasileira = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Comida mexicana"),
              subtitle: Text("A melhor comida do mundo"),
              activeColor: Colors.red,
              value: _comidaMexicana,
              secondary: Icon(
                  Icons.add_box
              ),
              onChanged: (bool value){
                print("Checkbox valor $value");
                setState(() {
                  _comidaMexicana = value;
                });
              },
            ),
            RaisedButton(
              onPressed: (){
                print(
                  "Comida brasileira:${_comidaBrasileira.toString()} " +
                    "Comida mexicana:${_comidaMexicana.toString()}"
                );
              },
              child: Text(
                "Salvar"
              ),
            )
//            Text(
//              "Comida Brasileira"
//            ),
//            Checkbox(
//              value: _isSelected,
//              onChanged: (bool value){
//                print("Checkbox valor $value");
//                setState(() {
//                  _isSelected = value;
//                });
//              },
//            ),
          ]
        ),
      ),
    );
  }
}

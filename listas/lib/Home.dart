import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregaItens(){

    _itens = [];
    for(int i=0; i<10; i++){

      Map<String, dynamic> item = Map();
      item["titulo"] = "Título $i";
      item["descricao"] = "Descricao $i";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {

    _carregaItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice){
            dynamic item = _itens[indice];
            return ListTile(
              title: Text(
                item["titulo"].toString()
              ),
              subtitle: Text(
                item["descricao"].toString()
              ),
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(item["titulo"].toString()),
                      titleTextStyle: TextStyle(
                        color: Colors.orange,
                        fontSize: 20
                      ),
                      content: Text(item["descricao"].toString()),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                              "Não"
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                              "Sim"
                          ),
                        ),
                      ],
                    );
                  }
                );
              },
              onLongPress: (){

              },
            );
          },
        ),
      ),
    );
  }
}

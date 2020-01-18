import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'Tarefa.dart';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Tarefa> tarefas = [];
  TextEditingController _textEditingController = TextEditingController();

  Future<File> _getArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  void _salvaArquivo() async {

    File arquivo = await _getArquivo();

    String dados = json.encode(tarefas.map((tarefa) => tarefa.toJson()).toList());
    arquivo.writeAsStringSync(dados);
  }

  Future<List> _leArquivo() async {

    try {
      File arquivo = await _getArquivo();
      String dados = await arquivo.readAsString();

      return json.decode(dados) as List;

    }
    catch(e){}
  }


  @override
  void initState() {
    super.initState();

    _leArquivo().then( (list) {
      setState(() {
        tarefas = (list).map((item) => Tarefa.fromJson(item)).toList();
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Lista de tarefas"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: tarefas.length,
          itemBuilder: (context, index) {

            Tarefa t = tarefas[index];

            return Dismissible(
              child: CheckboxListTile(
                title: Text(t.nome),
                value: t.realizada,
                onChanged: (bool) {
                  setState(() {
                    t.realizada = bool;
                  });
                  _salvaArquivo();
                },
              ),
              key: ValueKey(DateTime.now().millisecondsSinceEpoch.toString()),
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Colors.white
                    )
                  ],
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction){

                  final ultimaTarefa = t;

                  tarefas.removeAt(index);
                  _salvaArquivo();


                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.black,
                      duration: Duration(
                        seconds: 5
                      ),
                      action: SnackBarAction(
                        label: "Desfazer",
                        onPressed: (){
                          setState(() {
                            tarefas.insert(index, ultimaTarefa);
                          });
                          _salvaArquivo();
                        },
                      ),
                      content: Text(
                          "Tarefa removida"
                      ),
                    )
                  );
              },
            );
//              Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text(t.nome),
//                Checkbox(
//                  value: t.realizada,
//                  onChanged: (bool) {
//                    setState(() {
//                      t.realizada = bool;
//                    });
//                    _salvaArquivo();
//                  },
//                )
//              ],
//            );
          }
        )
      ),
//
//
//
//      floatingActionButton: FloatingActionButton.extended(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Adicionar Tarefa"),
                content: TextField(
                  decoration: InputDecoration(
                    labelText: "Digite sua tarefa"
                  ),
                  controller: _textEditingController,
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Cancelar"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("Salvar"),
                    onPressed: () {
                      tarefas.add(Tarefa(_textEditingController.text, false));
                      _salvaArquivo();
                      _textEditingController.text = "";
                      setState(() {
                        _leArquivo();
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            }
          );
        },
//        mini: false,
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
//        shape: BeveledRectangleBorder(
//          borderRadius: BorderRadius.circular(10)
//        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

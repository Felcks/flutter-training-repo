import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricoes.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultadoBusca = "";
  
  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_resultadoBusca),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black
          ),
          body1: TextStyle(
              color: Colors.black
          ),
        ),
        title:  Image.asset(
          "images/youtube_dark.png",
          width: 100,
          height: 80,
        ),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: CustomSearchDelegate(searchFieldLabel: "Search"));
              setState(() {
                _resultadoBusca = res;
              });
            },
          ),

          /*IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){},
          ),

          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){},
          ),*/
        ],
      ),
      body: Container(
        child:telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("Início"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              title: Text("Em alta"),
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
              title: Text("Inscrições"),
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
              title: Text("Biblioteca"),
              icon: Icon(Icons.folder)
          ),
        ]
      ),
    );
  }
}

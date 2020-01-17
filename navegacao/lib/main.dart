import 'package:flutter/material.dart';
import 'package:navegacao/TelaSecundaria.dart';

void main() => runApp(
    MaterialApp(
      title: "Tela 1",
      initialRoute: "/",
      routes: {
        "/secundaria": (context) => TelaSecundaria()
      },
      home: NavigationHome(),
    )
);

class NavigationHome extends StatefulWidget {
  @override
  _NavigationHomeState createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela principal"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text("Tela Principal"),
            RaisedButton(
              child: Text("Ir para a segunda tela"),
              onPressed: (){
                Navigator.pushNamed(context, "/secundaria");
              },
            )
          ],
        ),
      ),
    );
  }
}


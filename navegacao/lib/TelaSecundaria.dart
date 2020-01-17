import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {

  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela secundária"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text("Tela secundária"),
          ],
        ),
      ),
    );
  }
}

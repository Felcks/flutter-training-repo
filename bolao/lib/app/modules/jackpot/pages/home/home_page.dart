import 'package:bolao/app/modules/championship/models/jackpot.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Jackpot jackpot;

  const HomePage({Key key, this.jackpot}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jackpot.name),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:flutter/material.dart';

class ChampionshipWidget extends StatelessWidget {
  final Championship item;
  final Function onClicked;

  const ChampionshipWidget({Key key, this.item, this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
    );
  }
}

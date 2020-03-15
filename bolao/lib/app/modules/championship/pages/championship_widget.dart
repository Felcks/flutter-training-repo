import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:flutter/material.dart';

class ChampionshipWidget extends StatelessWidget {
  final Championship item;
  final Function onClicked;

  const ChampionshipWidget({Key key, this.item, this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: RaisedButton(
        onPressed: onClicked,
        padding: EdgeInsets.all(16),
        child: Text(item.getTitle()),
      ),
    );
  }
}

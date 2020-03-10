import 'package:bolao/app/modules/championship/models/game.dart';
import 'package:bolao/app/utils/color_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numberpicker/numberpicker.dart';

class GameCardWidget extends StatelessWidget {
  final Game game;

  const GameCardWidget({Key key, this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      print(game.ownerTeam.score);
      return Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey[300],
            width: 1,
          )),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  game.ownerTeam.imageURL,
                  height: 40.0,
                  width: 40.0,
                ),
                Text(
                  game.ownerTeam.score.toString(),
                  style: TextStyle(
                    color: ColorConfig.accentColor,
                    fontSize: 30,
                  ),
                ),
                // NumberPicker.integer(
                //     initialValue: game.ownerTeam.score,
                //     highlightSelectedValue: true,
                //     scrollDirection: Axis.vertical,
                //     itemExtent: 30,
                //     listViewWidth: 50,
                //     zeroPad: false,
                //     minValue: 0,
                //     maxValue: 10,
                //     onChanged: (newValue) => game.ownerTeam.setScore(newValue)),
                Text(
                  "X",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  game.visitingTeam.score.toString(),
                  style: TextStyle(
                    color: ColorConfig.accentColor,
                    fontSize: 30,
                  ),
                ),
                // NumberPicker.integer(
                //     initialValue: game.visitingTeam.score,
                //     highlightSelectedValue: true,
                //     scrollDirection: Axis.vertical,
                //     listViewWidth: 50,
                //     itemExtent: 30,
                //     minValue: 0,
                //     maxValue: 10,
                //     onChanged: (newValue) => game.visitingTeam.setScore(newValue)),
                Image.asset(
                  game.visitingTeam.imageURL,
                  height: 40.0,
                  width: 40.0,
                ),
              ]));
    });
  }
}

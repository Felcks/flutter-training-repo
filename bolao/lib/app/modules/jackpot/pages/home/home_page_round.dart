import 'package:bolao/app/modules/jackpot/pages/home/game_card_widget.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../jackpot_module.dart';

class JackpotRoundPage extends ModularStatelessWidget<JackpotModule> {
  final HomeController controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.black.withOpacity(0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    if (controller.canDecreaseRound) {
                      controller.decreaseRound();
                    }
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
                Observer(builder: (_) {
                  return FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(1.0)),
                    child: Text(
                      controller.jackpot.championship.getTitle(),
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }),
                IconButton(
                  onPressed: () {
                    if (controller.canIncreaseRound) {
                      controller.increaseRound();
                    }
                  },
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                    itemCount: controller.gameList.length,
                    itemBuilder: (context, index) {
                      return GameCardWidget(
                        game: controller.gameList[index],
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}

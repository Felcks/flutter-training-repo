import 'package:bolao/app/modules/jackpot/pages/home/game_card_widget.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_controller.dart';
import 'package:bolao/app/utils/color_config.dart';
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
                Observer(builder: (_) {
                  return Visibility(
                    visible: controller.canDecreaseRound,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: IconButton(
                      onPressed: () {
                        if (controller.canDecreaseRound) {
                          controller.decreaseRound();
                        }
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                  );
                }),
                Observer(builder: (_) {
                  return FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(1.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.jackpot.championship
                              .getTitle(controller.currentRound),
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        _getRoundButtonWidget(),
                      ],
                    ),
                  );
                }),
                Observer(builder: (_) {
                  return Visibility(
                    visible: controller.canIncreaseRound,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: IconButton(
                      onPressed: () {
                        if (controller.canIncreaseRound) {
                          controller.increaseRound();
                        }
                      },
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.white,
                    ),
                  );
                }),
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

  Widget _getRoundButtonWidget() {
    Color color;
    String text;

    if (controller.currentRound ==
        controller.jackpot.championship.getCurrentRound()) {
      text = "Rodada Atual";
      color = Colors.blue;
    } else if (controller.currentRound <
        controller.jackpot.championship.getCurrentRound()) {
      text = "Rodada Passada";
      color = ColorConfig.accentColor;
    } else {
      text = "Rodada Futura";
      color = Colors.green;
    }

    return SizedBox(
      height: 24,
      child: RaisedButton(
        onPressed: () {},
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color)
        ),
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

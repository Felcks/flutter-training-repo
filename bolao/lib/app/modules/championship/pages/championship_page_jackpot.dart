import 'package:bolao/app/modules/championship/pages/championship_controller.dart';
import 'package:bolao/app/modules/championship/pages/championship_widget.dart';
import 'package:bolao/app/modules/championship/pages/jackpot_widget.dart';
import 'package:bolao/app/modules/jackpot/models/jackpot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChampionshipJackpotPage extends StatefulWidget {
  @override
  _ChampionshipJackpotPageState createState() =>
      _ChampionshipJackpotPageState();
}

class _ChampionshipJackpotPageState
    extends ModularState<ChampionshipJackpotPage, ChampionshipController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.jackpotList.error != null) {
        return Center(
          child: RaisedButton(
            onPressed: () {
              controller.fetchJackpotList();
            },
            child: Text("Error"),
          ),
        );
      }

      if (controller.jackpotList.value == null) {
        return Center(child: CircularProgressIndicator());
      }

      return Container(
        child: Scrollbar(
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: controller.jackpotList.value.length,
            itemBuilder: (BuildContext context, int index) {
              Jackpot item = controller.jackpotList.value[index];
              return Container(
                margin: EdgeInsets.only(bottom: 8),
                child: JackpotWidget(item, () {
                  Modular.to.pushNamed('/jackpot', arguments: item);
                }),
              );
            },
          ),
        ),
      );
    });
  }
}

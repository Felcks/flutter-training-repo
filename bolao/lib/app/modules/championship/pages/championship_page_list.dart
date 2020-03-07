import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:bolao/app/modules/championship/pages/championship_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChampionshipListPage extends StatefulWidget {
  @override
  _ChampionshipListPageState createState() => _ChampionshipListPageState();
}

class _ChampionshipListPageState extends ModularState<ChampionshipListPage, ChampionshipController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
        if (controller.championshipList.error != null) {
          return Center(
            child: RaisedButton(
              onPressed: () {
                controller.fetchChampionshipList();
              },
              child: Text("Error"),
            ),
          );
        }

        if (controller.championshipList.value == null) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.championshipList.value.length,
          itemBuilder: (BuildContext context, int index) {
            Championship championship =
                controller.championshipList.value[index];
            return ListTile(title: Text(championship.name));
          },
        );
      });
  }
}

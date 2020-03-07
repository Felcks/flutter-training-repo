import 'package:bolao/app/modules/championship/pages/championship_page_jackpot.dart';
import 'package:bolao/app/modules/championship/pages/championship_page_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'championship_controller.dart';

class ChampionshipPage extends StatefulWidget {
  final String title;
  const ChampionshipPage({Key key, this.title = "Início"}) : super(key: key);

  @override
  _ChampionshipPageState createState() => _ChampionshipPageState();
}

class _ChampionshipPageState
    extends ModularState<ChampionshipPage, ChampionshipController> {
  List<Widget> screens = [ChampionshipListPage(), ChampionshipJackpotPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Observer(
          builder: (_) {
            return screens[controller.currentPage];
          },
        ),
        bottomNavigationBar: Observer(
          builder: (_) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.black,
              currentIndex: controller.currentPage,
              onTap: (index) {
                controller.setCurrentPage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  title: new Text('Campeonatos'),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.border_all),
                  title: new Text('Bolões'),
                ),
              ],
            );
          },
        ));
  }
}

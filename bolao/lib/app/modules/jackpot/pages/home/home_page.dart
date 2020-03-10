import 'package:bolao/app/modules/jackpot/models/jackpot.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_controller.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_page_bet.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_page_overall_ranking.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_page_ranking.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_page_round.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_page_rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  final Jackpot jackpot;

  const HomePage({Key key, this.jackpot}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  List<Widget> screens = [
    JackpotRankingPage(),
    JackpotRoundPage(),
    JackpotRulesPage(),
    JackpotBetPage()
  ];

  @override
  void initState() {
    controller.setJackpot(widget.jackpot);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.jackpot.name),
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
            backgroundColor: Colors.black,
            currentIndex: controller.currentPage,
            onTap: (index) {
              controller.setCurrentPage(index);
            },
            unselectedItemColor: Colors.white70,
            selectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: new Icon(MdiIcons.trophy),
                title: new Text('Ranking'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(MdiIcons.swordCross),
                title: new Text('Rodada'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(MdiIcons.cardsPlayingOutline),
                title: new Text('Regras'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(MdiIcons.cashMultiple),
                title: new Text('Aposta'),
              ),
            ],
          );
        },
      ),
    );
  }
}

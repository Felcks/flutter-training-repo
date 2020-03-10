import 'package:bolao/app/modules/championship/pages/championship_page_jackpot.dart';
import 'package:bolao/app/modules/championship/pages/championship_page_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'championship_controller.dart';

class ChampionshipPage extends StatefulWidget {
  final String title;
  const ChampionshipPage({Key key, this.title = "Início"}) : super(key: key);

  @override
  _ChampionshipPageState createState() => _ChampionshipPageState();
}

class _ChampionshipPageState
    extends ModularState<ChampionshipPage, ChampionshipController>
    with AutomaticKeepAliveClientMixin<ChampionshipPage> {
  List<Widget> screens = [ChampionshipListPage(), ChampionshipJackpotPage()];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Perfil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
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
                icon: new Icon(MdiIcons.soccerField),
                title: new Text('Campeonatos'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(MdiIcons.soccer),
                title: new Text('Bolões'),
              ),
            ],
          );
        },
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        closeManually: false,
        children: [
          SpeedDialChild(
              child: Icon(Icons.add), label: "Criar bolão", onTap: () {}),
        ],
      ),
    );
  }
}

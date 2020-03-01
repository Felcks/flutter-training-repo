import 'package:bolao_de_computacao/app/model/championship.dart';
import 'package:bolao_de_computacao/app/pages/home/components/game_card_widget.dart';
import 'package:bolao_de_computacao/app/repository/championship_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:numberpicker/numberpicker.dart';

import 'home_controller.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Bolão de Computação"),
      ),
      body: Container(
          padding: EdgeInsets.only(bottom: 92),
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
                          controller.championship.getTitle(),
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
              )
            ],
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Clipboard.setData(ClipboardData(
                  text: controller.currentRound.getAllGamesText()))
              .then((result) {
            final snackBar = SnackBar(
              content: Text('Copiado para a área de transferência'),
            );
            _scaffoldKey.currentState.showSnackBar(snackBar);
          });
        },
        label: Text("Gerar texto Whatsapp"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

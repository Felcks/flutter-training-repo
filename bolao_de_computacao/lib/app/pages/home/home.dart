import 'package:bolao_de_computacao/app/model/championship.dart';
import 'package:bolao_de_computacao/app/pages/home/components/game_card_widget.dart';
import 'package:bolao_de_computacao/app/repository/championship_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Championship brasileirao2020;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    brasileirao2020 = ChampionshipRepository.getBrasileirao2020();
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
                        if (brasileirao2020.currentRound > 0) {
                          setState(() {
                            brasileirao2020.currentRound -= 1;
                          });
                        }
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(1.0)),
                      child: Text(
                        brasileirao2020.getTitle(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (brasileirao2020.currentRound <
                            brasileirao2020.roundAmount - 1) {
                          setState(() {
                            brasileirao2020.currentRound += 1;
                          });
                        }
                      },
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: brasileirao2020
                          .rounds[brasileirao2020.currentRound].games.length,
                      itemBuilder: (context, index) {
                        return GameCardWidget(
                          game: brasileirao2020
                              .rounds[brasileirao2020.currentRound]
                              .games[index],
                        );
                      })),
            ],
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Clipboard.setData(ClipboardData(
                  text: brasileirao2020.rounds[brasileirao2020.currentRound]
                      .getAllGamesText()))
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

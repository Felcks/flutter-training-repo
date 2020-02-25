import 'package:bolao_de_computacao/model/championship.dart';
import 'package:bolao_de_computacao/model/team.dart';
import 'package:bolao_de_computacao/repository/championship_repository.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../model/team_base.dart';

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
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Bolão de Computação"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: ListView.builder(
          itemCount: brasileirao2020.rounds[brasileirao2020.currentRound].games.length,
          itemBuilder: (context, index) {
            return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  brasileirao2020.rounds[brasileirao2020.currentRound].games[index].ownerTeam.imageURL,
                  height: 60.0,
                  width: 60.0,
                ),
                NumberPicker.integer(
                    initialValue:  brasileirao2020.rounds[brasileirao2020.currentRound].games[index].ownerTeam.score,
                    highlightSelectedValue: true,
                    minValue: 0,
                    maxValue: 10,
                    onChanged: (newValue) =>
                        setState(() => brasileirao2020.rounds[brasileirao2020.currentRound].games[index].ownerTeam.score = newValue)),
                Text(
                  "X",
                  style: TextStyle(
                    fontSize: 30
                  ),
                ),
                NumberPicker.integer(
                    initialValue:  brasileirao2020.rounds[brasileirao2020.currentRound].games[index].visitingTeam.score,
                    highlightSelectedValue: true,
                    minValue: 0,
                    maxValue: 10,
                    onChanged: (newValue) =>
                        setState(() => brasileirao2020.rounds[brasileirao2020.currentRound].games[index].visitingTeam.score = newValue)),
                Image.asset(
                  brasileirao2020.rounds[brasileirao2020.currentRound].games[index].visitingTeam.imageURL,
                  height: 60.0,
                  width: 60.0,
                ),
              ]
            );
          },
        ),
//        child: Column(
//          children: <Widget>[
//            Row(
//              children: [
//                Image.asset(
//                  "images/Flamengo.png",
//                  height: 60.0,
//                  width: 60.0,
//                ),
//                NumberPicker.integer(
//                    initialValue: Flamengo.score,
//                    highlightSelectedValue: true,
//                    minValue: 0,
//                    maxValue: 10,
//                    onChanged: (newValue) =>
//                        setState(() => Flamengo.score = newValue)),
//              ]
//            ),
//          ],
//        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            ClipboardManager.copyToClipBoard(brasileirao2020.rounds[brasileirao2020.currentRound].getAllGamesText()).then((result) {
              final snackBar = SnackBar(
                content: Text('Copiado para a área de transferência'),
              );
              _scaffoldKey.currentState.showSnackBar(snackBar);
            });
            //print("${Flamengo.name} ${Flamengo.score}X${Flamengo.score} ${Flamengo.name}");
          },
          label: Text("Gerar texto Whatsapp"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

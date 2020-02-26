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
        padding: EdgeInsets.only(bottom: 92),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.black.withOpacity(0.7),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  FlatButton(
                    onPressed: (){

                    },
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(1.0)),
                    child: Text(
                      brasileirao2020.getTitle(),
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      if(brasileirao2020.currentRound < brasileirao2020.roundAmount-1){
                        setState(() {
                          brasileirao2020.currentRound += 1;
                          print(brasileirao2020.currentRound);
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
                itemCount: brasileirao2020.rounds[brasileirao2020.currentRound].games.length,
                itemBuilder: (context, index) {
                  return  Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[300],
                            width: 1,
                          )
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              brasileirao2020.rounds[brasileirao2020.currentRound].games[index].ownerTeam.imageURL,
                              height: 40.0,
                              width: 40.0,
                            ),
                            NumberPicker.integer(
                                initialValue:  brasileirao2020.rounds[brasileirao2020.currentRound].games[index].ownerTeam.score,
                                highlightSelectedValue: true,
                                scrollDirection: Axis.vertical,
                                itemExtent: 30,
                                listViewWidth: 50,
                                zeroPad: false,
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
                                scrollDirection: Axis.vertical,
                                listViewWidth: 50,
                                itemExtent: 30,
                                minValue: 0,
                                maxValue: 10,
                                onChanged: (newValue) =>
                                    setState(() => brasileirao2020.rounds[brasileirao2020.currentRound].games[index].visitingTeam.score = newValue)),
                            Image.asset(
                              brasileirao2020.rounds[brasileirao2020.currentRound].games[index].visitingTeam.imageURL,
                              height: 40.0,
                              width: 40.0,
                            ),
                          ]
                      )
                  );
                },
              ),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            ClipboardManager.copyToClipBoard(brasileirao2020.rounds[brasileirao2020.currentRound].getAllGamesText()).then((result) {
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

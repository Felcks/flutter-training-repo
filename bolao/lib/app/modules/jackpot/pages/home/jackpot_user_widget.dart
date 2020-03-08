import 'package:bolao/app/modules/jackpot/models/jackpot_user.dart';
import 'package:flutter/material.dart';

class JackpotUserWidget extends StatelessWidget {
  final JackpotUser jackpotUser;

  JackpotUserWidget(this.jackpotUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[300],
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.white,
        child: Container(
          height: 80,
          width: 320,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Image.network(
                        "https://br.1xbet.com/games/twentyone/assets/app/avatar.jpg",
                        height: 200,
                        width: 80,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32),
                        child: Text(
                          jackpotUser.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Spacer(
                        flex: 25,
                      ),
                      Text(
                        "+${jackpotUser.roundScore.toString()}",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 40,
                        child: Text(
                          jackpotUser.score.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Spacer(),
                      _getArrowIcon(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getArrowIcon() {
    if (jackpotUser.ranking < jackpotUser.rankingsWithoutRoundPoints)
      return Icon(
        Icons.arrow_drop_up,
        color: Colors.green,
      );
    else if (jackpotUser.ranking > jackpotUser.rankingsWithoutRoundPoints)
      return Icon(
        Icons.arrow_drop_down,
        color: Colors.red,
      );
    else
      return Icon(
        Icons.remove,
        color: Colors.blue,
      );
  }
}

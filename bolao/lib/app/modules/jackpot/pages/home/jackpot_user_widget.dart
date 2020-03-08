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
            ],
          ),
        ),
      ),
    );
  }
}

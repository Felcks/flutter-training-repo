import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:flutter/material.dart';

class ChampionshipWidget extends StatelessWidget {
  final Championship item;
  final Function onClicked;

  const ChampionshipWidget({Key key, this.item, this.onClicked})
      : super(key: key);

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
                      item.imageURL,
                      height: 200,
                      width: 80,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Text(
                        item.getTitle(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )),
              Positioned.fill(
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: Colors.grey[350].withOpacity(0.2),
                        splashColor: Colors.grey[350].withOpacity(0.2),
                        onTap: onClicked,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

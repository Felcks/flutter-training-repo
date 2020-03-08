import 'package:bolao/app/modules/jackpot/models/jackpot.dart';
import 'package:flutter/material.dart';

class JackpotWidget extends StatelessWidget {
  final Jackpot item;
  final Function onClicked;

  JackpotWidget(this.item, this.onClicked);

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
                      "https://image.shutterstock.com/image-vector/soccer-ball-icon-flat-vector-260nw-431260006.jpg",
                      height: 200,
                      width: 80,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Text(
                        item.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
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

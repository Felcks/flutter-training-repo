import 'package:bolao_de_computacao/app/model/round.dart';

class Championship{

  String name;
  int currentRound;
  int roundAmount;
  List<Round> rounds;

  Championship(this.name, this.currentRound, this.roundAmount, this.rounds);

  String getTitle(){
    return "$name - ${this.rounds[currentRound].getTitle()}";
  }
}
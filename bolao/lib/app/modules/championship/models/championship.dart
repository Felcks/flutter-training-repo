import 'package:bolao/app/modules/championship/models/round.dart';
import 'package:mobx/mobx.dart';
part 'championship.g.dart';

class Championship = _ChampionshipBase with _$Championship;

abstract class _ChampionshipBase with Store {
  @observable
  String name;

  @observable
  int currentRound;

  @observable
  int roundAmount;

  @observable
  List<Round> rounds;

  _ChampionshipBase(
      this.name, this.currentRound, this.roundAmount, this.rounds);

  String getTitle() {
    return "$name - ${this.rounds[currentRound].getTitle()}";
  }
}

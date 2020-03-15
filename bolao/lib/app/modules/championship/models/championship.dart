import 'package:bolao/app/modules/championship/models/round.dart';
import 'package:mobx/mobx.dart';
part 'championship.g.dart';

class Championship = _ChampionshipBase with _$Championship;

abstract class _ChampionshipBase with Store {

  @observable
  String name;

  int _currentRound;

  @observable
  int roundAmount;

  @observable
  List<Round> rounds;

  _ChampionshipBase(
      this.name, this._currentRound, this.roundAmount, this.rounds);

  String getTitle(int round) {
    return "$name - ${this.rounds[round].getTitle()}";
  }
  
  int getCurrentRound() => this._currentRound;
}

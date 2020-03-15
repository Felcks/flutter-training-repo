import 'package:bolao/app/modules/championship/api_models/championship_response.dart';
import 'package:bolao/app/modules/championship/models/round.dart';
import 'package:mobx/mobx.dart';
part 'championship.g.dart';

class Championship = _ChampionshipBase with _$Championship;

abstract class _ChampionshipBase with Store {
  @observable
  String name;

  String season;

  int _currentRound;

  int type;

  String imageURL;

  @observable
  List<Round> rounds;

  _ChampionshipBase(this.name, this.season, this._currentRound, this.type,
      this.imageURL, this.rounds);

  String getTitle() {
    return "$name - $season";
  }

  String getRoundTitle(int round){
    return "$name - ${this.rounds[round].getTitle()}";
  }

  int getCurrentRound() => this._currentRound;
}

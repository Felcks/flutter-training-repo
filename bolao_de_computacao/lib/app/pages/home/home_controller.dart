import 'package:bolao_de_computacao/app/model/championship.dart';
import 'package:bolao_de_computacao/app/model/game.dart';
import 'package:bolao_de_computacao/app/model/round.dart';
import 'package:bolao_de_computacao/app/repository/championship_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<Game> gameList = [].cast<Game>().asObservable();

  @observable
  Championship championship;

  _HomeControllerBase(){
    championship = ChampionshipRepository.getBrasileirao2020();
    gameList = championship.rounds[championship.currentRound].games.asObservable();
  }

  @action
  increaseRound(){
    championship.currentRound += 1;
    gameList = championship.rounds[championship.currentRound].games.asObservable();
    print(gameList[0].ownerTeam.score);
  }

  @action
  decreaseRound(){
    championship.currentRound -= 1;
    gameList = championship.rounds[championship.currentRound].games.asObservable();
    print(gameList[0].ownerTeam.score);
  }

  @computed
  bool get canDecreaseRound => (championship.currentRound > 0);

  @computed
  bool get canIncreaseRound => (championship.currentRound+1 < championship.roundAmount);

  @computed
  Round get currentRound => championship.rounds[championship.currentRound]; 
}

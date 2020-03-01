import 'package:bolao_de_computacao/app/model/championship.dart';
import 'package:bolao_de_computacao/app/model/game.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  List<Game> gameList = [];

  Championship championship;

  @action
  changeRound(int newRound){
    championship.currentRound = newRound;
    gameList = championship.rounds[championship.currentRound].games;
  }

  @action
  changeResultOwnerTeam(int newValue){
    
  }
}

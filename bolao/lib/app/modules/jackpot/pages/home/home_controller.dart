import 'package:bolao/app/modules/championship/models/game.dart';
import 'package:bolao/app/modules/championship/models/round.dart';
import 'package:bolao/app/modules/jackpot/models/jackpot.dart';
import 'package:bolao/app/modules/jackpot/models/jackpot_user.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  Jackpot jackpot;

  @observable
  int currentPage = 0;

  @observable
  int currentRound = 0;

  @observable
  ObservableList<Game> gameList = [].cast<Game>().asObservable();

  @action
  setJackpot(Jackpot jackpot) {
    this.jackpot = jackpot;
    this.gameList = jackpot
        .championship.rounds[jackpot.championship.getCurrentRound()].games
        .asObservable();
    this.currentRound = jackpot.championship.getCurrentRound();
  }

  @action
  setCurrentPage(int page) {
    this.currentPage = page;
  }

  @action
  List<JackpotUser> getUsersByRoundRank() {
    var list = jackpot.users.toList();
    list.sort((a, b) => b.roundScore - a.roundScore);
    return list;
  }

  @action
  List<JackpotUser> getUsersByOverallRank() {
    var list = jackpot.users.toList();
    list.sort((a, b) => b.score - a.score);
    return list;
  }

  @action
  void rankingUsersWithouRoundScore(JackpotUser user) {
    var list = jackpot.users.map((JackpotUser it) {
      it.score = it.score - it.roundScore;
      return user;
    });

    for (var count = 1; count <= list.length; count++) {
      if (list.elementAt(count - 1).name == user.name) {
        user.rankingsWithoutRoundPoints = count;
      }
    }
  }

  @action
  increaseRound() {
    this.currentRound += 1;
    gameList = jackpot
        .championship.rounds[this.currentRound].games
        .asObservable();
  }

  @action
  decreaseRound() {
    this.currentRound -= 1;
    gameList = jackpot
        .championship.rounds[this.currentRound].games
        .asObservable();
  }

  @computed
  bool get canDecreaseRound => (this.currentRound > 0);

  @computed
  bool get canIncreaseRound => (this.currentRound + 1 <
      jackpot.championship.roundAmount);

  @computed
  Round get round =>
      jackpot.championship.rounds[this.currentRound];
}

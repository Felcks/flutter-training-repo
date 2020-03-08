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

  @action
  setJackpot(Jackpot jackpot) {
    this.jackpot = jackpot;
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
  List<JackpotUser> getUsersByOverallRank(){
    var list = jackpot.users.toList();
    list.sort((a, b) => b.score - a.score);
    return list;
  }
}

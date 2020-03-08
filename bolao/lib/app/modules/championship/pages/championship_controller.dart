import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:bolao/app/modules/championship/repositories/championship_repository.dart';
import 'package:bolao/app/modules/jackpot/models/jackpot.dart';
import 'package:bolao/app/modules/jackpot/repositories/jackpot_repository.dart';
import 'package:mobx/mobx.dart';

part 'championship_controller.g.dart';

class ChampionshipController = _ChampionshipControllerBase
    with _$ChampionshipController;

abstract class _ChampionshipControllerBase with Store {

  @observable
  int currentPage = 0;

  @observable
  ObservableFuture<List<Championship>> championshipList;
  ObservableFuture<List<Jackpot>> jackpotList;

  ChampionshipRepository championshipRepo;
  JackpotRepository jackpotRepo;

  _ChampionshipControllerBase(this.championshipRepo, this.jackpotRepo) {
    fetchChampionshipList();
    fetchJackpotList();
  }

  @action
  fetchChampionshipList() {
    this.championshipList = championshipRepo.getChampionships().asObservable();
  }

  @action
  fetchJackpotList() {
    this.jackpotList = jackpotRepo.getJackpots().asObservable();
  }

  @action
  setCurrentPage(int newPage){
    this.currentPage = newPage;
  }
}

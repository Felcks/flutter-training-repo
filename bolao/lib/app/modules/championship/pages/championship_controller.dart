import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:bolao/app/modules/championship/models/jackpot.dart';
import 'package:bolao/app/modules/championship/repositories/championship_repo.dart';
import 'package:bolao/app/modules/championship/repositories/jackpot_repo.dart';
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

  ChampionshipRepo championshipRepo;
  JackpotRepo jackpotRepo;

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

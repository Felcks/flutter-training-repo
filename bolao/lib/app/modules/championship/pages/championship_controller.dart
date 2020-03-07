import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:bolao/app/modules/championship/repositories/championship_repo.dart';
import 'package:mobx/mobx.dart';

part 'championship_controller.g.dart';

class ChampionshipController = _ChampionshipControllerBase
    with _$ChampionshipController;

abstract class _ChampionshipControllerBase with Store {

  @observable
  int currentPage = 0;

  @observable
  ObservableFuture<List<Championship>> championshipList;

  ChampionshipRepo championshipRepo;

  _ChampionshipControllerBase(this.championshipRepo) {
    fetchChampionshipList();
  }

  @action
  fetchChampionshipList() {
    this.championshipList = championshipRepo.getChampionships().asObservable();
  }

  @action
  setCurrentPage(int newPage){
    this.currentPage = newPage;
  }
}

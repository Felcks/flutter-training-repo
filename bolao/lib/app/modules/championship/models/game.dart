import 'package:bolao/app/modules/championship/models/team.dart';
import 'package:bolao/app/modules/championship/models/team_base.dart';
import 'package:mobx/mobx.dart';

part 'game.g.dart';

class Game = _GameBase with _$Game;

abstract class _GameBase with Store {
  @observable
  Team ownerTeam;

  @observable
  Team visitingTeam;

  String championshipID;

  int roundNumber;

  _GameBase(TeamBase ownerTeam, TeamBase visitingTeam, this.championshipID, this.roundNumber) {
    this.ownerTeam = Team(ownerTeam.name, ownerTeam.imageURL, 0);
    this.visitingTeam = Team(visitingTeam.name, visitingTeam.imageURL, 0);
  }

  _GameBase.withScore(Team ownerTeam, Team visitingTeam, this.championshipID, this.roundNumber) {
    this.ownerTeam = ownerTeam;
    this.visitingTeam = visitingTeam;
  }

  String getScoreboard() {
    return "${ownerTeam.name}\t${ownerTeam.score}\t${visitingTeam.score}\t${visitingTeam.name}";
  }
}

import 'package:bolao_de_computacao/app/model/team.dart';
import 'package:bolao_de_computacao/app/model/team_base.dart';

import 'package:mobx/mobx.dart';
part 'game.g.dart';

class Game = _GameBase with _$Game;

abstract class _GameBase with Store {

  @observable
  Team ownerTeam;

  @observable
  Team visitingTeam;

  _GameBase(TeamBase ownerTeam, TeamBase visitingTeam) {
    this.ownerTeam = Team(ownerTeam.name, ownerTeam.imageURL, 0);
    this.visitingTeam = Team(visitingTeam.name, visitingTeam.imageURL, 0);
  }

  String getScoreboard() {
    return "${ownerTeam.name}\t${ownerTeam.score}\t${visitingTeam.score}\t${visitingTeam.name}";
  }
}

import 'package:bolao_de_computacao/model/championship.dart';
import 'package:bolao_de_computacao/model/game.dart';
import 'package:bolao_de_computacao/model/round.dart';
import 'package:bolao_de_computacao/repository/team_base_repository.dart';

class ChampionshipRepository{

  static Championship getBrasileirao2020(){

    Game game1 = Game(TeamBaseRepository.flamengo, TeamBaseRepository.bragantino);
    Game game2 = Game(TeamBaseRepository.bragantino, TeamBaseRepository.flamengo);
    Round round = Round(0, [game1, game2]);

    Championship championship = Championship(0, 1, [round]);

    return championship;
  }

}
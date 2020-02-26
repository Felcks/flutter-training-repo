import 'package:bolao_de_computacao/model/championship.dart';
import 'package:bolao_de_computacao/model/game.dart';
import 'package:bolao_de_computacao/model/round.dart';
import 'package:bolao_de_computacao/repository/team_base_repository.dart';

class ChampionshipRepository{

  static Championship getBrasileirao2020(){

    Round round = Round(0, [
        Game(TeamBaseRepository.corinthians, TeamBaseRepository.ceara),
        Game(TeamBaseRepository.botafogo, TeamBaseRepository.coritiba),
        Game(TeamBaseRepository.palmeiras, TeamBaseRepository.fluminense),
        Game(TeamBaseRepository.goias, TeamBaseRepository.gremio),
        Game(TeamBaseRepository.vasco, TeamBaseRepository.saoPaulo),
        Game(TeamBaseRepository.fortaleza, TeamBaseRepository.flamengo),
        Game(TeamBaseRepository.bragantino, TeamBaseRepository.atleticoMG),
        Game(TeamBaseRepository.athleticoPR, TeamBaseRepository.atleticoGO),
        Game(TeamBaseRepository.sport, TeamBaseRepository.santos),
        Game(TeamBaseRepository.internacional, TeamBaseRepository.bahia),

    ]);

    Championship championship = Championship("Brasileirão", 0, 2, [round, round]);

    return championship;
  }

}
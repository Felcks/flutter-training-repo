import 'package:bolao_de_computacao/model/championship.dart';
import 'package:bolao_de_computacao/model/game.dart';
import 'package:bolao_de_computacao/model/round.dart';
import 'package:bolao_de_computacao/repository/team_base_repository.dart';

class ChampionshipRepository{

  static Championship getBrasileirao2020(){

    Round round = Round(0, [
        Game(TeamBaseRepository.flamengo, TeamBaseRepository.atleticoMG),
        Game(TeamBaseRepository.botafogo, TeamBaseRepository.bahia),
        Game(TeamBaseRepository.goias, TeamBaseRepository.saoPaulo),
        Game(TeamBaseRepository.fortaleza, TeamBaseRepository.athleticoPR),
        Game(TeamBaseRepository.coritiba, TeamBaseRepository.internacional),
        Game(TeamBaseRepository.sport, TeamBaseRepository.ceara),
        Game(TeamBaseRepository.gremio, TeamBaseRepository.fluminense),
        Game(TeamBaseRepository.corinthians, TeamBaseRepository.atleticoGO),
        Game(TeamBaseRepository.santos, TeamBaseRepository.bragantino),
        Game(TeamBaseRepository.palmeiras, TeamBaseRepository.vasco),

    ]);

    Round round2 = Round(1, [
        Game(TeamBaseRepository.saoPaulo, TeamBaseRepository.fortaleza),
        Game(TeamBaseRepository.atleticoGO, TeamBaseRepository.flamengo),
        Game(TeamBaseRepository.ceara, TeamBaseRepository.gremio),
        Game(TeamBaseRepository.athleticoPR, TeamBaseRepository.goias),
        Game(TeamBaseRepository.bahia, TeamBaseRepository.coritiba),
        Game(TeamBaseRepository.internacional, TeamBaseRepository.santos),
        Game(TeamBaseRepository.atleticoMG, TeamBaseRepository.corinthians),
        Game(TeamBaseRepository.bragantino, TeamBaseRepository.botafogo),
        Game(TeamBaseRepository.vasco, TeamBaseRepository.sport),
        Game(TeamBaseRepository.fluminense, TeamBaseRepository.palmeiras),

    ]);


    Championship championship = Championship("Brasileirão", 0, 2, [round, round2]);

    return championship;
  }

}
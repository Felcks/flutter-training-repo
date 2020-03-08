import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:bolao/app/modules/championship/models/game.dart';
import 'package:bolao/app/modules/championship/models/round.dart';
import 'package:bolao/app/modules/championship/repositories/team_base_repository.dart';
import 'package:dio/dio.dart';

class ChampionshipRepository {
  final Dio dio;

  ChampionshipRepository(this.dio);

  List<Championship> championships;

  Future<List<Championship>> getChampionships() async {
    if (championships == null) {
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

      Championship championship =
          Championship("Brasileirão", 0, 2, [round, round2]);
      championships = [championship];
    }
    return championships;
  }
}

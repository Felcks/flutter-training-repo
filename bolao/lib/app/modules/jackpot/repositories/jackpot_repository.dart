import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:bolao/app/modules/championship/models/game.dart';
import 'package:bolao/app/modules/championship/models/round.dart';
import 'package:bolao/app/modules/championship/models/team.dart';
import 'package:bolao/app/modules/championship/repositories/team_base_repository.dart';
import 'package:bolao/app/modules/jackpot/models/bet.dart';
import 'package:bolao/app/modules/jackpot/models/jackpot.dart';
import 'package:bolao/app/modules/jackpot/models/jackpot_user.dart';

class JackpotRepository {
  Future<List<Jackpot>> getJackpots() async {

    JackpotUser user1 = JackpotUser(name: "Matheus", score: 50, roundScore: 10, ranking: 2, rankingsWithoutRoundPoints: 1);
    JackpotUser user2 = JackpotUser(name: "Lucas", score: 100, roundScore: 90, ranking: 1, rankingsWithoutRoundPoints: 3);
    JackpotUser user3 = JackpotUser(name: "Marquito", score: 25, roundScore: 15, ranking: 3, rankingsWithoutRoundPoints: 2);
    JackpotUser user4 = JackpotUser(name: "Luis", score: 0, roundScore: 5, ranking: 4, rankingsWithoutRoundPoints: 4);

    Round round = Round(0, [
        Game.withScore(Team.fromTeam(TeamBaseRepository.flamengo, 3), Team.fromTeam(TeamBaseRepository.atleticoMG, 1), "", 0),
        // Game(TeamBaseRepository.botafogo, TeamBaseRepository.bahia),
        // Game(TeamBaseRepository.goias, TeamBaseRepository.saoPaulo),
        // Game(TeamBaseRepository.fortaleza, TeamBaseRepository.athleticoPR),
        // Game(TeamBaseRepository.coritiba, TeamBaseRepository.internacional),
        // Game(TeamBaseRepository.sport, TeamBaseRepository.ceara),
        // Game(TeamBaseRepository.gremio, TeamBaseRepository.fluminense),
        // Game(TeamBaseRepository.corinthians, TeamBaseRepository.atleticoGO),
        // Game(TeamBaseRepository.santos, TeamBaseRepository.bragantino),
        // Game(TeamBaseRepository.palmeiras, TeamBaseRepository.vasco),
      ]);

      Round round2 = Round(1, [
        Game(TeamBaseRepository.saoPaulo, TeamBaseRepository.fortaleza, "", 0),
        // Game(TeamBaseRepository.atleticoGO, TeamBaseRepository.flamengo),
        // Game(TeamBaseRepository.ceara, TeamBaseRepository.gremio),
        // Game(TeamBaseRepository.athleticoPR, TeamBaseRepository.goias),
        // Game(TeamBaseRepository.bahia, TeamBaseRepository.coritiba),
        // Game(TeamBaseRepository.internacional, TeamBaseRepository.santos),
        // Game(TeamBaseRepository.atleticoMG, TeamBaseRepository.corinthians),
        // Game(TeamBaseRepository.bragantino, TeamBaseRepository.botafogo),
        // Game(TeamBaseRepository.vasco, TeamBaseRepository.sport),
        // Game(TeamBaseRepository.fluminense, TeamBaseRepository.palmeiras),
      ]);

     Championship championship =
          Championship("Brasileirão", "2020",  0, 0, "", [round, round2]);

    Bet rule1 = Bet(50, BetType.brl);
    Bet rule2 = Bet(10, BetType.game_coin);


    return [
      Jackpot("Bolão da lemobs", championship, rule1, [user1, user2, user3, user4]),
      Jackpot("Bolão da faculdade", championship, rule2, [user1, user2, user3, user4]),
    ];
  }
}

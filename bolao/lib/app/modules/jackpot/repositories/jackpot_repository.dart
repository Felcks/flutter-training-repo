import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:bolao/app/modules/jackpot/models/bet.dart';
import 'package:bolao/app/modules/jackpot/models/jackpot.dart';
import 'package:bolao/app/modules/jackpot/models/jackpot_user.dart';

class JackpotRepository {
  Future<List<Jackpot>> getJackpots() async {

    JackpotUser user1 = JackpotUser(name: "Matheus", score: 50, roundScore: 10, ranking: 2, rankingsWithoutRoundPoints: 1);
    JackpotUser user2 = JackpotUser(name: "Lucas", score: 100, roundScore: 90, ranking: 1, rankingsWithoutRoundPoints: 3);
    JackpotUser user3 = JackpotUser(name: "Marquito", score: 25, roundScore: 15, ranking: 3, rankingsWithoutRoundPoints: 2);
    JackpotUser user4 = JackpotUser(name: "Luis", score: 0, roundScore: 5, ranking: 4, rankingsWithoutRoundPoints: 4);

    Championship championship1 = Championship("Brasileirão");
    Championship championship2 = Championship("Copa do Brasil");

    Bet rule1 = Bet(50, BetType.brl);
    Bet rule2 = Bet(10, BetType.game_coin);


    return [
      Jackpot("Bolão da lemobs", championship1, rule1, [user1, user2, user3, user4]),
      Jackpot("Bolão da faculdade", championship2, rule2, [user1, user2, user3, user4]),
    ];
  }
}

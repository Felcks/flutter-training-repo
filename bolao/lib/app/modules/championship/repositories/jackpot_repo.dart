import 'package:bolao/app/modules/championship/models/jackpot.dart';

class JackpotRepo {
  Future<List<Jackpot>> getJackpots() async {
    return [
      Jackpot("Bolão da lemobs"),
      Jackpot("Bolão da faculdade"),
    ];
  }
}

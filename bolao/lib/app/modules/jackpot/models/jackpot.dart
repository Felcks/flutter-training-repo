import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:bolao/app/modules/jackpot/models/bet.dart';
import 'package:bolao/app/modules/jackpot/models/jackpot_user.dart';

class Jackpot{
  
  String name;
  Championship championship;
  Bet bet;
  List<JackpotUser> users;

  Jackpot(this.name, this.championship, this.bet, this.users);
}
import 'package:bolao/app/modules/jackpot/jackpot_module.dart';
import 'package:bolao/app/modules/jackpot/models/bet.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class JackpotBetPage extends ModularStatelessWidget<JackpotModule> {
  final HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    Bet bet = controller.jackpot.bet;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            bet.value.toString(),
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}

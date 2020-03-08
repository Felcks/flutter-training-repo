import 'package:bolao/app/modules/jackpot/jackpot_module.dart';
import 'package:bolao/app/modules/jackpot/models/jackpot_user.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_controller.dart';
import 'package:bolao/app/modules/jackpot/pages/home/jackpot_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class JackpotOverallRanking extends ModularStatelessWidget<JackpotModule> {
  final HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: controller.getUsersByOverallRank().length,
        itemBuilder: (BuildContext context, int index) {
          JackpotUser user = controller.getUsersByOverallRank()[index];
          return JackpotUserWidget(user);
        },
      ),
    );
  }
}

import 'package:bolao/app/app_controller.dart';
import 'package:bolao/app/modules/championship/championship_module.dart';
import 'package:bolao/app/modules/jackpot/jackpot_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:bolao/app/app_widget.dart';
import 'package:bolao/app/modules/home/home_module.dart';

import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/login', module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/championship', module: ChampionshipModule()),
        Router('/jackpot', module: JackpotModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}


import 'package:bolao/app/modules/championship/pages/championship_controller.dart';
import 'package:bolao/app/modules/championship/pages/championship_page.dart';
import 'package:bolao/app/modules/championship/repositories/championship_repository.dart';
import 'package:bolao/app/modules/jackpot/repositories/jackpot_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChampionshipModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => ChampionshipRepository(i.get<Dio>())),
        Bind((i) => JackpotRepository()),
        Bind((i) => ChampionshipController(i.get<ChampionshipRepository>(), i.get<JackpotRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ChampionshipPage()),
      ];

  static Inject get to => Inject<ChampionshipModule>.of();
}

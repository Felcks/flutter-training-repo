
import 'package:bolao/app/modules/championship/pages/championship_controller.dart';
import 'package:bolao/app/modules/championship/pages/championship_page.dart';
import 'package:bolao/app/modules/championship/repositories/championship_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChampionshipModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => ChampionshipRepo(i.get<Dio>())),
        Bind((i) => ChampionshipController(i.get<ChampionshipRepo>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ChampionshipPage()),
      ];

  static Inject get to => Inject<ChampionshipModule>.of();
}

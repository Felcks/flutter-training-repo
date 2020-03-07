import 'package:bolao/app/modules/jackpot/pages/create/create_controller.dart';
import 'package:bolao/app/modules/jackpot/pages/create/create_page.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_controller.dart';
import 'package:bolao/app/modules/jackpot/pages/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/invite/invite_page.dart';

class JackpotModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => CreateController()),
      ];

  @override
  List<Router> get routers => [
      Router(Modular.initialRoute, child: (_, args) => HomePage(jackpot: args.data)),
      Router('/create', child: (_, args) => CreatePage()),
      Router('/invite', child: (_, args) => InvitePage()),
  ];

  static Inject get to => Inject<JackpotModule>.of();
}

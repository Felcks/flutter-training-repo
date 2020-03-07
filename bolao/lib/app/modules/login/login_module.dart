import 'package:bolao/app/modules/login/pages/login/login_controller.dart';
import 'package:bolao/app/modules/login/pages/login/login_page.dart';
import 'package:bolao/app/modules/login/pages/register/register_controller.dart';
import 'package:bolao/app/modules/login/pages/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
        Router('/register', child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}

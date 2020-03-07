import 'package:bolao/app/modules/login/models/client.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateEmailOrName() == null && validatePassword() == null;
  }

  String validateEmailOrName() {
    if (client.emailOrName == null || client.emailOrName.isEmpty) {
      return "Digite o email ou o apelido";
    } else if (client.emailOrName.length < 3) {
      return "Campo precisa de 3 characteres";
    }

    return null;
  }

  String validatePassword() {
    if (client.password == null || client.password.isEmpty) {
      return "Digite a senha";
    } else if (client.password.length < 6) {
      return "Campo precisa de 6 characteres";
    }

    return null;
  }
}

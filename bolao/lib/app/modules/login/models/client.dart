import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {

  @observable
  String emailOrName;
  @action
  changeEmailOrName(String value) => this.emailOrName = value;

  @observable
  String password;
  @action
  changePassword(String value) => this.password = value;

}
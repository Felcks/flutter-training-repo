import 'package:mobx/mobx.dart';

part 'ControllerBase.g.dart';

class Controller2 = ControllerBase with _$Controller2;

abstract class ControllerBase with Store{

  @observable
  int counter = 0;

  @action
  increment() {
    counter++;
  }
}
import 'package:mobx/mobx.dart';

part 'invite_controller.g.dart';

class InviteController = _InviteControllerBase with _$InviteController;

abstract class _InviteControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

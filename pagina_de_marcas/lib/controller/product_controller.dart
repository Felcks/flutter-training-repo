import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store{

  @observable
  int productAmount = 0;

  @action
  setProductAmount(int value) {
    productAmount = value;
  }
}
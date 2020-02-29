import 'package:mobx/mobx.dart';
import 'package:slidy/app/models/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  @observable
  ObservableList<ItemModel> listItem = [
    ItemModel(title: "Item 1", check: false),
    ItemModel(title: "Item 2", check: false),
    ItemModel(title: "Item 3", check: false),
    ItemModel(title: "Item 4", check: false),
  ].asObservable();

  @computed
  int get totalChecked => listItem.where((item) => item.check).length;

  @action
  addItem(ItemModel model){
    listItem.add(model);
  }

  @action
  removeItem(ItemModel model){
    listItem.removeWhere((item) => item.title == model.title);
  }
}
    
    
    
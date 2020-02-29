import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:slidy/app/models/item_model.dart';
import 'package:slidy/app/pages/home/components/item_widget.dart';
import 'package:slidy/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();

  _dialog() {
    var model = ItemModel(check: false);

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Adicionar item"),
            content: TextField(
              onChanged: model.setTitle,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Novo item"),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  controller.addItem(model);
                  Navigator.pop(context);
                },
                child: Text("Salvar"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: "Pesquisa..."),
        ),
        actions: <Widget>[
          IconButton(
            icon: Observer(builder: (_) {
              return Text("${controller.totalChecked}");
            }),
            onPressed: () {},
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
              itemCount: controller.listItem.length,
              itemBuilder: (_, index) {
                ItemModel item = controller.listItem[index];
                return ItemWidget(
                  item: item,
                  removeClicked: () {
                    controller.removeItem(item);
                  },
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _dialog,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formulario/body.dart';
import 'package:formulario/controller.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Scaffold(
      appBar: AppBar(title: Observer(builder: (_) {
        return Text(controller.isValid
            ? "Formulário Validado"
            : "Formulário não validado");
      })),
      body: BodyWidget(),
    );
  }
}

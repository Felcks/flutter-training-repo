import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Tela Cliente"),
      ),
    );
  }
}

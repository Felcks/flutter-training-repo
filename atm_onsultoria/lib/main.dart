import 'package:atm_onsultoria/TelaCliente.dart';
import 'package:atm_onsultoria/TelaContato.dart';
import 'package:atm_onsultoria/TelaEmpresa.dart';
import 'package:atm_onsultoria/TelaServico.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: "ATM Consultoria",
    home: Home(),
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum ServiceType{
  EMPRESA,
  SERVICOS,
  CLIENTES,
  CONTATO
}

class _HomeState extends State<Home> {

  void _abrir(ServiceType serviceType){
    switch(serviceType) {
      case ServiceType.EMPRESA:
      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaEmpresa()));
        break;
      case ServiceType.SERVICOS:
        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaServico()));
        break;
      case ServiceType.CLIENTES:
        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCliente()));
        break;
      case ServiceType.CONTATO:
        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaContato()));
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/logo.png"),
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () { _abrir(ServiceType.EMPRESA); },
                        child: Image.asset("images/menu_empresa.png"),
                      ),
                      GestureDetector(
                          onTap: () { _abrir(ServiceType.SERVICOS); },
                          child: Image.asset("images/menu_servico.png")
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () { _abrir(ServiceType.CLIENTES); },
                        child: Image.asset("images/menu_cliente.png"),
                      ),
                      GestureDetector(
                        onTap: () { _abrir(ServiceType.CONTATO); },
                        child: Image.asset("images/menu_contato.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      )
    );
  }
}



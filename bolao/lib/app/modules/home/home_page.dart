import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(
              flex: 20,
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                color: Colors.blue,
              )),
              padding: EdgeInsets.all(16),
              child: Text("ENTRAR COM FACEBOOK"),
            ),
            Spacer(
              flex: 1,
            ),
            RaisedButton(
              onPressed: () {
                Modular.to.pushNamed('/login/register');
              },
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                color: Colors.orange,
              )),
              padding: EdgeInsets.all(16),
              child: Text(
                "CADASTRAR COM EMAIL",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(),
            RaisedButton(
              onPressed: () {
                Modular.to.pushNamed('/login');
              },
              padding: EdgeInsets.all(16),
              child: Text("FAZER LOGIN"),
            ),
            Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    ));
  }
}

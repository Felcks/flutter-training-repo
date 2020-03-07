import 'package:bolao/app/utils/color_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  Modular.to.pushReplacementNamed('/home');
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  _textField({String labelText, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.blue, style: BorderStyle.solid),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.blue, style: BorderStyle.solid),
          ),
          labelText: labelText,
          errorText: errorText == null ? null : errorText(),
          errorStyle: TextStyle(color: Colors.grey),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey, style: BorderStyle.solid)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey, style: BorderStyle.solid))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Bolão da Capivara",
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(height: 100),
                Observer(builder: (_) {
                  return _textField(
                      labelText: "Apelido ou Email",
                      onChanged: (value) {
                        controller.client.changeEmailOrName(value);
                      },
                      errorText: controller.validateEmailOrName);
                }),
                SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return _textField(
                      labelText: "Senha",
                      onChanged: (value) {
                        controller.client.changePassword(value);
                      },
                      errorText: controller.validatePassword);
                }),
                SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return RaisedButton(
                    onPressed: controller.isValid ? () {
                      Modular.to.pushReplacementNamed("/championship");
                    } : null,
                    disabledColor: Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Text(
                      "Entrar",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  );
                }),
                SizedBox(
                  height: 100,
                ),
                RaisedButton(
                  onPressed: () {
                    Modular.to.pushNamed('/login/register');
                  },
                  disabledColor: Colors.grey,
                  color: ColorConfig.darkPrimaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

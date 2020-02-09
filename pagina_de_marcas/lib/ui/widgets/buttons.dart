import 'package:flutter/material.dart';

class Buttons{

  static RaisedButton filled({Null Function() onPressed, Text child, EdgeInsets padding}){
    return RaisedButton(
      onPressed: onPressed,
      child: child,
      padding: padding,
    );
  }
  static RaisedButton nonFilled({Null Function() onPressed, Text child, EdgeInsets padding, BuildContext context}){
    return RaisedButton(
      onPressed: onPressed,
      child: child,
      padding: padding,
      color: Colors.white,
      highlightColor:  Theme.of(context).accentColor,
      splashColor:  Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
          side: BorderSide(color: Theme.of(context).primaryColor)
      )
    );
  }

}
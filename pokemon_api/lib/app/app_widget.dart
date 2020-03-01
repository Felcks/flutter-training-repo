import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        appBarTheme: AppBarTheme(
          color: Colors.orange,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )
          )
        )
      ),
      initialRoute: "/",
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

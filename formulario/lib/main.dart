import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';
import 'home.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
        )
      ],
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

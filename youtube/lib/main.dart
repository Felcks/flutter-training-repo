import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
  ));

  return runApp(
      MaterialApp(
        title: "Youtube",
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Home(),
      )
  );
}

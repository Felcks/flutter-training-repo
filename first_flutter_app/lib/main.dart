import 'dart:math';

import 'package:flutter/material.dart';

//void main() => runApp(
//  MaterialApp(
//    title: "Material app title",
//    home: Container(
//      margin: EdgeInsets.only(top: 40),
//      decoration: BoxDecoration(
//        border: Border.all(
//          width: 5,
//          color: Colors.white
//        )
//      ),
//      child:  Image.asset(
//        "images/mesa.jpg",
//        fit: BoxFit.scaleDown,
//      )
//    )
//  )
//);

void main() => runApp(
    MaterialApp(
        title: "Material app title",
        home: HomeStateful(),
    )
);

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {

  var _titulo = "Instragram";
  var _texto = "Matheus";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: RaisedButton(
          onPressed: (){
            setState(() {
              _texto = "aa";
            });
          },
          child: Text(_texto),
        )
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.redAccent,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Text("text1"),
                Text("text2"),
              ],
            ),
          )
      ),
    );
  }
}


class Home extends StatelessWidget {

  var _titulo = "Instragram";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Conteudo principal",
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.redAccent,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Text("text1"),
                Text("text2"),
              ],
            ),
          )
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Frases do dia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _randomNumber = 0;
  List<String> _phrases = [
    "Hello friend",
    "You are a true hero",
    "Anakin Skywalker",
    "Mr Robot"
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _randomNumber = Random().nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pressione o botão para gerar uma frase.',
            ),
            Text(
              '${_phrases[_randomNumber]}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.all_out),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

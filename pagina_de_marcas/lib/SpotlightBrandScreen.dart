import 'package:flutter/material.dart';

class SpotlightBrandScreen extends StatefulWidget {
  @override
  _SpotlightBrandScreenState createState() => _SpotlightBrandScreenState();
}

class _SpotlightBrandScreenState extends State<SpotlightBrandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marcas"),
      ),
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) =>  Divider(
            height: 2,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Text("Item $index");
          },
        ),
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/BrandResponse.dart';

import 'Api.dart';

class SpotlightBrandScreen extends StatefulWidget {
  @override
  _SpotlightBrandScreenState createState() => _SpotlightBrandScreenState();
}



class _SpotlightBrandScreenState extends State<SpotlightBrandScreen> {


  Api api = Api();

  Future<List<BrandResponse>> _getBrandList(){
    return api.getBrandList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marcas"),
        backgroundColor: Colors.pinkAccent,
        textTheme: TextTheme(
          title: TextStyle(
              color: Colors.white
          ),
          body1: TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getBrandList(),
          builder: (context, snapshot) {
            return ListView.separated(
              separatorBuilder: (context, index) =>  Divider(
                height: 2,
              ),
              itemCount: snapshot.data.items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Item $index"),
                );
              },
            );
          },
        )
      ),

    );
  }
}

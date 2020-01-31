import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/BrandResponse.dart';
import 'package:side_header_list_view/side_header_list_view.dart';

import 'Api.dart';

class SpotlightBrandScreen2 extends StatefulWidget {
  @override
  _SpotlightBrandScreenState createState() => _SpotlightBrandScreenState();
}



class _SpotlightBrandScreenState extends State<SpotlightBrandScreen2> {

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
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: _getBrandList(),
          builder: (context, snapshot) {

          switch(snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                      strokeWidth: 5,
                    ),
                    width: 40,
                    height: 40,
                  )
              );
              break;
            case ConnectionState.active:
              print("active");
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {

                print(snapshot.error);
              }
              else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    BrandResponse brand = snapshot.data[index];

                    return InkWell(
                      onTap: (){},
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          brand.Name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              break;
            }
            return Center(
              child: Text(""),
            );
          },
        )
      ),

    );
  }
}

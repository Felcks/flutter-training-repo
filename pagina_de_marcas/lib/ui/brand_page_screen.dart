import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/api/api.dart';
import 'package:pagina_de_marcas/model/brand_response.dart';

class BrandPageScreen extends StatefulWidget {
  @override
  _BrandPageScreenState createState() => _BrandPageScreenState();
}

class _BrandPageScreenState extends State<BrandPageScreen> {

    Api api = Api();

    Future<List<BrandResponse>> _getBrandList() {
      return api.getBrandList(false);
    }

    Future<List<BrandResponse>> brandList;

    @override
    void initState() {
      brandList = _getBrandList();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Produtos"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {

              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: FutureBuilder(
              future: brandList,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
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
                      return Center(
                        child: Text(""),
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

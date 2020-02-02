import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/api/api.dart';
import 'package:pagina_de_marcas/model/brand_response.dart';
import 'package:pagina_de_marcas/ui/brand_list_screen.dart';

import '../colors.dart';
import 'brand_page_screen.dart';

class BrandSpotlightScreen extends StatefulWidget {
  @override
  _BrandSpotlightScreenState createState() => _BrandSpotlightScreenState();
}

class _BrandSpotlightScreenState extends State<BrandSpotlightScreen> {

  Api api = Api();

  Future<List<BrandResponse>> _getBrandList(){
    return api.getBrandList(true);
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
        title: Text("Marcas"),
      ),
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: FutureBuilder(
            future: brandList,
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: ListView.separated(
                              itemCount: snapshot.data.length,
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                );
                              },
                              itemBuilder: (context, index) {
                                BrandResponse brand = snapshot.data[index];

                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => BrandPageScreen())
                                    );
                                  },
                                  child: Container(
                                      height: 100,
                                      width: 320,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey[300],
                                                blurRadius: 3.0
                                            )
                                          ]
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Stack(
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    height: 200,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(brand.ImageUrl)
                                                        )
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 32),
                                                    child: Text(
                                                      brand.Name,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                          ),
                                        ],
                                      )
                                  ),
                                );
                              }
                          ),
                        ),
                        RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BrandListScreen())
                              );
                            },
                            child: Text(
                              "VER TODAS AS MARCAS",
                              style: TextStyle(
                                color: MyColors.pink,
                                fontSize: 16
                              ),
                            ),
                            highlightColor: MyColors.pink_2,
                            splashColor: MyColors.pink_2,
                            color: Colors.white,
                            padding: EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                              side: BorderSide(color: MyColors.pink)
                            )
                        )
                      ],
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

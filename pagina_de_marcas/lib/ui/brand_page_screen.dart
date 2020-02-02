import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/api/api.dart';
import 'package:pagina_de_marcas/colors.dart';
import 'package:pagina_de_marcas/model/product_response.dart';
import 'package:pagina_de_marcas/model/search_product_response.dart';

class BrandPageScreen extends StatefulWidget {
  @override
  _BrandPageScreenState createState() => _BrandPageScreenState();

  String query;

  BrandPageScreen(this.query);
}

class _BrandPageScreenState extends State<BrandPageScreen> {

    Api api = Api();

    int resultsAmount;

    Future<SearchProductResponse> _postProductSearch(String query) {
      return api.postProductSearch(query, 0, 10);
    }

    Future<SearchProductResponse> searchResponse;

    @override
    void initState() {
      searchResponse = _postProductSearch(widget.query);
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                            "Você está em:"
                        ),
                        Text(
                          widget.query,
                          style: TextStyle(
                              color: MyColors.pink,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        Text(
                          resultsAmount.toString() ?? "",
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                        Text(
                          "resultados",
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        )
                      ],
                    )
                  ],
                ),
                FutureBuilder(
                  future: searchResponse,
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
                          resultsAmount = snapshot.data.Total;
                          return Container(
                            height: 500,
                            margin: EdgeInsets.only(top: 16),
                            child: Scrollbar(
                              child: ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.Size,
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(6),
                                  );
                                },
                                itemBuilder: (context, index) {
                                  ProductResponse product = snapshot.data
                                      .Products[index];

                                  return Container(
                                      margin: EdgeInsets.all(3),
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                      width: 170,
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
                                      child: Stack(
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    height: 200,
                                                    width: 500,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                            image: NetworkImage(
                                                              product.Skus[0].Images[0].ImageUrl
                                                            )
                                                        )
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(16),
                                                    child: Text(
                                                      product.Name,
                                                      maxLines: 5,
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                          ),
                                        ],
                                      )
                                  );
                                }
                              ),
                            )
                          );
                        }
                        break;
                    }
                    return Center(
                      child: Text(""),
                    );
                  },
                )
              ],
            )
        ),
      );
    }
}

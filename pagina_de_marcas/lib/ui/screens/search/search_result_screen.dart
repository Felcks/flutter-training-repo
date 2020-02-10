import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pagina_de_marcas/api/api.dart';
import 'package:pagina_de_marcas/colors.dart';
import 'package:pagina_de_marcas/controller/product_controller.dart';
import 'package:pagina_de_marcas/model/product/product_response.dart';
import 'package:pagina_de_marcas/model/product/sku_response.dart';
import 'package:pagina_de_marcas/model/search/search_product_response.dart';
import 'package:pagina_de_marcas/ui/screens/product/product_screen.dart';
import 'package:pagina_de_marcas/ui/widgets/product_card.dart';
import 'package:pagina_de_marcas/ui/widgets/star_display.dart';

class SearchResultScreen extends StatefulWidget {

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();

  String query;

  SearchResultScreen(this.query);
}

class _SearchResultScreenState extends State<SearchResultScreen> {

    Api api = Api();

    int resultsAmount;

    Future<SearchProductResponse> _postProductSearch(String query) {

      return api.postProductSearch(query, 0, 10);
    }

    Future<SearchProductResponse> searchResponse;

    final productAmountController = ProductController();

    @override
    void initState() {
      searchResponse = _postProductSearch(widget.query);
      searchResponse.then((response) => productAmountController.setProductAmount((response.Total > 0) ? response.Total : response.Products.length));
      super.initState();
    }
    
    Widget getListView(AsyncSnapshot<dynamic> snapshot){
      return Container(
          height: 500,
          child: Scrollbar(
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.Products.length,
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(6),
                    );
                  },
                  itemBuilder: (context, index) {
                    ProductResponse product = snapshot.data.Products[index];

                    return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProductScreen(product))
                        );
                      },
                      child: ProductCard().getDefaultProductCard(product)
                    );
                  }
              )
          )
      );
    }

    Widget getGridView(AsyncSnapshot<dynamic> snapshot){
      return Expanded(
        child:GridView.builder(
            itemCount: snapshot.data.Products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.4),

            itemBuilder: (BuildContext context, int index) {
              ProductResponse product = snapshot.data.Products[index];
              SkuResponse sku = product.Skus[0];

              return InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductScreen(product))
                  );
                },
                child: ProductCard().getDefaultProductCard(product)
              );
            })
      );
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
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        Observer(
                          builder: (_) {
                            return Text(
                              '${productAmountController.productAmount}',
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            );
                          }
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: FutureBuilder(
                    future: searchResponse,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          break;
                        case ConnectionState.waiting:
                          return Expanded(
                              child: Center(
                                child: SizedBox(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 5,
                                  ),
                                  width: 40,
                                  height: 40,
                                ) ,
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
                            return getGridView(snapshot);
                          }
                          break;
                      }
                      return Center(
                        child: Text(""),
                      );
                    },
                  ),
                )
              ],
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(Icons.filter_list),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }
}

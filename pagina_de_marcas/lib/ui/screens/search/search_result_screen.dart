import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pagina_de_marcas/api/api.dart';
import 'package:pagina_de_marcas/config/flag_config.dart';
import 'package:pagina_de_marcas/controller/product_controller.dart';
import 'package:pagina_de_marcas/model/product/product_response.dart';
import 'package:pagina_de_marcas/model/product/sku_response.dart';
import 'package:pagina_de_marcas/model/search/search_product_response.dart';
import 'package:pagina_de_marcas/ui/screens/product/product_screen.dart';
import 'package:pagina_de_marcas/ui/widgets/product_card.dart';

class SearchResultScreen extends StatefulWidget {

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();

  String query;

  SearchResultScreen(this.query);
}

class _SearchResultScreenState extends State<SearchResultScreen> {

    Api api;

    int resultsAmount;

    Future<SearchProductResponse> _postProductSearch(String query) {

      return api.postProductSearch(query, 0, 10);
    }

    Future<SearchProductResponse> searchResponse;

    final productAmountController = ProductController();

    @override
    void initState() {
      super.initState();
    }

    @override
    void didChangeDependencies(){
      this.api = Api(context: this.context);
      searchResponse = _postProductSearch(widget.query);
      searchResponse.then((response) => productAmountController.setProductAmount((response.Total > 0) ? response.Total : response.Products.length));
      super.didChangeDependencies();
    }
    
    Widget getListView(AsyncSnapshot<dynamic> snapshot){
      return Container(
          height: 400,
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
                      child: ProductCard().getDefaultProductCard(product, context)
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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: getCardAspectRatio()),

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
                child: ProductCard().getDefaultProductCard(product, context)
              );
            })
      );
    }

    double getCardAspectRatio(){
        double baseAspectRatio = 0.5;
        double priceAspectRatio =  (FlagConfig.cardFlag.showPrice) ? 0.1 : 0;
        double starsAspectRatio = (FlagConfig.cardFlag.showStars) ? 0.05 : 0;

        return baseAspectRatio - priceAspectRatio - starsAspectRatio;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 4),
                  child: Row(
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

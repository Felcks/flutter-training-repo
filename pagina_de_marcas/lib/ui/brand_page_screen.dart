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
import 'package:pagina_de_marcas/ui/product_screen.dart';
import 'package:pagina_de_marcas/ui/star_display.dart';

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

    final productAmountController = ProductController();

    @override
    void initState() {
      searchResponse = _postProductSearch(widget.query);
      searchResponse.then((response) => productAmountController.setProductAmount((response.Total > 0) ? response.Total : response.Products.length));
      super.initState();
    }

    Widget getPriceOrUnavaibleWidget(SkuResponse sku){

      var seller = sku.getFirstSellerWithQuantity();

      if(seller != null){
        return Column(
          children: <Widget>[
            SizedBox(
              height: 30,
              child: (seller.ListPrice != seller.Price)? Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "R\$ ${seller.ListPrice.toString()}",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                ),
              ),
              ): Container(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                "R\$ ${seller.Price.toString()}",
                maxLines: 5,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: MyColors.pink,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        );
      }
      else{
        return Container();
      }
    }

    Widget getBuyButtonOrUnavaible(SkuResponse sku) {
      var seller = sku.getFirstSellerWithQuantity();

      if (seller != null) {
        return RaisedButton(
            onPressed: () {},
            child: Text(
              "COMPRAR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
            ),
            highlightColor: Colors.white54,
            splashColor: Colors.white54,
            color: MyColors.pink,
            padding: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            )
        );
      }
      else {
        return RaisedButton(
            onPressed: () {},
            child: Text(
              "INDISPONÍVEL",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
            ),
            highlightColor: Colors.white54,
            splashColor: Colors.white54,
            color: Colors.grey,
            padding: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            )
        );
      }
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
                                    backgroundColor: Colors.blue,
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


                            return Container(
                                height: 550,
                                margin: EdgeInsets.only(top: 16),
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

                                        SkuResponse sku = product.Skus[0];

                                        return InkWell(
                                          onTap: (){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => ProductScreen(product))
                                            );
                                          },
                                          child: Container(
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
                                                            child: SizedBox(
                                                              height: 50,
                                                              child: Text(
                                                                product.Name,
                                                                maxLines: 3,
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding: EdgeInsets.only(top: 0),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: <Widget>[
                                                                  StarDisplayWidget(
                                                                    value: product.RatingResume.Average,
                                                                    filledStar: Icon(
                                                                      Icons.star,
                                                                      color: Colors.yellow[700],
                                                                      size: 17,
                                                                    ),
                                                                    unfilledStar: Icon(
                                                                      Icons.star,
                                                                      color: Colors.grey[300],
                                                                      size: 17,
                                                                    ),
                                                                    halfStar: Icon(
                                                                      Icons.star_half,
                                                                      color: Colors.yellow[700],
                                                                      size: 17,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(left: 8),
                                                                    child: Text(
                                                                      "(${product.RatingResume.Count})",
                                                                      maxLines: 3,
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                          color: Colors.grey,
                                                                          fontSize: 14
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                          ),
                                                          getPriceOrUnavaibleWidget(sku),
                                                        ],
                                                      )
                                                  ),
                                                  Align(
                                                      alignment: Alignment.bottomCenter,
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                                        width: 200,
                                                        child: getBuyButtonOrUnavaible(sku)
                                                      )
                                                  )
                                                ],
                                              )
                                          ),
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
          backgroundColor: MyColors.pink,
        ),
      );
    }
}

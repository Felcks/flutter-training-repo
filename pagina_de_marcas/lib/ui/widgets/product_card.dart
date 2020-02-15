import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/config/color_config.dart';
import 'package:pagina_de_marcas/model/product/product_response.dart';
import 'package:pagina_de_marcas/model/product/sku_response.dart';
import 'package:pagina_de_marcas/ui/screens/screen_master.dart';
import 'package:pagina_de_marcas/ui/widgets/star_display.dart';

import 'buttons.dart';

class ProductCard{

  Widget getDefaultProductCard(ProductResponse product, BuildContext context){

    SkuResponse sku = product.Skus[0];

    return Container(
        margin: EdgeInsets.all(3),
        padding: EdgeInsets.symmetric(vertical: 16),
        width: 200,
        height: 600,
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
                        child: getRating(product)
                    ),
                    getPrice(sku),
                  ],
                )
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    width: 200,
                    child: getBuyButtonOrUnavaible(sku, context)
                )
            )
          ],
        )
    );
  }

  Widget getPrice(SkuResponse sku){

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
                  color: ColorConfig.accentColor,
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

  Widget getBuyButtonOrUnavaible(SkuResponse sku, BuildContext context) {
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
      );
    }
    else {
      return Theme(
        data: Theme.of(context).copyWith(
          buttonTheme: (ScreenMaster.searchResultElements.getButtonUnavailable()) ?? Buttons.unavailable(),
        ),
        child: RaisedButton(
          onPressed: () {},
          child: Text(
            "INDISPONÍVEL",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
          padding: EdgeInsets.all(8),

        )
      );
    }
  }

  Widget getRating(ProductResponse product){

    if(product.RatingResume != null){
      return Row(
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
          ),
        ],
      );
    }
    else{
      return Container();
    }
  }

}
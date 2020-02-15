import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:money/money.dart';
import 'package:pagina_de_marcas/config/color_config.dart';
import 'package:pagina_de_marcas/config/flag_config.dart';
import 'package:pagina_de_marcas/model/product/product_response.dart';
import 'package:pagina_de_marcas/model/product/seller_response.dart';
import 'package:pagina_de_marcas/model/product/sku_response.dart';
import 'package:pagina_de_marcas/ui/screens/screen_master.dart';
import 'package:pagina_de_marcas/ui/widgets/star_display.dart';
import 'package:progressive_image/progressive_image.dart';

import 'buttons.dart';

class ProductCard {

  Widget getDefaultProductCard(ProductResponse product, BuildContext context) {
    SkuResponse sku = product.getFirstSkuAvailable();

    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(vertical: 0),
        width: 200,
        height: 600,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 3.0)]),
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    getImage(product),
                    getBrand(product),
                    getTitle(product),
                    getRating(product),
                    getPrice(sku),
                  ],
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 4),
                    width: 200,
                    child: getBuyButton(sku, context)))
          ],
        ));
  }

  Widget getImage(ProductResponse product){

    SkuResponse sku = product.getFirstSkuAvailable();
    if(sku == null)
      sku = product.Skus[0];

    return ProgressiveImage(
      placeholder: AssetImage('assets/a.png'),
      // size: 1.87KB
      thumbnail:
      NetworkImage(sku.Images[0].ImageUrl),
      // size: 1.29MB
      image: NetworkImage(sku.Images[0].ImageUrl),
      height: 300,
      width: 500,
    );
  }

  Widget getBrand(ProductResponse product) {
    if (!FlagConfig.cardFlag.showBrand) return Container();

    return Padding(
      padding: EdgeInsets.all(16),
      child: SizedBox(
        height: 15,
        child: Text(
          product.Brand,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
      ),
    );
  }

  Widget getTitle(ProductResponse product) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SizedBox(
        height: 30,
        child: Text(
          product.Name,
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget getListPrice(SellerResponse seller) {
    if (!FlagConfig.cardFlag.showListPrice) return Container();

    return SizedBox(
      height: 30,
      child: (seller.ListPrice != seller.Price)
          ? Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "R\$ ${Money.fromDouble(seller.ListPrice, Currency("BRL")).amountAsString}",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    letterSpacing: 1.2,
                    color: Colors.grey,
                    fontSize: 12),
              ),
            )
          : Container(),
    );
  }

  Widget getPrice(SkuResponse sku) {
    if (!FlagConfig.cardFlag.showPrice) return Container();

    var seller = sku.getFirstSellerWithQuantity();

    if (seller != null) {
      return Column(
        children: <Widget>[
          getListPrice(seller),
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              "R\$ ${Money.fromDouble(seller.Price, Currency("BRL")).amountAsString}",
              maxLines: 5,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorConfig.accentColor,
                  fontSize: 20,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget getRating(ProductResponse product) {
    if (!FlagConfig.cardFlag.showStars) return Container();

    if (product.RatingResume != null) {
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
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget getBuyButton(SkuResponse sku, BuildContext context) {
    if (!FlagConfig.cardFlag.showBuyButton) return Container();

    var seller = sku.getFirstSellerWithQuantity();

    if (seller != null) {
      return RaisedButton(
        onPressed: () {},
        child: Text(
          "COMPRAR",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
    } else {
      return Theme(
          data: Theme.of(context).copyWith(
            buttonTheme:
                (ScreenMaster.searchResultElements.getButtonUnavailable()) ??
                    Buttons.unavailable(),
          ),
          child: RaisedButton(
            onPressed: () {},
            child: Text(
              "INDISPONÍVEL",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            padding: EdgeInsets.all(8),
          ));
    }
  }
}

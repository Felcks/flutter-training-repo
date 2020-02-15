import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/config/app_config.dart';
import 'package:pagina_de_marcas/config/color_config.dart';
import 'package:pagina_de_marcas/model/product/product_response.dart';
import 'package:progressive_image/progressive_image.dart';

import '../../../colors.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();

  ProductResponse product;

  ProductScreen(this.product);
}

class _ProductScreenState extends State<ProductScreen> {
  bool activated = false;

  ScrollController _scrollController;

  _scrollListener() {
    if (_scrollController.offset >= 400) {
      setState(() {
        activated = true;
      });
    }
    if (_scrollController.offset < 400) {
      setState(() {
        activated = false;
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text((activated) ? widget.product.Name : ""),
        titleSpacing: 0,
        backgroundColor: (activated) ? Colors.white : Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: kToolbarHeight / 2),
        controller: _scrollController,
        child: Container(
          color: ColorConfig.lightPrimaryColor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                overflow: Overflow.visible,
                children: <Widget>[
                  ProgressiveImage(
                    placeholder: AssetImage('assets/a.png'),
                    // size: 1.87KB
                    thumbnail:
                        NetworkImage(widget.product.Skus[0].Images[0].ImageUrl),
                    // size: 1.29MB
                    image:
                        NetworkImage(widget.product.Skus[0].Images[0].ImageUrl),
                    fit: BoxFit.contain,
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.product.Name,
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight * 2,
        child: Column(
          children: <Widget>[
            Container(
              height: kBottomNavigationBarHeight,
              color: Colors.white,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    widget.product.Skus[0].Sellers[0].Price.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: kBottomNavigationBarHeight,
              color: Theme.of(context).primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "COMPRAR",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: () {
//          // Add your onPressed code here!
//        },
//        label: Padding(
//          padding: EdgeInsets.all(8),
//          child: Text(
//            "Comprar",
//            style:  TextStyle(
//              fontSize: 18
//            ),
//          ),
//        ),
//        backgroundColor: MyColors.pink,
//      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/model/product/product_response.dart';

import '../colors.dart';

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
        title: Text( (activated) ? widget.product.Name : ""),
        titleSpacing: 0,
        backgroundColor: (activated) ? Colors.white : Colors.transparent,
        elevation: 0.0,
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              overflow: Overflow.visible,
              children: <Widget>[
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: 300.0,
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      begin: Alignment.topCenter,
//                      end: Alignment.bottomCenter,
//                      colors: [
//                        MyColors.pink,
//                        Colors.white
//                      ]
//                    )
//                  ),
//                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                              widget.product.Skus[0].Images[0].ImageUrl
                          )
                      )
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.Name,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black
                    ),
                  ),
                ],
              )
            )
          ],
        ),
        controller: _scrollController,
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight * 2,
        child: Column(
          children: <Widget>[
            Container(
              height: kBottomNavigationBarHeight,
              color:Colors.white,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey
                    ),
                  ),
                  Text(
                    widget.product.Skus[0].Sellers[0].Price.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: MyColors.pink
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: kBottomNavigationBarHeight,
              color: MyColors.pink,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "COMPRAR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
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

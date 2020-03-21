import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pagina_de_marcas/api/api.dart';
import 'package:pagina_de_marcas/config/color_config.dart';
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
  bool _isFloatButtonVisible = true;
  ScrollController _floatActionButtonController;

  Future<SearchProductResponse> searchResponse;
  final productAmountController = ProductController();

  Future<SearchProductResponse> _postProductSearch(String query) {
    return api.postProductSearch(query, 0, 10);
  }

  @override
  void initState() {
    super.initState();
    _floatActionButtonController = new ScrollController();
    _floatActionButtonController.addListener(() {
      if (_floatActionButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isFloatButtonVisible == true) {
          setState(() {
            _isFloatButtonVisible = false;
          });
        }
      } else {
        if (_floatActionButtonController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isFloatButtonVisible == false) {
            setState(() {
              _isFloatButtonVisible = true;
            });
          }
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    if (api == null) {
      this.api = Api(context: this.context);
      searchResponse = _postProductSearch(widget.query);
      searchResponse.then((response) =>
          productAmountController.setProductAmount((response.Total > 0)
              ? response.Total
              : response.Products.length));
    }
    super.didChangeDependencies();
  }

  Widget getListView(AsyncSnapshot<dynamic> snapshot) {
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

            return PlatformWidget(
              android: (_) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductScreen(product)));
                },
                child: ProductCard().getDefaultProductCard(product, context),
              ),
              ios: (_) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductScreen(product)));
                },
                child: ProductCard().getDefaultProductCard(product, context),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getGridView(AsyncSnapshot<dynamic> snapshot) {
    return Expanded(
      child: GridView.builder(
        controller: _floatActionButtonController,
        itemCount: snapshot.data.Products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: getCardAspectRatio()),
        itemBuilder: (BuildContext context, int index) {
          ProductResponse product = snapshot.data.Products[index];
          SkuResponse sku = product.Skus[0];

          return PlatformWidget(
            android: (_) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductScreen(product)));
              },
              child: ProductCard().getDefaultProductCard(product, context),
            ),
            ios: (_) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductScreen(product)));
              },
              child: ProductCard().getDefaultProductCard(product, context),
            ),
          );
        },
      ),
    );
  }

  Widget getStaggeredGridView(AsyncSnapshot<dynamic> snapshot) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        controller: _floatActionButtonController,
        itemCount: snapshot.data.Products.length,
        crossAxisCount: 2,
        staggeredTileBuilder: (index)  {
          ProductResponse product = snapshot.data.Products[index];
          return StaggeredTile.count(1, getCardSize(product));
        },
        itemBuilder: (BuildContext context, int index) {
          ProductResponse product = snapshot.data.Products[index];
          SkuResponse sku = product.Skus[0];

          return PlatformWidget(
            android: (_) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductScreen(product)));
              },
              child: ProductCard().getDefaultProductCard(product, context),
            ),
            ios: (_) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductScreen(product)));
              },
              child: ProductCard().getDefaultProductCard(product, context),
            ),
          );
        },
      ),
    );
  }

  double getCardAspectRatio() {
    double baseAspectRatio = 0.53;
    double brandAspectRatio = (FlagConfig.cardFlag.showBrand) ? 0.05 : 0;
    double starsAspectRatio = (FlagConfig.cardFlag.showStars) ? 0.05 : 0;
    double listPriceAspectRatio =
        (FlagConfig.cardFlag.showListPrice) ? 0.02 : 0;
    double priceAspectRatio = (FlagConfig.cardFlag.showPrice) ? 0.08 : 0;
    double buyButtonAspectRatio = (FlagConfig.cardFlag.showBuyButton) ? 0.1 : 0;

    return baseAspectRatio -
        brandAspectRatio -
        starsAspectRatio -
        listPriceAspectRatio -
        priceAspectRatio -
        buyButtonAspectRatio;
  }

  double getCardSize(ProductResponse product) {

    double baseSize = 2.3;
    double lineSize = 0.1;
    double amountLines = product.Name.length / 25;

    double listPriceSize = 0.0;
    double listPrice = product.Skus[0].Sellers[0].ListPrice;
    if(listPrice != null && listPrice > 0)
      listPriceSize = 0.1;

    return baseSize + (lineSize * amountLines) + listPriceSize;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text("Produtos"),
         ios: (_) => CupertinoNavigationBarData(
          actionsForegroundColor: ColorConfig.accentColor,
          backgroundColor: CupertinoColors.white,
        ),
      ),
      android: (_) => MaterialScaffoldData(
        appBar: AppBar(
          actions: <Widget>[
            PlatformIconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            PlatformIconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
        ),
        floatingActionButton: Visibility(
          visible: _isFloatButtonVisible,
          child: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            child: Icon(MdiIcons.sortVariant),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
      ios: (_) => CupertinoPageScaffoldData(),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              PlatformWidget(
                android: (_) => Container(),
                ios: (_) => Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[Text("Ordenar"), Text("Filtrar")],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        PlatformText("Você está em:"),
                        PlatformText(
                          widget.query,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        Observer(builder: (_) {
                          return Text(
                            '${productAmountController.productAmount}',
                            style: TextStyle(color: Colors.grey),
                          );
                        }),
                        Text(
                          "resultados",
                          style: TextStyle(color: Colors.grey),
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
                            child: PlatformCircularProgressIndicator(
                              ios: (_) => CupertinoProgressIndicatorData(
                                radius: 15,
                              ),
                            ),
                            width: 40,
                            height: 40,
                          ),
                        ));
                        break;
                      case ConnectionState.active:
                        print("active");
                        break;
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.data.Products.length <= 0) {
                          return Expanded(
                            child: Center(
                              child: Text("Não há produtos disponíveis."),
                            ),
                          );
                        } else {
                          return getStaggeredGridView(snapshot);
                        }
                        break;
                    }
                    return Center(
                      child: Text(""),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

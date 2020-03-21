import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pagina_de_marcas/api/api.dart';
import 'package:pagina_de_marcas/config/app_config.dart';
import 'package:pagina_de_marcas/config/color_config.dart';
import 'package:pagina_de_marcas/model/brand/brand_response.dart';
import 'package:pagina_de_marcas/store/off_premium/brand_spotlight_elements.dart';
import 'package:pagina_de_marcas/ui/screens/brand/brand_list_screen.dart';
import 'package:pagina_de_marcas/ui/screens/brand/spotlight/brand_spotlight_elements.dart';
import 'package:pagina_de_marcas/ui/screens/search/search_result_screen.dart';
import 'package:pagina_de_marcas/ui/widgets/buttons.dart';

import '../../screen_master.dart';

class BrandSpotlightScreen extends StatefulWidget {
  @override
  _BrandSpotlightScreenState createState() => _BrandSpotlightScreenState();
}

class _BrandSpotlightScreenState extends State<BrandSpotlightScreen> {
  Api api;

  Future<List<BrandResponse>> _getBrandList() {
    return api.getBrandList(true);
  }

  Future<List<BrandResponse>> brandList;

  @override
  void didChangeDependencies() {
    if (api == null) {
      this.api = Api(context: this.context);
      brandList = _getBrandList();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.white,
      appBar: PlatformAppBar(
        title: Text("Marcas"),
        android: (_) => MaterialAppBarData(
          elevation: 0,
        ),
        ios: (_) => CupertinoNavigationBarData(
          backgroundColor: CupertinoColors.white,
        ),
      ),
      android: (_) => MaterialScaffoldData(),
      body: SafeArea(
        child: Container(
          color: ColorConfig.lightPrimaryColor,
          padding: EdgeInsets.all(16),
          child: FutureBuilder(
            future: brandList,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: SizedBox(
                      child: PlatformCircularProgressIndicator(
                        ios: (_) => CupertinoProgressIndicatorData(
                          radius: 15
                        ),
                      ),
                      width: 40,
                      height: 40,
                    ),
                  );
                  break;
                case ConnectionState.active:
                  print("active");
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    if (snapshot.data.isEmpty) {
                      return Stack(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Nenhuma marca em destaque",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [getButtonSeeAllBrands()],
                          ),
                        ],
                      );
                    }

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
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey[300],
                                      width: 1,
                                    )),
                                child: Material(
                                  color: Colors.white,
                                  child: Container(
                                    height: 80,
                                    width: 320,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                            child: Container(
                                          padding: EdgeInsets.all(16),
                                          child: Row(
                                            children: <Widget>[
                                              Image.network(
                                                brand.ImageUrl,
                                                height: 200,
                                                width: 80,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 32),
                                                child: Text(
                                                  brand.Name,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                        Positioned.fill(
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              highlightColor: Colors.grey[350]
                                                  .withOpacity(0.2),
                                              splashColor: Colors.grey[350]
                                                  .withOpacity(0.2),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SearchResultScreen(
                                                                brand.Name)));
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        getButtonSeeAllBrands()
                      ],
                    );
                  }
                  break;
              }
              return Center(
                child: Text(""),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getButtonSeeAllBrands() {
    return Theme(
      data: Theme.of(context).copyWith(
        buttonTheme: (ScreenMaster.brandSpotlightElements.getButton01()) ??
            Buttons.nonFilled(),
      ),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BrandListScreen()));
        },
        child: Text(
          "VER TODAS AS MARCAS",
          style: TextStyle(fontSize: 16),
        ),
        padding: EdgeInsets.all(16),
      ),
    );
  }
}

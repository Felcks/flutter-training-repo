import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pagina_de_marcas/model/brand/brand_response.dart';
import 'package:pagina_de_marcas/ui/screens/search/search_result_screen.dart';
import 'package:side_header_list_view/side_header_list_view.dart';

import 'package:pagina_de_marcas/api/api.dart';
import 'dart:async';

class BrandListScreen extends StatefulWidget {
  @override
  _BrandListScreenState createState() => _BrandListScreenState();
}

class _BrandListScreenState extends State<BrandListScreen> {
  Api api;

  Future<List<BrandResponse>> _getBrandList() {
    return api.getBrandList(false);
  }

  Future<List<BrandResponse>> brandList;
  String filtered = "";
  TextEditingController searchTextController;

  @override
  void didChangeDependencies() {
    if (api == null) {
      api = Api(context: this.context);
      brandList = _getBrandList();
      searchTextController = TextEditingController();
    }
    super.didChangeDependencies();
  }

  int filter(List<BrandResponse> list) {
    list.removeWhere((item) =>
        item.Name.toLowerCase().contains(filtered.toLowerCase()) == false);
    return list.length;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text("Todas as marcas"),
      ),
      body: SafeArea(
        child: Container(
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
                      child: PlatformCircularProgressIndicator(),
                      width: 40,
                      height: 40,
                    ));
                    break;
                  case ConnectionState.active:
                    print("active");
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Center(
                        child: PlatformText(
                          snapshot.error.toString(),
                        ),
                      );
                    } else {
                      List<BrandResponse> list =
                          new List<BrandResponse>.from(snapshot.data);
                      filter(list);

                      // if (list.length == 0) {
                      //   return Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: <Widget>[
                      //       Stack(
                      //         children: <Widget>[
                      //           Align(
                      //             alignment: Alignment.centerLeft,
                      //             child: PlatformIconButton(
                      //               onPressed: () {},
                      //               icon: Icon(
                      //                 context.platformIcons.search,
                      //                 color: Theme.of(context).accentColor,
                      //               ),
                      //             ),
                      //           ),
                      //           PlatformTextField(
                      //             maxLines: 1,
                      //             textCapitalization: TextCapitalization.words,
                      //             onChanged: (value) {
                      //               setState(() {
                      //                 filtered = value;
                      //               });
                      //             },
                      //             enableInteractiveSelection: false,
                      //             android: (_) => MaterialTextFieldData(
                      //               decoration: InputDecoration(
                      //                 hintText: "Pesquise por uma marca",
                      //                 errorBorder: InputBorder.none,
                      //                 contentPadding: EdgeInsets.symmetric(
                      //                     vertical: 8.0, horizontal: 48),
                      //               ),
                      //               textAlign: TextAlign.left,
                      //             ),
                      //             ios: (_) => CupertinoTextFieldData(
                      //               padding: EdgeInsets.all(16),
                      //               placeholder: "Pesquise por uma marca",
                      //               decoration: BoxDecoration(
                      //                 color: Colors.black,
                      //               ),
                      //               textAlign: TextAlign.left,
                      //             ),
                      //             controller: searchTextController,
                      //           ),
                      //           Align(
                      //             alignment: Alignment.centerRight,
                      //             child: PlatformIconButton(
                      //               onPressed: () {
                      //                 setState(() {
                      //                   searchTextController.text = "";
                      //                   filtered = "";
                      //                 });
                      //               },
                      //               icon: Icon(context.platformIcons.clear,
                      //                   color: Colors.grey),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(top: 16),
                      //       ),
                      //       Expanded(
                      //         child: Center(
                      //           child: Text("Nenhuma marca encontrada"),
                      //         ),
                      //       )
                      //     ],
                      //   );
                      // }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          PlatformWidget(
                            android: (_) => Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: PlatformIconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      context.platformIcons.search,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                                TextField(
                                  maxLines: 1,
                                  textCapitalization: TextCapitalization.words,
                                  onChanged: (value) {
                                    setState(() {
                                      filtered = value;
                                    });
                                  },
                                  enableInteractiveSelection: false,
                                  decoration: InputDecoration(
                                    hintText: "Pesquise por uma marca",
                                    errorBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 48),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: PlatformIconButton(
                                    onPressed: () {
                                      searchTextController.text = "";
                                      filtered = "";
                                    },
                                    icon: Icon(context.platformIcons.clear),
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            ios: (_) => Stack(
                              children: <Widget>[
                               
                                CupertinoTextField(
                                  placeholder: "Pesquise por uma marca",
                                  textAlign: TextAlign.left,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  controller: searchTextController,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                          ),
                          Expanded(
                            child: Scrollbar(
                              child: SideHeaderListView(
                                itemCount: list.length,
                                itemExtend: 50.0,
                                headerBuilder:
                                    (BuildContext context, int index) {
                                  String headerText = (removeDiacritics(
                                                  list[index].Name)
                                              .toUpperCase()
                                              .codeUnitAt(0) <
                                          'A'.codeUnitAt(0))
                                      ? "#"
                                      : removeDiacritics(list[index].Name[0])
                                          .toUpperCase();

                                  return Text(
                                    headerText,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  );
                                },
                                itemBuilder: (context, index) {
                                  BrandResponse brand = list[index];

                                  return PlatformWidget(
                                    android: (_) => InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          platformPageRoute(
                                            builder: (context) =>
                                                SearchResultScreen(brand.Name),
                                            context: context,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        child: Text(
                                          brand.Name,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ios: (_) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          platformPageRoute(
                                            builder: (context) =>
                                                SearchResultScreen(brand.Name),
                                            context: context,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        child: Text(
                                          brand.Name,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                hasSameHeader: (int a, int b) {
                                  int aCharacterValue =
                                      removeDiacritics(list[a].Name)
                                          .toUpperCase()
                                          .codeUnitAt(0);
                                  int bCharacterValue =
                                      removeDiacritics(list[b].Name)
                                          .toUpperCase()
                                          .codeUnitAt(0);

                                  int minCharacterValue = 'A'.codeUnitAt(0);

                                  aCharacterValue =
                                      ((aCharacterValue < minCharacterValue)
                                          ? 999
                                          : aCharacterValue);
                                  bCharacterValue =
                                      ((bCharacterValue < minCharacterValue)
                                          ? 999
                                          : bCharacterValue);

                                  return aCharacterValue == bCharacterValue;
                                },
                              ),
                            ),
                          )
                        ],
                      );
                    }
                    break;
                }
                return Center(
                  child: PlatformText(""),
                );
              },
            )),
      ),
    );
  }
}

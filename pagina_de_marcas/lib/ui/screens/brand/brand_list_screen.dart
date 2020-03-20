import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_section_list_view/flutter_section_list_view.dart';
import 'package:pagina_de_marcas/config/color_config.dart';
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

  List<List<BrandResponse>> arrangeItemsForiOS(List<BrandResponse> list) {
    List<List<BrandResponse>> iOSList = [[]];
    int currentPos = 0;
    iOSList[currentPos].add(list[0]);

    for (int i = 1; i < list.length; i++) {
      int aCharacterValue = removeDiacritics(iOSList[currentPos][0].Name)
          .toUpperCase()
          .codeUnitAt(0);

      int bCharacterValue =
          removeDiacritics(list[i].Name).toUpperCase().codeUnitAt(0);

      int minCharacterValue = 'A'.codeUnitAt(0);

      aCharacterValue =
          ((aCharacterValue < minCharacterValue) ? 999 : aCharacterValue);
      bCharacterValue =
          ((bCharacterValue < minCharacterValue) ? 999 : bCharacterValue);

      if (aCharacterValue == bCharacterValue) {
        iOSList[currentPos].add(list[i]);
      } else {
        currentPos++;
        iOSList.add([list[i]]);
      }
    }

    return iOSList;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text("Todas as marcas"),
        android: (_) => MaterialAppBarData(
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Container(
          color: ColorConfig.lightPrimaryColor,
          padding: EdgeInsets.all(4),
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
                    ),
                  );
                  break;
                case ConnectionState.active:
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
                        List<BrandResponse>.from(snapshot.data);
                    filter(list);

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
                                controller: searchTextController,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: PlatformIconButton(
                                  onPressed: () {
                                    setState(() {
                                      searchTextController.text = "";
                                      filtered = "";
                                    });
                                  },
                                  icon: Icon(context.platformIcons.clear),
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          ios: (_) => Container(
                            padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                            child: Stack(
                              children: <Widget>[
                                CupertinoTextField(
                                  onChanged: (value) {
                                    setState(() {
                                      filtered = value;
                                    });
                                  },
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
                        ),
                        getExpandedList(list),
                      ],
                    );
                  }
                  break;
              }
              return Center(
                child: PlatformText(""),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getExpandedList(List<BrandResponse> list) {
    if (list.isEmpty) {
      return Expanded(
        child: Center(
          child: Text("Nenhuma marca encontrada"),
        ),
      );
    }
    List<List<BrandResponse>> iOSList = arrangeItemsForiOS(list);

    return Expanded(
      child: Scrollbar(
        child: PlatformWidget(
          ios: (_) => FlutterSectionListView(
            numberOfSection: () => iOSList.length,
            numberOfRowsInSection: (section) {
              if (section >= iOSList.length) return 0;

              return iOSList[section].length;
            },
            sectionWidget: (section) {
              if (section >= iOSList.length) return Container();

              BrandResponse brand = iOSList[section][0];
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '${brand.Name.substring(0, 1)}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                color: Colors.grey[200],
              );
            },
            rowWidget: (section, int index) {
              if (section >= iOSList.length) return Container();

              if (index >= iOSList[section].length) return Container();

              BrandResponse brand = iOSList[section][index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    platformPageRoute(
                      builder: (context) => SearchResultScreen(brand.Name),
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
              );
            },
          ),
          android: (_) => Container(
            padding: EdgeInsets.all(16),
            child: SideHeaderListView(
              itemCount: list.length,
              itemExtend: 50.0,
              headerBuilder: (BuildContext context, int index) {
                String headerText = (removeDiacritics(list[index].Name)
                            .toUpperCase()
                            .codeUnitAt(0) <
                        'A'.codeUnitAt(0))
                    ? "#"
                    : removeDiacritics(list[index].Name[0]).toUpperCase();

                return PlatformWidget(
                  android: (_) => Text(
                    headerText,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  ios: (context) => Container(
                    height: 30,
                    width: 20,
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.passthrough,
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            color: Colors.grey[200],
                            child: Text(
                              headerText,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemBuilder: (context, index) {
                BrandResponse brand = list[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      platformPageRoute(
                        builder: (context) => SearchResultScreen(brand.Name),
                        context: context,
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Text(
                      brand.Name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
              hasSameHeader: (int a, int b) {
                int aCharacterValue =
                    removeDiacritics(list[a].Name).toUpperCase().codeUnitAt(0);
                int bCharacterValue =
                    removeDiacritics(list[b].Name).toUpperCase().codeUnitAt(0);

                int minCharacterValue = 'A'.codeUnitAt(0);

                aCharacterValue = ((aCharacterValue < minCharacterValue)
                    ? 999
                    : aCharacterValue);
                bCharacterValue = ((bCharacterValue < minCharacterValue)
                    ? 999
                    : bCharacterValue);

                return aCharacterValue == bCharacterValue;
              },
            ),
          ),
        ),
      ),
    );
  }
}

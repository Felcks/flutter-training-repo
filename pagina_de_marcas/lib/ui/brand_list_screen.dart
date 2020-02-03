import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/colors.dart';
import 'package:pagina_de_marcas/model/brand/brand_response.dart';
import 'package:pagina_de_marcas/ui/brand_page_screen.dart';
import 'package:side_header_list_view/side_header_list_view.dart';

import '../api/api.dart';
import 'dart:async';

class BrandListScreen extends StatefulWidget {
  @override
  _BrandListScreenState createState() => _BrandListScreenState();
}



class _BrandListScreenState extends State<BrandListScreen> {

  Api api = Api();

  Future<List<BrandResponse>> _getBrandList(){
    return api.getBrandList(false);
  }

  Future<List<BrandResponse>> brandList;
  String filtered = "";

  @override
  void initState() {
    brandList = _getBrandList();
    super.initState();
  }

  int filter(List<BrandResponse> list){
    list.removeWhere( (item) => item.Name.contains(filtered) == false);
    return list.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Todas as marcas"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder(
          future: brandList,
          builder: (context, snapshot) {

          switch(snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                      strokeWidth: 5,
                    ),
                    width: 40,
                    height: 40,
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

                List<BrandResponse> list = new List<BrandResponse>.from(snapshot.data);
                filter(list);

                if(list.length == 0){

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.search),
                              color: MyColors.pink,
                            ),
                          ),
                          TextField(
                            maxLines: 1,
                            textCapitalization: TextCapitalization.words,
                            onChanged: (value){
                              setState(() {
                                filtered = value;
                              });
                            },
                            enableInteractiveSelection: false,
                            decoration: InputDecoration(
                              hintText: "Pesquise por uma marca",
                              errorBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 48),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.clear),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                              "Nenhuma marca encontrada"
                          ),
                        ),
                      )
                    ],
                  );
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.search),
                              color: MyColors.pink,
                          ),
                        ),
                        TextField(
                          maxLines: 1,
                          textCapitalization: TextCapitalization.words,
                          onChanged: (value){
                            setState(() {
                              filtered = value;
                            });
                          },
                          enableInteractiveSelection: false,
                          decoration: InputDecoration(
                            hintText: "Pesquise por uma marca",
                            errorBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 48),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.clear),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                    ),
                    Expanded(
                      child: Scrollbar(
                        child: SideHeaderListView(
                          itemCount: list.length,
                          itemExtend: 50.0,
                          headerBuilder: (BuildContext context, int index){
                            return Text(list[index].Name[0],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            );
                          },
                          itemBuilder: (context, index) {
                            BrandResponse brand = list[index];

                            return InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => BrandPageScreen(brand.Name))
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
                          hasSameHeader: (int a, int b){
                            return removeDiacritics(list[a].Name)[0] == removeDiacritics(list[b].Name)[0];
                          },
                        ),
                      ) ,
                    )
                  ],
                );
              }
              break;
            }
            return Center(
              child: Text(""),
            );
          },
        )
      ),

    );
  }
}

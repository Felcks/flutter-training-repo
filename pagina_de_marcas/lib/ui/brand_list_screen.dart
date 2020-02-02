import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/model/brand/brand_response.dart';
import 'package:pagina_de_marcas/ui/brand_page_screen.dart';
import 'package:pagina_de_marcas/ui/brand_spotlight_screen.dart';
import 'package:side_header_list_view/side_header_list_view.dart';

import '../api/api.dart';
import '../colors.dart';
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

  @override
  void initState() {
    brandList = _getBrandList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todas as marcas"),
      ),
      body: Container(
        color: Colors.white,
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
                return Scrollbar(
                  child: SideHeaderListView(
                    itemCount: snapshot.data.length,
                    itemExtend: 50.0,
                    headerBuilder: (BuildContext context, int index){
                      return Text((
                          snapshot.data[index] as BrandResponse).Name[0],
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      );
                    },
                    itemBuilder: (context, index) {
                      BrandResponse brand = snapshot.data[index];

                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BrandPageScreen(brand.Name))
                          );
                        },
                        child: Padding(
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
                      return removeDiacritics((snapshot.data[a] as BrandResponse).Name)[0] == removeDiacritics((snapshot.data[b] as BrandResponse).Name)[0];
                    },
                  ),
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

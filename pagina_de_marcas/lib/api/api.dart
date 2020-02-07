import 'dart:core';

import 'package:diacritic/diacritic.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pagina_de_marcas/model/brand/brand_response.dart';
import 'package:pagina_de_marcas/model/search/search_product_response.dart';

import 'package:pagina_de_marcas/model/search/search_product_request.dart';

//const URL_BASE = "api-homolog-epocacosmeticosv2.mobfiq.com.br";
const URL_BASE = "api-homolog-offpremiumv2.mobfiq.com.br";

class Api{

  Future<List<BrandResponse>> getBrandList(bool onlySpotlights) async {

    var queryParameters = {
      "onlySpotlights": onlySpotlights.toString(),
    };

    final uri = new Uri.http(URL_BASE, '/Search/BrandList', queryParameters);
    print(uri);

    http.Response response = await http.get(uri);

    List<BrandResponse> brandList;
    if(response.statusCode == 200){

      Iterable parsed = json.decode(response.body);
      brandList = parsed.map((model) => BrandResponse.fromJson(model)).toList();

      int maxCharacterValue = 'z'.codeUnitAt(0);
      int minCharacterValue = 'A'.codeUnitAt(0);

      brandList.sort((a, b) {

        int aCharacterValue = removeDiacritics(a.Name).toUpperCase().codeUnitAt(0);
        int bCharacterValue = removeDiacritics(b.Name).toUpperCase().codeUnitAt(0);

        return (aCharacterValue + ((aCharacterValue < minCharacterValue) ? maxCharacterValue : 0))
            .compareTo(bCharacterValue + ((bCharacterValue < minCharacterValue) ? maxCharacterValue : 0));
        }
      );
    }
    else{
      print("error ${response.body}");
    }

    return brandList;
  }

  Future<SearchProductResponse> postProductSearch(String query, int offSet, int size) async {

    SearchProductRequest request = new SearchProductRequest(query, offSet, size);

    final uri = new Uri.http(URL_BASE, '/search/criteria', {});

    http.Response response = await http.post(uri,
        headers:  {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: json.encode(request.toJson())
    );

    Map parsed = json.decode(response.body);

    return SearchProductResponse.fromJson(parsed);
  }
}
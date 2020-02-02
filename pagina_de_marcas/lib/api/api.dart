import 'dart:core';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pagina_de_marcas/model/brand_response.dart';



const URL_BASE = "api-homolog-epocacosmeticosv2.mobfiq.com.br";

class Api{

  Future<List<BrandResponse>> getBrandList(bool onlySpotlights) async{

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
    }
    else{
      print("error ${response.body}");
    }


    return brandList;
  }
}
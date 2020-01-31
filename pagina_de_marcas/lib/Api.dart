import 'dart:core';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pagina_de_marcas/BrandResponse.dart';



const URL_BASE = "http://api-homolog-epocacosmeticosv2.mobfiq.com.br/";

class Api{

  Future<List<BrandResponse>> getBrandList() async{

    http.Response response = await http.get(
      "${URL_BASE}Search/BrandList?onlySpotlights=false"
    );

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
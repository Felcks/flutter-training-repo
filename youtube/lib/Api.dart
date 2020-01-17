import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:youtube/response/YoutubeSearchItemResponse.dart';
import 'dart:convert';

import 'package:youtube/response/YoutubeSearchResultResponse.dart';


//const CHAVE_YOUTUBE_API = "AIzaSyBVkOSc9KUaTNBNojx6kQC6wEag4MJbzck";
const CHAVE_YOUTUBE_API = "AIzaSyBQnwBrFGSCsXQ1ieqVW9KaePuNya7M2gY";
//const CHAVE_YOUTUBE_API = "AIzaSyBgcS7uRWDf5Kmw96l3MgqxdKcETUBWX2I";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  Future<YoutubeSearchResultResponse> pesquisa(String pesquisa) async{

    http.Response response = await http.get(
      "${URL_BASE}search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
//          "&channelId=$ID_CANAL"
          "&q=$pesquisa"
    );

    YoutubeSearchResultResponse youtubeSearchResultResponse;
    if(response.statusCode == 200){

      Map parsed = json.decode(response.body);
      youtubeSearchResultResponse = YoutubeSearchResultResponse.fromJson(parsed);
    }
    else{
      print("error ${response.body}");
    }


    return youtubeSearchResultResponse;
  }
}
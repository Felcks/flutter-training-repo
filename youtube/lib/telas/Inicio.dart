import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube/response/YoutubeSearchItemResponse.dart';
import 'package:youtube/response/YoutubeSearchResultResponse.dart';

import '../Api.dart';

class Inicio extends StatefulWidget {

  String pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  Api api = Api();

  Future<YoutubeSearchResultResponse> _listaVideo(String pesquisa){
    return api.pesquisa(pesquisa);
  }


  @override
  void initState() {
    super.initState();
    print("chamado 1 - initState");
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("chamado 2 - didChangeDependencies");
  }


  @override
  void didUpdateWidget(Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("chamado 2 - didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    print("chamado 4 - dispose");
  }

  @override
  Widget build(BuildContext context) {

    print("chamado 3 - build");

    return FutureBuilder(
      future: _listaVideo(widget.pesquisa),
      builder: (context, snapshot){

        String resultado = "";
        switch(snapshot.connectionState){
        // ignore: missing_return
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
            if(snapshot.hasError){
              resultado = "Error";
            }
            else{

              return ListView.separated(
                  itemCount: snapshot.data.items.length,
                  separatorBuilder: (context, index) =>  Divider(
                    height: 2,
                  ),
                  itemBuilder: (context, index){
                    YoutubeSearchItemResponse item = snapshot.data.items[index];

                    return GestureDetector(
                      onTap: (){
                        FlutterYoutube.playYoutubeVideoById(
                          apiKey: CHAVE_YOUTUBE_API,
                          videoId: item.id.videoId,
                          autoPlay: true,
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  item.snippet.thumbnails.high.url,
                                ),
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            child: ListTile(
                              title: Text(
                                item.snippet.title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              subtitle: Text(
                                item.snippet.channelTitle
                              ),
                            )
                          ),
                        ],
                      ),
                    );
                  }
              );
            }
            break;
        }
        return Center(
          child: Text(resultado),
        );
      },
    );
  }
}

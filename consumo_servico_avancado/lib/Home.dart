import 'package:consumo_servico_avancado/ListagemPost.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _urlBase = "https://jsonplaceholder.typicode.com/";

  Future<List<Post>> _recuperaPostagens() async {

    http.Response response = await http.get(_urlBase + "posts");
    var dadosJson = json.decode(response.body);

    //Essa linha funcionaria, mas é um passo desnecessário
    //var listagemPost = ListagemPost.fromJson(json.decode(response.body));


    List<Post> postagens = List();
    for( var post in dadosJson){
      Post p = Post.fromJson(post);
      postagens.add(p);
    }

    return postagens;
  }

  _post() async{

    Post post = Post(
      1,
      null,
      "foo",
      "bar"
    );

    print(json.encode(post.toJson()));

    http.Response response = await http.post(
        _urlBase + "posts",
      headers:  {
          "Content-type": "application/json; charset=UTF-8"
      },
      body: json.encode(post.toJson())
    );


    print("reposta ${response.statusCode} ${response.body}");
  }

  _put() async{

    Post post = Post(
        1,
        null,
        "foo",
        "bar"
    );

    print(json.encode(post.toJson()));

    http.Response response = await http.put(
        _urlBase + "posts/2",
        headers:  {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: json.encode(post.toJson())
    );


    print("reposta ${response.statusCode} ${response.body}");
  }

  _patch() async{

    Post post = Post(
        1,
        null,
        "foo",
        null
    );

    print(json.encode(post.toJson()));

    http.Response response = await http.patch(
        _urlBase + "posts/2",
        headers:  {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: json.encode(post.toJson())
    );


    print("reposta ${response.statusCode} ${response.body}");
  }

  _delete() async{

    http.Response response = await http.delete(
        _urlBase + "posts/2",
        headers:  {
          "Content-type": "application/json; charset=UTF-8"
        },
    );


    print("reposta ${response.statusCode} ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.white,
                  child: Text("Salvar"),
                  onPressed: _post,
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Text("Put"),
                  onPressed: _put,
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Text("Patch"),
                  onPressed: _patch,
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Text("Remover"),
                  onPressed: _delete,
                )
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _recuperaPostagens(),
                builder: (context, snapshot){

                  String resultado = "";
                  switch(snapshot.connectionState){
                  // ignore: missing_return
                    case ConnectionState.none:
                      print("none");
                      break;
                    case ConnectionState.waiting:
                      print("waiting");
                      return Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.red,
                              strokeWidth: 10,
                            ),
                            width: 80,
                            height: 80,
                          )
                      );
                      break;
                    case ConnectionState.active:
                      print("active");
                      break;
                    case ConnectionState.done:
                      print("done");
                      if(snapshot.hasError){
                        resultado = "Error";
                      }
                      else{
                        print("lista carregou");

                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index){

                              Post post = snapshot.data[index];

                              return ListTile(
                                title: Text(post.title),
                                subtitle: Text(post.id.toString()),
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
              ),
            )
          ],
        ),
      )
    );
  }
}

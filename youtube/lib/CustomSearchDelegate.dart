import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
      IconButton(
        icon: Icon(Icons.done),
        onPressed: (){
          close(context, query);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, "");
      },
    );

      //Volta normal sem animação
//    return IconButton(
//      icon: Icon(Icons.arrow_back),
//      onPressed: (){
//        close(context, "");
//      },
//    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query); //Essa linha aqui da erro pois eu nao poderia fechar a tela enquanto ha algo buildando
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> lista = List();

    if(query.isNotEmpty){

      lista = [
        "Android", "Android navegação", "IOS", "Jogos"
      ].where((texto) => texto.toUpperCase().startsWith(query.toUpperCase() )).toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              close(context, lista[index]);
            },
            title: Text(lista[index]),
          );
        },
      );
    }
    else{
      return Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    }
  }


  CustomSearchDelegate({String searchFieldLabel, TextInputType keyboardType, TextInputAction textInputAction: TextInputAction.search }){}

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: theme.primaryTextTheme.title.color)),
        primaryColor: theme.primaryColor,
        primaryIconTheme: theme.primaryIconTheme,
        primaryColorBrightness: theme.primaryColorBrightness,
        primaryTextTheme: theme.primaryTextTheme,
        textTheme: theme.textTheme.copyWith(
            title: theme.textTheme.title
                .copyWith(color: theme.primaryTextTheme.title.color)));
  }
}
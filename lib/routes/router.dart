import 'package:work/models/pokemons_model.dart';
import 'package:work/screens/home_page..dart';
import 'package:work/screens/search_page.dart';
import 'package:flutter/material.dart';

class MyRouter {
  Route? onGenerate(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/search':
        return MaterialPageRoute(
            builder: (context) => SearchPage(data: args as List<Pokemon>));
    }
  }
}

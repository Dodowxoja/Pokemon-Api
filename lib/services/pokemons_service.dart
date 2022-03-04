import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:work/core/constants/my_api.dart';
import 'package:work/models/pokemons_model.dart';

class PokemonsService {
  static Future<PokemonsModel> getData() async {
    Response res = await Dio().get(Constants.myApi);
    return PokemonsModel.fromJson(jsonDecode(res.data));
  }
}

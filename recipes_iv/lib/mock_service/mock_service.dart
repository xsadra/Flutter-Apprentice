import 'dart:convert';
import 'dart:math';

// 1
import 'package:chopper/chopper.dart';
// 2
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

import '../network/model_response.dart';
import '../network/recipe_model.dart';
import '../network/service_interface.dart';

class MockService implements ServiceInterface {
  late APIRecipeQuery _currentRecipes1;
  late APIRecipeQuery _currentRecipes2;
  Random nextRecipe = Random();

  void create() {
    loadRecipes();
  }

  void loadRecipes() async {
    // 4
    var jsonString = await rootBundle.loadString('assets/recipes1.json');
    // 5
    _currentRecipes1 = APIRecipeQuery.fromJson(jsonDecode(jsonString));
    jsonString = await rootBundle.loadString('assets/recipes2.json');
    _currentRecipes2 = APIRecipeQuery.fromJson(jsonDecode(jsonString));
  }

  @override
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      String query, int from, int to) {
    switch (nextRecipe.nextInt(2)) {
      case 0:
        return Future.value(Response(http.Response('Dummy', 200, request: null),
            Success<APIRecipeQuery>(_currentRecipes1)));
      case 1:
        return Future.value(Response(http.Response('Dummy', 200, request: null),
            Success<APIRecipeQuery>(_currentRecipes2)));
      default:
        return Future.value(Response(http.Response('Dummy', 200, request: null),
            Success<APIRecipeQuery>(_currentRecipes1)));
    }
  }
}

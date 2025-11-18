import 'package:currency_app/model/apitypes.dart';
import 'package:dio/dio.dart';
import '../services/dio_client.dart';

// class MealRepository {
//   final DioClient dioClient;

//   MealRepository(this.dioClient);

//   Future<List<SeaFood>> getSeafoodMeals() async {
//     try {
//       Response response = await dioClient.dio.get("filter.php?c=Seafood");

//       List mealsJson = response.data["meals"];

//       return mealsJson.map((meal) => SeaFood.fromJson(meal)).toList();
//     } catch (e) {
//       throw Exception("Failed to load meals: $e");
//     }
//   }
// }


class CategoriessRepository {
  final DioClient dioClient;

  CategoriessRepository(this.dioClient);

  Future<List<Categoriess>> getCategoriess() async {
    try {
      Response response = await dioClient.dio.get("categories.php");

      List categoriesList = response.data["categories"];

      return categoriesList
          .map((categoryJson) => Categoriess.fromJson(categoryJson))
          .toList();
    } catch (e) {
      throw Exception("Failed to load the categories: $e");
    }
  }
}




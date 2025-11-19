import 'package:currency_app/model/apitypes.dart';
// import 'package:dio/dio.dart';
import '../services/dio_client.dart';


class CategoriessRepository {
  final DioClient dioClient;

  CategoriessRepository(this.dioClient);

  Future<List<dynamic>> getCategories() async {
    final response = await dioClient.dio.get(
      "https://www.themealdb.com/api/json/v1/1/categories.php",
    );
    return response.data["categories"];
  }

  Future<List<dynamic>> getMealsByCategory(String category) async {
    final response = await dioClient.dio.get(
      "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category",
    );
    return response.data["meals"];
  }
}





class MealsRepository {
  final DioClient dioClient;

  MealsRepository(this.dioClient);

  /// Get meals inside a category (short data)
  Future<List<MealShort>> getMealsByCategory(String category) async {
    try {
      final response = await dioClient.dio.get(
        "filter.php",
        queryParameters: {"c": category},
      );

      List mealsJSON = response.data["meals"] ?? [];

      return mealsJSON.map((json) => MealShort.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to fetch meals: $e");
    }
  }

  /// Get full meal details
  Future<MealFull> getMealDetails(String id) async {
    try {
      final response = await dioClient.dio.get(
        "lookup.php",
        queryParameters: {"i": id},
      );

      return MealFull.fromJson(response.data["meals"][0]);
    } catch (e) {
      throw Exception("Failed to fetch meal details: $e");
    }
  }
}




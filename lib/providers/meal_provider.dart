import 'package:currency_app/model/apitypes.dart';
import 'package:currency_app/repositories/sea_food_repositories.dart';
import 'package:flutter/material.dart';



// class MealProvider extends ChangeNotifier {
//   final MealRepository repository;

//   MealProvider(this.repository);

//   List<SeaFood> meals = [];
//   bool isLoading = false;
//   String? errorMessage;

//   Future<void> fetchMeals() async {
//     try {
//       isLoading = true;
//       notifyListeners();

//       meals = await repository.getSeafoodMeals();

//       isLoading = false;
//       notifyListeners();
//     } catch (e) {
//       errorMessage = e.toString();
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }


class CategoriesProvider extends ChangeNotifier {
  final CategoriessRepository repository;

  CategoriesProvider(this.repository);

  List <Categoriess> categories =[];
  bool isLoading = false;
  String? errorMessage;


  Future<void> fetchCategories() async {
    try {
      isLoading = true;
      notifyListeners();
      categories = await repository.getCategoriess();
      isLoading = false;

      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      isLoading =false;
      notifyListeners();
    }
  }
}



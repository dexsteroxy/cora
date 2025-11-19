import 'package:flutter/material.dart';
import '../repositories/sea_food_repositories.dart';

class CategoriesProvider extends ChangeNotifier {
  final CategoriessRepository repository;

  CategoriesProvider(this.repository) {
    fetchCategories();
  }

  List<dynamic> categories = [];
  List<dynamic> meals = [];

  String activeCategory = "";

  bool isLoadingCategories = true;
  bool isLoadingMeals = false;

  Future<void> fetchCategories() async {
    isLoadingCategories = true;
    notifyListeners();

    categories = await repository.getCategories();

    // set default active category
    if (categories.isNotEmpty) {
      activeCategory = categories[0]["strCategory"];
      fetchMeals(activeCategory);
    }

    isLoadingCategories = false;
    notifyListeners();
  }

  void setActiveCategory(String category) {
    activeCategory = category;
    fetchMeals(category);
    notifyListeners();
  }

  Future<void> fetchMeals(String category) async {
    isLoadingMeals = true;
    notifyListeners();

    meals = await repository.getMealsByCategory(category);

    isLoadingMeals = false;
    notifyListeners();
  }
}

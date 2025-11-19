import 'dart:convert';

import 'package:flutter/material.dart';
import '../repositories/sea_food_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

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



class BookingProvider with ChangeNotifier {
  List<Map<String, dynamic>> _bookedMeals = [];

  List<Map<String, dynamic>> get bookedMeals => _bookedMeals;

  BookingProvider() {
    loadFromPrefs();
  }

  Future<void> loadFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString('bookedMeals');

      if (data != null && data.isNotEmpty) {
        // Decode JSON safely
        final List<dynamic> decoded = jsonDecode(data);

        // Convert each dynamic item into Map<String, dynamic>
        _bookedMeals = decoded
            .map<Map<String, dynamic>>((item) => Map<String, dynamic>.from(item))
            .toList();

        notifyListeners();
      }
    } catch (e) {
      print("Error loading booked meals: $e");
      _bookedMeals = []; // reset if error occurs
      notifyListeners();
    }
  }

  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bookedMeals', jsonEncode(_bookedMeals));
  }

  void toggleMeal(Map<String, dynamic> meal) {
    if (_bookedMeals.any((m) => m["idMeal"] == meal["idMeal"])) {
      _bookedMeals.removeWhere((m) => m["idMeal"] == meal["idMeal"]);
    } else {
      _bookedMeals.add(meal);
    }
    saveToPrefs();
    notifyListeners();
  }

  void removeMeal(String id) {
    _bookedMeals.removeWhere((m) => m["idMeal"] == id);
    saveToPrefs();
    notifyListeners();
  }

  bool isMealBooked(String id) {
    return _bookedMeals.any((meal) => meal["idMeal"] == id);
  }
}
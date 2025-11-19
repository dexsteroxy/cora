

class Categoriess {
  final String id;
  final String name;
  final String thumbnail;

  Categoriess({required this.id, required this.name, required this.thumbnail});

  factory Categoriess.fromJson(Map<String, dynamic> json) {
    return Categoriess(
      id: json["idCategory"],
      name: json["strCategory"],
      thumbnail: json["strCategoryThumb"]
    );
  }
}





class MealDetails {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnail;
  final String youtube;
  final String description;
  final List<String> ingredients;

  MealDetails({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
    required this.youtube,
    required this.description,
    required this.ingredients,
  });

  factory MealDetails.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = json["strIngredient$i"];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }

    return MealDetails(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      category: json['strCategory'] ?? '',
      area: json['strArea'] ?? '',
      instructions: json['strInstructions'] ?? '',
      thumbnail: json['strMealThumb'] ?? '',
      youtube: json['strYoutube'] ?? '',
      description: json['strMeal'] ?? '',
      ingredients: ingredients,
    );
  }
}




class MealShort {
  final String id;
  final String name;
  final String thumbnail;

  MealShort({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  factory MealShort.fromJson(Map<String, dynamic> json) {
    return MealShort(
      id: json["idMeal"],
      name: json["strMeal"],
      thumbnail: json["strMealThumb"],
    );
  }
}

class MealFull {
  final String id;
  final String name;
  final String instructions;
  final String category;
  final String area;
  final String thumbnail;

  MealFull({
    required this.id,
    required this.name,
    required this.instructions,
    required this.category,
    required this.area,
    required this.thumbnail,
  });

  factory MealFull.fromJson(Map<String, dynamic> json) {
    return MealFull(
      id: json["idMeal"],
      name: json["strMeal"],
      instructions: json["strInstructions"],
      category: json["strCategory"],
      area: json["strArea"],
      thumbnail: json["strMealThumb"],
    );
  }
}


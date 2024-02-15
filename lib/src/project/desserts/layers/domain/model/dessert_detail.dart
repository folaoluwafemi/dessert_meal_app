import 'package:dessert_meal_app/src/project/desserts/layers/domain/model/dessert.dart';

class DessertDetail extends Dessert {
  final String category;
  final String area;
  final String instructions;
  final String tags;
  final String videoUrl;
  final List<IngredientMeasure> ingredients;

  const DessertDetail({
    required super.id,
    required super.name,
    required super.imageUrl,
    required this.category,
    required this.area,
    required this.instructions,
    required this.tags,
    required this.videoUrl,
    required this.ingredients,
  });

  factory DessertDetail.fromMap(Map<String, dynamic> map) {
    return DessertDetail(
      id: map['idMeal'] as String,
      name: map['strMeal'] as String,
      imageUrl: map['strMealThumb'] as String,
      category: map['strCategory'] as String? ?? '',
      area: map['area'] as String? ?? 'Thai',
      instructions: map['strInstructions'] as String? ?? '',
      tags: map['strTags'] as String? ?? '',
      videoUrl: map['strYoutube'] as String? ?? '',
      ingredients: parseIngredientMeasureFromMap(map),
    );
  }

  static List<IngredientMeasure> parseIngredientMeasureFromMap(
    Map<String, dynamic> map,
  ) {
    final List<IngredientMeasure> ingredientMeasures = [];

    for (int i = 1; i < 20; i++) {
      final String ingredientKey = 'strIngredient$i';
      final String measureKey = 'strMeasure$i';
      final String? ingredient = map[ingredientKey] as String?;
      final String? measure = map[measureKey] as String?;

      if (ingredient == null || measure == null) continue;

      ingredientMeasures.add(
        IngredientMeasure(
          ingredient: ingredient,
          measure: measure,
        ),
      );
    }

    return ingredientMeasures;
  }
}

class IngredientMeasure {
  final String ingredient;
  final String measure;

  const IngredientMeasure({
    required this.ingredient,
    required this.measure,
  });
}

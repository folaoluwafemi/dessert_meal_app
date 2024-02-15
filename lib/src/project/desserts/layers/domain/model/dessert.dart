class Dessert {
  final String id;
  final String name;
  final String imageUrl;

  const Dessert({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Dessert.fromMap(Map<String, dynamic> map) {
    return Dessert(
      id: map['idMeal'] as String,
      name: map['strMeal'] as String,
      imageUrl: map['strMealThumb'] as String,
    );
  }
}

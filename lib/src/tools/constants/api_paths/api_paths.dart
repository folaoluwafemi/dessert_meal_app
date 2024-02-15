abstract final class ApiPaths {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';
  static const String desserts = '$_baseUrl/filter.php?c=Dessert';

  static String dessertDetail(String id) => '$_baseUrl/lookup.php?i=$id';
}

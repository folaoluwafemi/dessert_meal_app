import 'package:dessert_meal_app/src/entities/desserts/dessert_barrel.dart';
import 'package:dessert_meal_app/src/tools/tools_barrel.dart';
import 'package:dio/dio.dart';

part 'network_dessert_source.dart';

abstract interface class DessertsSource {
  Future<List<Dessert>> fetchDesserts();

  Future<DessertDetail> fetchDessertDetail(String id);
}

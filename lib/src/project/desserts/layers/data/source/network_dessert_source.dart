part of 'desserts_source.dart';

class NetworkDessertSource implements DessertsSource {
  final Dio _networkApi;

  NetworkDessertSource({
    Dio? dio,
  }) : _networkApi = dio ?? Dio();

  @override
  Future<List<Dessert>> fetchDesserts() async {
    final Response response = await _networkApi.get(ApiPaths.desserts);

    final List data = response.data['meals'];

    return data
        .map<Dessert>((e) => Dessert.fromMap((e as Map).cast()))
        .toList();
  }

  @override
  Future<DessertDetail> fetchDessertDetail(String id) async {
    final Response response = await _networkApi.get(ApiPaths.dessertDetail(id));

    final Map<String, dynamic> data = response.data['meals'][0];

    return DessertDetail.fromMap(data);
  }
}

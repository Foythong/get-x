import 'package:get/get.dart';

import '../models/api_model.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Api.fromJson(map);
      if (map is List) return map.map((item) => Api.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://dummyjson.com/';
  }

  Future<Api?> getApi() async {
    final response = await get('products');
    return response.body;
  }

  // Future<Response<Api>> postApi(Api api) async => await post('api', api);
  // Future<Response> deleteApi(int id) async => await delete('api/$id');
}

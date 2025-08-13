import '../../../core/helpers/network/network_api_services.dart';

class PostRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> fetchAllProducts() async {
    dynamic response =
        await _apiService.getApi("https://fakestoreapi.com/products");
    return response;
  }
  Future<dynamic> fetchSingleProduct(String id) async {
    dynamic response =
    await _apiService.getApi("https://fakestoreapi.com/products/1");
    return response;
  }
}

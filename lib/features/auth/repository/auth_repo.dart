import '../../../core/helpers/network/network_api_services.dart';

class AuthRepository {
  final _apiService = NetworkApiServices();
  Future<dynamic> fetchAllProducts({
    required String userName,
    required String password,
  }) async {
    var data = {"username": userName, "password": password};
    dynamic response =
        await _apiService.postApi(data, "https://fakestoreapi.com/auth/login");
    return response;
  }
}

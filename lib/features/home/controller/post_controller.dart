import 'package:get/get.dart';
import '../model/post_model.dart';
import '../repositoy/post_repo.dart';

class PostController extends GetxController {
  var postModel = PostModel().obs;
  var postList = <PostModel>[].obs;
  var filteredList = <PostModel>[].obs;
  var isLoading = true.obs;
  var isFavorite = false.obs;
  final _api = PostRepository();

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredList.value = postList;
    } else {
      filteredList.value = postList
          .where((product) =>
      product.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    }
  }

  Future<void> fetchAllProducts() async {
    try {
      isLoading.value = true;
      final response = await _api.fetchAllProducts();
      if (response != null && response['status'] == 200) {
        var list = response['data'] as List;
        postList.value = list.map((e) => PostModel.fromJson(e)).toList();
        filteredList.value = postList;
      }
    } catch (_) {} finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchSingleProduct(String id) async {
    try {
      isLoading.value = true;
      final response = await _api.fetchSingleProduct(id);
      if (response != null && response['status'] == 200) {
        postModel.value = PostModel.fromJson(response['data']);
      }
    } catch (_) {} finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }
}

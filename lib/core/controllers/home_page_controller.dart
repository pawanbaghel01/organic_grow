import 'package:get/get.dart';
import 'package:organic_grow/core/models/category_model.dart';
import 'package:organic_grow/core/models/product_model.dart';
import 'package:organic_grow/core/services/api_services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  var categories = <Category>[].obs;
  var featuredProducts = <Product>[].obs;
  var banners = <String>[].obs;
  var currentCarouselIndex = 0.obs;
  var isLoading = true.obs;
  var isRefreshing = false.obs;

  // ✅ Own RefreshController here
  final RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    try {
      isLoading.value = true;

      // Fetch all data
      final categoriesData = await ApiService.fetchCategories();
      final productsData = await ApiService.fetchFeaturedProducts();
      final bannersData = await ApiService.fetchBanners();

      // Update observable variables
      categories.assignAll(categoriesData);
      featuredProducts.assignAll(productsData);
      banners.assignAll(bannersData);

      isLoading.value = false;
      isRefreshing.value = false;

      // ✅ Stop refresher if pull-to-refresh triggered it
      refreshController.refreshCompleted();
    } catch (e) {
      isLoading.value = false;
      isRefreshing.value = false;
      refreshController.refreshFailed(); // ✅ mark refresh as failed
      Get.snackbar('Error', 'Failed to load data: $e');
    }
  }

  Future<void> refreshData() async {
    isRefreshing.value = true;
    await fetchHomeData();
  }

  void updateCarouselIndex(int index) {
    currentCarouselIndex.value = index;
  }

  @override
  void onClose() {
    refreshController.dispose(); // ✅ clean up
    super.onClose();
  }
}

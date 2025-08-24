import 'package:organic_grow/core/controllers/home_page_controller.dart';
import 'package:organic_grow/utils/imports.dart';
import 'package:organic_grow/views/home_screen/widget/carousel_slider_widget.dart';
import 'package:organic_grow/views/home_screen/widget/categories_section_widget.dart';
import 'package:organic_grow/views/home_screen/widget/featured_product_widget.dart';
import 'package:organic_grow/views/home_screen/widget/special_offer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Organic Grow'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: SmartRefresher(
        controller: homeController.refreshController, 
        onRefresh: homeController.refreshData,        
        enablePullDown: true,
        enablePullUp: false,
        header: const WaterDropHeader(waterDropColor: Colors.green),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => _buildCarouselSlider()),
              const SizedBox(height: 16),
              Obx(() => _buildCategoriesSection()),
              const SizedBox(height: 24),
              Obx(() => _buildFeaturedProductsSection()),
              const SizedBox(height: 24),
              Obx(() => _buildSpecialOffersSection()),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselSlider() =>
      homeController.isLoading.value ? CarouselSliderWidgetShimmer() : CarouselSliderWidget();

  Widget _buildCategoriesSection() =>
      homeController.isLoading.value ? CategoriesSectionWidgetShimmer() : CategoriesSectionWidget();

  Widget _buildFeaturedProductsSection() =>
      homeController.isLoading.value ? FeaturedProductWidgetShimmer() : FeaturedProductWidget();

  Widget _buildSpecialOffersSection() =>
      homeController.isLoading.value ? SpecialOffersWidgetShimmer() : SpecialOffersWidget();
}

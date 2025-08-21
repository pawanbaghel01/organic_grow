
import 'package:http/http.dart' as http;
import 'package:organic_grow/core/models/category_model.dart';
import 'package:organic_grow/core/models/product_model.dart';

class ApiService {
  static const String baseUrl = 'https://your-api-url.com'; // Replace with your API

  // Fetch categories
  static Future<List<Category>> fetchCategories() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    
    // Simulated API response
    final response = [
      {'id': '1', 'name': 'Vegetables', 'icon': 'local_florist'},
      {'id': '2', 'name': 'Fruits', 'icon': 'emoji_food_beverage'},
      {'id': '3', 'name': 'Juices', 'icon': 'local_drink'},
      {'id': '4', 'name': 'Spices', 'icon': 'kitchen'},
      {'id': '5', 'name': 'Herbs', 'icon': 'spa'},
    ];
    
    return response.map((json) => Category.fromJson(json)).toList();
  }

  // Fetch featured products
  static Future<List<Product>> fetchFeaturedProducts() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    
    // Simulated API response
    final response = [
      {
        'id': '1',
        'name': 'Organic Tomatoes',
        'price': 3.99,
        'image': 'assets/tomatoes.jpg',
        'rating': 4.8
      },
      {
        'id': '2',
        'name': 'Fresh Avocados',
        'price': 5.49,
        'image': 'assets/avocado.jpg',
        'rating': 4.6
      },
      {
        'id': '3',
        'name': 'Organic Spinach',
        'price': 2.99,
        'image': 'assets/spinach.jpg',
        'rating': 4.7
      },
      {
        'id': '4',
        'name': 'Fresh Strawberries',
        'price': 4.99,
        'image': 'assets/strawberries.jpg',
        'rating': 4.9
      },
    ];
    
    return response.map((json) => Product.fromJson(json)).toList();
  }

  // Fetch banners
  static Future<List<String>> fetchBanners() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    
    return [
      'assets/banner1.jpg',
      'assets/banner2.jpg',
      'assets/banner3.jpg',
    ];
  }
}
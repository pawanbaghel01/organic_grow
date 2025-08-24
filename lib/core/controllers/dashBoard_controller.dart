import 'package:get/get.dart';
import 'package:organic_grow/views/home_screen/home_screen.dart';
import 'package:organic_grow/views/login_screen/login_screen.dart';

class DashBoardController extends GetxController {
  var selectedIndex = 2.obs;

  final screens = [
    HomeScreen(),
    LoginScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void onTabChange(int index) {
    selectedIndex.value = index;
  }
}

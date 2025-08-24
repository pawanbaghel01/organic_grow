import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:organic_grow/core/controllers/dashBoard_controller.dart';

class DashBoardScreen extends GetView<DashBoardController> {
  DashBoardScreen({super.key}) {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          index: controller.selectedIndex.value,
          height: 60,
          color: Colors.purple,
          buttonBackgroundColor: Colors.purple,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          items: const [
            Icon(Icons.person, size: 30, color: Colors.white),
            Icon(Icons.category, size: 30, color: Colors.white),
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.card_travel, size: 30, color: Colors.white),
            Icon(Icons.settings, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            controller.onTabChange(index);
          },
        ),
      ),
    );
  }
}

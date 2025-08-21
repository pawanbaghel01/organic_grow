import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organic_grow/routing/get_pages.dart';
import 'package:organic_grow/routing/route_constant.dart';

void main() {
  runApp(OrganicGrowApp());
}

class OrganicGrowApp extends StatelessWidget {
  const OrganicGrowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Organic Grow',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConstant.splashPage,
      getPages: getPages,
    );
  }
}

import 'package:get/get.dart';
import 'package:organic_grow/routing/route_constant.dart';
import 'package:organic_grow/views/dashBoard_screen.dart';
import 'package:organic_grow/views/home_screen/home_screen.dart';
import 'package:organic_grow/views/login_screen/login_screen.dart';
import 'package:organic_grow/views/splash_screen.dart';

final List<GetPage> getPages = [
   GetPage( 
    name: RouteConstant.loginPage,
     page: ()=> LoginScreen(),
     transition: Transition.rightToLeft,
     ),
  GetPage( 
    name: RouteConstant.homePage,
     page: ()=> HomeScreen(),
     transition: Transition.rightToLeft,
     ),
     GetPage( 
    name: RouteConstant.splashPage,
     page: ()=> SplashScreen(),
     transition: Transition.rightToLeft,
     ),
    GetPage( 
     name: RouteConstant.dashBoardPae,
     page: ()=> DashBoardScreen(),
     transition: Transition.rightToLeft,
    ),
];

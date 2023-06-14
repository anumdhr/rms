import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rm_ui/controller/count_controller.dart';
import 'package:rm_ui/screen/about_us/about_us.dart';
import 'package:rm_ui/screen/home_screen/home_screen.dart';
import 'package:rm_ui/screen/home_screen/widgets/kitchen_setup/add_food/add_food.dart';
import 'package:rm_ui/screen/home_screen/widgets/my_profile/my_profile.dart';
import 'package:rm_ui/screen/login_screen/login_screen.dart';
import 'package:rm_ui/screen/signin_page/signin_page.dart';
import 'package:rm_ui/screen/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(CountController());
    return ScreenUtilInit(
      designSize: const Size(1024, 768),
      builder: (BuildContext context, Widget? child) {
        return   MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Restaurant Management System',

          home:SplashScreen() ,
        );
      },
    );
  }
}

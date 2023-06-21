
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rm_ui/screen/home_screen/home_screen.dart';

import 'controller/count_controller.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
// final decodedToken = await JwtDecoder.decode(ApiUrl.token);
// print('asdsd : $decodedToken');
// final expiredTime = JwtDecoder.getExpirationDate(ApiUrl.token);
//   print('asdsd : $expiredTime)');

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
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
        return   const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Restaurant Management System',

          home:MyHomePage() ,
        );
      },
    );
  }
}

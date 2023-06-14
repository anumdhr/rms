import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/controller/count_controller.dart';
import 'package:rm_ui/models/ordered_model/ordered_model.dart';
import 'package:rm_ui/screen/home_screen/widgets/food_tab/food_tab.dart';
import 'package:rm_ui/screen/home_screen/widgets/food_tab/order_serve_tab.dart';
import 'package:rm_ui/screen/home_screen/widgets/kitchen_setup/kitchen_setup.dart';
import 'package:rm_ui/screen/home_screen/widgets/modify_table/modify_table.dart';
import 'package:rm_ui/screen/home_screen/widgets/ordered_tab/ordered_tab.dart';
import 'package:rm_ui/screen/home_screen/widgets/show_dialog.dart';
import 'package:rm_ui/screen/home_screen/widgets/switch_bar.dart';

import '../../common_widgets/custom_app_bar.dart';
int tabIndex = 0;
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    this.typeController,
  }) : super(key: key);
  final TabController? typeController;

  // String timeString;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int foodIndex = 0;
  int counter = 0;
  final cc = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFECEC),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: "Restaurant Management System",
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KitchenSetUp(),
                ));
          },
          colorChange: true,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 50,
              width: 714,
              margin: const EdgeInsets.symmetric(vertical: 18),
              padding:
                  const EdgeInsets.only(top: 3, left: 2, right: 2, bottom: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xffF6921E),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SwitchBar(
                    onTap: () {
                      setState(() {
                        tabIndex = 0;
                      });
                    },
                    text: " TABLE",
                    containerColor:
                        tabIndex == 0 ? const Color(0xff831529) : Colors.white,
                    color:
                        tabIndex == 0 ? Colors.white : const Color(0xff831529),
                  ),
                  SwitchBar(
                    onTap: () {
                      setState(() {
                        tabIndex = 1;
                      });
                    },
                    text: "FOOD",
                    containerColor:
                        tabIndex == 1 ? const Color(0xff831529) : Colors.white,
                    color:
                        tabIndex == 1 ? Colors.white : const Color(0xff831529),
                  ),
                  SwitchBar(
                    onTap: () {
                      setState(() {
                        tabIndex = 2;
                      });
                    },
                    text: "SERVE/PACK",
                    containerColor:
                        tabIndex == 2 ? const Color(0xff831529) : Colors.white,
                    color:
                        tabIndex == 2 ? Colors.white : const Color(0xff831529),
                  ),
                  SwitchBar(
                    onTap: () {
                      setState(() {
                        tabIndex = 3;
                      });
                    },
                    text: "ORDERED",
                    containerColor:
                        tabIndex == 3 ? const Color(0xff831529) : Colors.white,
                    color:
                        tabIndex == 3 ? Colors.white : const Color(0xff831529),
                  ),
                ],
              ),
            ),
          ),
          if (tabIndex == 0)  ModifyTable(
            onTap: () {
              setState(() {
                tabIndex=1;


              });
            },

          ),
          if (tabIndex == 1) FoodTab(foodIndex: foodIndex),
          if (tabIndex == 2)  OrderServeTab(
            onTap: () {
              setState(() {
                tabIndex=3;

              });
            },
          ),
          if (tabIndex == 3) OrderedTab(),
        ],
      ),
    );
  }
}

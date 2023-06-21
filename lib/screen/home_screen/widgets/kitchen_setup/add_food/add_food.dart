import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/controller/count_controller.dart';
import 'package:rm_ui/screen/about_us/about_us.dart';
import 'package:rm_ui/screen/home_screen/home_screen.dart';
import 'package:rm_ui/screen/home_screen/widgets/kitchen_setup/add_food/foodprovider_list_setup.dart';
import 'package:rm_ui/screen/home_screen/widgets/kitchen_setup/add_food/setup_page.dart';

import '../../../../../common_widgets/floating_button.dart';
import '../../../../../common_widgets/kitchen_setup_textfield.dart';
import '../../../../../models/flavor_list_model/flavor_list_model.dart';
import '../../../../../models/foodprovider_model/foodprovider_model.dart';
import '../../../../../models/kitchen_setup_model/kitchen_model.dart';
import '../../../../../models/ordered_model/ordered_model.dart';
import 'add_food_menu.dart';
import 'chef_setup.dart';
import 'create_kitchen.dart';
import 'flavor_list_setup.dart';
import 'kitchen_list_setup.dart';
/*
yo menu icon vitra kitchen setup vitra ko (ADD FOOD) vitra everything cover gareko cha
 */

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final cc = Get.put(CountController());

  var value1 = false;
  TextEditingController kitchenName = TextEditingController();
  TextEditingController address = TextEditingController();

  TextEditingController flavorName = TextEditingController();
  TextEditingController remarks = TextEditingController();
  TextEditingController providerName = TextEditingController();
  TextEditingController shortName = TextEditingController();
  TextEditingController providerAddress = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCD9B0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(() {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                cc.tabIndex.value = index;
                                if (cc.tabIndex.value == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MyHomePage(),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                decoration: BoxDecoration(
                                  color: cc.tabIndex.value == index ? Colors.white : Colors.transparent,
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(kitchenSetUpModel[index].image),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        kitchenSetUpModel[index].text,
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff831529),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(width: 10),
                          itemCount: kitchenSetUpModel.length),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (cc.tabIndex.value == 0) const AddFoodMenu(),
              if (cc.tabIndex.value == 2)
                Setup(
                  kitchenName: kitchenName,
                  address: address,
                  value1: value1,
                  flavorName: flavorName,
                  remarks: remarks,
                  providerName: providerName,
                  shortName: shortName,
                  providerAddress: providerAddress,
                  phoneNumber: phoneNumber,
                  description: description,
                ),
              if (cc.tabIndex.value == 3) AboutUsPage(),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: Color(0xffFCD9B0),
                  child: Text(
                    "Copyright © Emerge Infosys | All Rights Reserved 2023.",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}


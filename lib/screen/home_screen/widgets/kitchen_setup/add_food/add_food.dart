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

import '../../../../../common_widgets/floating_button.dart';
import '../../../../../common_widgets/kitchen_setup_textfield.dart';
import '../../../../../models/ordered_model/ordered_model.dart';
import 'add_food_menu.dart';
import 'chef_setup.dart';
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
                                        style: const TextStyle(color: Colors.black),
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
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
                    margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SETUP LIST",
                                style: GoogleFonts.roboto(
                                  color: const Color(0xff831529),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: ListView.separated(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              cc.setIndex.value = index;
                                            },
                                            child: Container(
                                              // width: 40,
                                              height: 40,
                                              margin: const EdgeInsets.only(top: 5),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: cc.setIndex.value == index ? Color(0xff831529) : Color(0xffFFDEE6),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Text(setUpModel[index].text),
                                            ),
                                          ),
                                          Positioned(
                                            left: 5,
                                            bottom: 5,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 15,
                                              child: SvgPicture.asset(setUpModel[index].image),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 15,
                                      );
                                    },
                                    itemCount: setUpModel.length),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 2,
                          color: const Color(0xffBCBCBC).withOpacity(0.5),
                        ),
                        if (cc.setIndex.value == 0)
                          Expanded(
                            flex: 4,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              cc.kitchenIndex.value = 0;
                                            },
                                            child: Text(
                                              "Create Kitchen  ",
                                              style: GoogleFonts.roboto(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: cc.kitchenIndex.value == 0 ? const Color(0xff831529) : const Color(0xffFFDEE6),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 2,
                                            color: const Color(0xffBCBCBC).withOpacity(0.5),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              cc.kitchenIndex.value = 1;
                                            },
                                            child: Text(
                                              "  Kitchen List",
                                              style: GoogleFonts.roboto(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: cc.kitchenIndex.value == 1 ? const Color(0xff831529) : const Color(0xffFFDEE6),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (cc.kitchenIndex.value == 0)
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SetUpTextField(
                                                  controller: kitchenName,
                                                  text: "Kitchen Name",
                                                  hintText: "Type Here...",
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SetUpTextField(
                                                  controller: address,
                                                  text: "Address",
                                                  hintText: "Type Here...",
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                    // width: 350,
                                                    // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(12),
                                                      color: const Color(0xffFFDFE6),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Multi Chef",
                                                          style: GoogleFonts.roboto(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w400,
                                                            color: const Color(0xff831529),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Transform.scale(
                                                            scale: 0.8,
                                                            child: CupertinoSwitch(
                                                              activeColor: const Color(0xff831529),
                                                              trackColor: const Color(0xffFFB7C4),
                                                              thumbColor: const Color(0xffffffff),
                                                              value: value1,
                                                              onChanged: (value) {
                                                                setState(
                                                                  () {
                                                                    value1 = value;
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      if (cc.kitchenIndex.value == 1) const KitchenListSetup(),
                                    ],
                                  ),
                                ),
                                if (cc.kitchenIndex.value == 0)
                                  const Positioned(
                                    bottom: 15,
                                    right: 25,
                                    child: FloatingButton(text: "ADD KITCHEN"),
                                  ),
                              ],
                            ),
                          ),
                        if (cc.setIndex.value == 1)
                          ChefSetUp(),
                        if (cc.setIndex.value == 2)
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              cc.flavorIndex.value = 0;
                                            },
                                            child: Text(
                                              "Create Flavor  ",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: cc.flavorIndex.value == 0 ? const Color(0xff831529) : const Color(0xffFFDEE6),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 1,
                                            color: const Color(0xffBCBCBC).withOpacity(0.5),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              cc.flavorIndex.value = 1;
                                            },
                                            child: Text(
                                              "  Flavor List",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: cc.flavorIndex.value == 1 ? const Color(0xff831529) : const Color(0xffFFDEE6),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      if (cc.flavorIndex.value == 0)
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SetUpTextField(
                                                    controller: flavorName,
                                                    text: "Flavor Name",
                                                    hintText: "Type Here",
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.transparent,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SetUpTextField(controller: remarks, text: "Remarks", hintText: "Type Here"),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.transparent,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (cc.flavorIndex.value == 1) const FlavorListSetup(),
                                    ],
                                  ),
                                  const Positioned(
                                    bottom: 15,
                                    right: 25,
                                    child: FloatingButton(text: "ADD Flavor"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (cc.setIndex.value == 3)
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              cc.foodProviderIndex.value = 0;
                                            },
                                            child: Text(
                                              "Create Food Provider  ",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20.sp,
                                                color: cc.foodProviderIndex.value == 0 ? const Color(0xff831529) : const Color(0xffFFDFE6),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                            width: 1,
                                            color: const Color(0xffBCBCBC).withOpacity(0.5),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              cc.foodProviderIndex.value = 1;
                                            },
                                            child: Text(
                                              "  Food Provider List",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20.sp,
                                                color: cc.foodProviderIndex.value == 1 ? const Color(0xff831529) : const Color(0xffFFDFE6),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (cc.foodProviderIndex.value == 0)
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          CircleAvatar(
                                                              backgroundColor: const Color(0xff831529),
                                                              radius: 90,
                                                              child: Center(
                                                                child: SvgPicture.asset(
                                                                  "assets/images/RM Logo_RM Logo 1.svg",
                                                                  height: 90,
                                                                  width: 90,
                                                                ),
                                                              )),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 15,
                                                                backgroundColor: Colors.red,
                                                                child: SvgPicture.asset(
                                                                  "assets/images/AboutIcon.svg",
                                                                ),
                                                              ),
                                                              CircleAvatar(
                                                                radius: 15,
                                                                backgroundColor: Colors.red,
                                                                child: SvgPicture.asset(
                                                                  "assets/images/AboutIcon.svg",
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          FoodProvTextField(hintText: 'Type Here...', controller: providerName, text: "Provider Name"),
                                                          FoodProvTextField(text: "Short Name", hintText: "Type Here...", controller: shortName),
                                                          FoodProvTextField(text: "Address ", hintText: "Type Here...", controller: providerAddress),
                                                          FoodProvTextField(text: "Phone Number", hintText: "Type Here...", controller: phoneNumber),
                                                          FoodProvTextField(text: "Description", hintText: "Less Than 36 Letters", controller: description),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (cc.foodProviderIndex.value == 1) FoodProviderListSetUp(),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    right: 25,
                                    child: FloatingButton(
                                      text: "ADD PROVIDER",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              if (cc.tabIndex.value == 3) AboutUsPage(),
            ],
          );
        }),
      ),
    );
  }
}


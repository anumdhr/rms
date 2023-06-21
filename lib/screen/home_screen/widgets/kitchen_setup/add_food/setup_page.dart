import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common_widgets/floating_button.dart';
import '../../../../../common_widgets/kitchen_setup_textfield.dart';
import '../../../../../controller/count_controller.dart';
import '../../../../../models/flavor_list_model/flavor_list_model.dart';
import '../../../../../models/foodprovider_model/foodprovider_model.dart';
import '../../../../../models/kitchen_setup_model/kitchen_model.dart';
import '../../../../../models/ordered_model/ordered_model.dart';
import 'chef_setup.dart';
import 'create_food_provider.dart';
import 'create_kitchen.dart';
import 'flavor_list_setup.dart';
import 'foodprovider_list_setup.dart';
import 'kitchen_list_setup.dart';

class Setup extends StatelessWidget {
  Setup({
    super.key,
    required this.kitchenName,
    required this.address,
    required this.value1,
    required this.flavorName,
    required this.remarks,
    required this.providerName,
    required this.shortName,
    required this.providerAddress,
    required this.phoneNumber,
    required this.description,
  });

  final cc = Get.find<CountController>();
  final TextEditingController kitchenName;
  final TextEditingController address;
  final bool value1;
  final TextEditingController flavorName;
  final TextEditingController remarks;
  final TextEditingController providerName;
  final TextEditingController shortName;
  final TextEditingController providerAddress;
  final TextEditingController phoneNumber;
  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Expanded(
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
                    ListView.separated(
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
                                  child: Text(
                                    setUpModel[index].text,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: cc.setIndex.value == index ? Color(0xffFFFFFF) : Color(0xff831529),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 5,
                                bottom: -2,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 22,
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
                        itemCount: setUpModel.length)
                  ],
                ),
              ),
              Container(
                width: 2,
                color: const Color(0xffBCBCBC).withOpacity(0.5),
              ),
              if (cc.setIndex.value == 0)

              ///kitchen
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
                                    overflow: TextOverflow.ellipsis,
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
                                    debugPrint('clicked');
                                    cc.kitchenIndex.value = 1;
                                  },
                                  child: Text(
                                    "  Kitchen List",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: cc.kitchenIndex.value == 1 ? const Color(0xff831529) : const Color(0xffFFDEE6),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if (cc.kitchenIndex.value == 0) CreateKitchen(kitchenName: kitchenName, address: address, value1: value1),
                            if (cc.kitchenIndex.value == 1) const KitchenListSetup(),
                          ],
                        ),
                      ),
                      if (cc.kitchenIndex.value == 0)
                        Positioned(
                          bottom: 15,
                          right: 25,
                          child: FloatingButton(
                            text: "ADD KITCHEN",
                            onTap: () {
                              if (kitchenName.text.isEmpty && address.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Empty Content"),
                                  ),
                                );
                              } else {
                                kitchenListModel.add(KitchenListModel(kitchenName: kitchenName.text, address: address.text));
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Shown")));

                                kitchenName.clear();
                                address.clear();
                              }
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              if (cc.setIndex.value == 1)

              ///chef
                ChefSetUp(),
              if (cc.setIndex.value == 2)

              ///flavour
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
                        Positioned(
                          bottom: 15,
                          right: 25,
                          child: FloatingButton(
                            text: "ADD Flavor",
                            onTap: () {
                              if (flavorName.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Please Fill the Flavor"),
                                  ),
                                );
                              } else {
                                flavorListModel.add(FlavorListModel(text: flavorName.text));
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Content snown successfully")));
                              }
                              flavorName.clear();
                              remarks.clear();
                            },
                          ),
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
                              CreateFoodProvider(providerName: providerName, shortName: shortName, providerAddress: providerAddress, phoneNumber: phoneNumber, description: description),
                            if (cc.foodProviderIndex.value == 1) FoodProviderListSetUp(),
                          ],
                        ),
                        Positioned(
                          bottom: 15,
                          right: 25,
                          child: FloatingButton(
                            text: "ADD PROVIDER",
                            onTap: () {
                              if (providerName.text.isEmpty && shortName.text.isEmpty && providerAddress.text.isEmpty && phoneNumber.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Please fill the empty fields"),
                                  ),
                                );
                              } else {
                                foodProviderListModel.add(
                                  FoodProviderListModel(
                                    providerName: providerName.text,
                                    shortName: shortName.text,
                                    phoneNumber: int.parse(phoneNumber.text),
                                    address: providerAddress.text,
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Displayed successfully",
                                    ),
                                  ),
                                );
                              }
                              providerAddress.clear();
                              providerName.clear();
                              shortName.clear();
                              phoneNumber.clear();
                              address.clear();
                              description.clear();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      );
    });
  }
}


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/count_controller.dart';

void DishCategoryName(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      // cc hamle object create gareko ho and dependency injection diyepaxi chai we have to find that so get.find
      final cc = Get.find<CountController>();
      //back drop filter le chai paxadi blur garne kaam garxa
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          content: Expanded(
            child: Container(

              width: 479,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Color(0xffFFFFFF),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisSize le chai max height linxa meaning that dialog box mathi bata tala samma....so min rakhne bela chai child jati xa teti nai height linxa
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "DISH CATEGORY NAME",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff831529),
                        ),
                      ),
                      InkWell(
                          onTap: cc.onreset, child: Icon(Icons.refresh_sharp)),
                    ],
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    "Select the order quantity",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff831529),
                    ),
                  ),
                  SizedBox(
                    height: 38,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Quality"),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFFECEC),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                cc.increment();
                              },
                              icon: Icon(Icons.add),
                            ),
                            //obx le chai observe garera basxa change aune and after the occurance of change..yesle change linxa
                            Obx(() {
                              return Text(cc.count.toString());
                            }),
                            IconButton(
                              onPressed: cc.decrement,
                              icon: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffF6921E).withOpacity(0.7),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Choose Flavor",
                          style: GoogleFonts.roboto(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                        ),
                        Spacer(),
                        PopupMenuButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color(0xffF6921E),
                          child: Icon(Icons.keyboard_arrow_right_sharp),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                onTap: () {
                                  cc.isPressed();
                                },
                                child: Text("Regular",
                                  style: GoogleFonts.roboto(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),

                                )),
                            PopupMenuItem(
                              onTap: () {
                                cc.isPressed();
                              },
                              child: Text("Hot & Spicy",
                                style: GoogleFonts.roboto(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            PopupMenuItem(
                                onTap: () {
                                  cc.isPressed();
                                },
                                child: Text("Other",
                                  style: GoogleFonts.roboto(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),

                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Obx(
                    () => cc.pressed.value == 1
                        ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 152,
                            decoration: BoxDecoration(
                              color: Color(0xffFCD9B0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Regular",
                                  style: GoogleFonts.roboto(
                                    color: Color(0xffF6921E),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text("Select Quantity",
                                  style: GoogleFonts.roboto(
                                    color: Color(0xffFFFFFF).withOpacity(0.7),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffF9B362),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          cc.increment1();
                                        },
                                        icon: Icon(Icons.add,
                                          color: Color(0xffFFFFFF),

                                        ),
                                      ),
                                      Text(cc.count1.toString(),
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffFFFFFF),
                                          fontSize: 20,

                                        ),
                                      ),
                                      IconButton(
                                        onPressed: cc.decrement1,
                                        icon: Icon(Icons.remove,
                                            color: Color(0xffFFFFFF)
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  Obx(() => cc.pressed.value==2?
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                        decoration: BoxDecoration(
                          color: Color(0xffFCD9B0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Other",
                              style: GoogleFonts.roboto(
                                color: Color(0xffF6921E),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            TextField(
                              minLines: 1,
                              maxLines: 10,
                              decoration: InputDecoration(
                                border:InputBorder.none,
                                hintText: "Type Here",
                                hintStyle: TextStyle(color: Colors.white)
                              ),

                            ),
                          ],
                        ),

                      ):SizedBox.shrink(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);

                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff831529),
                      ),
                      child: Center(
                        child: Text(
                          "Order",
                          style: GoogleFonts.roboto(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

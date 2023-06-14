import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../add_delete_table.dart';
import '../kitchen_preview.dart';
import 'cancel_confirm.dart';

class ModifyTable extends StatelessWidget {
  const ModifyTable({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IndexController());
    final size= MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 18),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: size.width <=790 ? 4 : size.width<=940 ? 5 : 6,
                crossAxisSpacing: 17,
                mainAxisSpacing: 18,
                childAspectRatio: 1.5,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            insetPadding: EdgeInsets.zero,
                            titlePadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            content: Container(
                              width: 479,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 24),
                              child: Obx(() {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "MODIFY TABLE",
                                      style: GoogleFonts.roboto(
                                          color: const Color(0xff831529),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.sp),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AddDeleteTable(
                                          textColor: controller.index.value==0?Colors.white :  const Color(0xff831529),

                                          color: controller.index.value == 0
                                              ? const Color(0xff831529)
                                              : Colors.white,
                                          addDelete: "ADD TABLE",
                                          onTap: () {
                                            controller.index.value = 0;
                                          },
                                        ),
                                        AddDeleteTable(textColor: controller.index.value==1?Colors.white :  const Color(0xff831529),
                                          onTap: () {
                                            controller.index.value = 1;
                                          },
                                          addDelete: "DELETE TABLE",
                                          color: controller.index.value == 1
                                              ? const Color(0xff831529)
                                              : Colors.white,
                                        ),
                                      ],
                                    ),
                                    if (controller.index.value == 0)
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Enter the number of tables you want  to add!",
                                            style: GoogleFonts.roboto(
                                                color: const Color(0xff831529),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18.sp),
                                          ),
                                          const SizedBox(
                                            height: 36,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Aditional",
                                                style: GoogleFonts.roboto(
                                                    color: const Color(0xff831529),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20.sp),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 136,
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                  color: const Color(0xff831529)
                                                      .withOpacity(0.5),
                                                ))),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: const TextField(
                                                        decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide.none),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "Tables",
                                                      style: GoogleFonts.roboto(
                                                          color:
                                                              const Color(0xff831529)
                                                                  .withOpacity(0.7),
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 18.sp),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Spacer(),
                                          CancelConfirm(),
                                        ],
                                      )),
                                    if (controller.index.value == 1)
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Enter the number of tables you want  to delete!",
                                              style: GoogleFonts.roboto(
                                                  color: const Color(0xff831529),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 18.sp),
                                            ),
                                            const SizedBox(
                                              height: 36,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Remove(Maximum 10)",
                                                  style: GoogleFonts.roboto(
                                                      color: const Color(0xff831529),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 20.sp),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 136,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                    color: const Color(0xff831529)
                                                        .withOpacity(0.5),
                                                  ))),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: const TextField(
                                                          decoration: InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Tables",
                                                        style: GoogleFonts.roboto(
                                                            color:
                                                            const Color(0xff831529)
                                                                .withOpacity(0.7),
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 18.sp),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                           Spacer(),
                                            CancelConfirm(),
                                          ],
                                        ),
                                      ),
                                  ],
                                );
                              }),
                            )),
                      );
                    },
                    child: Container(
                      // padding: const EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15).w,
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SvgPicture.asset("assets/images/TableIcon.svg"),
                          Text(
                            "MODIFY TABLE",
                            style: GoogleFonts.roboto(
                              fontSize:  14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffF6921E),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  for (int i = 0; i <= 10; i++)
                    GestureDetector(
                      onTap:onTap ,
                      child: Container(
                        height: 120.h,
                        width: 167.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15).w,
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/images/TableIcon.svg"),
                            Text(
                              "NO. $i",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 24.sp,
                                color: const Color(0xff831529),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
            Container(
              height: 270,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18),
                    child: Text(
                      "Kitchen Preview",
                      style: GoogleFonts.roboto(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff831529)),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        KitchenPreview(
                          color: Color(0xffFFEEDB),
                          image: "assets/images/Order.svg",
                          status: "Orders",
                          rate: 909,
                        ),
                        KitchenPreview(
                          color: Color(0xffCFE8FF),
                          image: "assets/images/Cooking.svg",
                          status: "Cooking",
                          rate: 888,
                        ),
                        KitchenPreview(
                          color: Color(0xffFFDFE6),
                          image: "assets/images/Cooked.svg",
                          status: "Cooked",
                          rate: 900,
                        ),
                        KitchenPreview(
                          color: Color(0xffF0D8FF),
                          image: "assets/images/Served.svg",
                          status: "Served",
                          rate: 958,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IndexController extends GetxController {
  var index = 0.obs;
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:rm_ui/screen/home_screen/kitche_preview/cooked_preview.dart';
import 'package:rm_ui/screen/home_screen/kitche_preview/cooking_preview.dart';

import '../../../../shared_pref/chef_preference.dart';
import '../../kitche_preview/orders.dart';
import '../../kitche_preview/served_preview.dart';
import '../add_delete_table.dart';
import '../kitchen_preview.dart';
import 'cancel_confirm.dart';

class ModifyTable extends StatefulWidget {
  const ModifyTable({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  State<ModifyTable> createState() => _ModifyTableState();
}

class _ModifyTableState extends State<ModifyTable> {
  final controller = Get.put(IndexController());

  @override
  void initState() {
    SharedPreferenceServices.init().then((value) {
      controller.tableNum.value = SharedPreferenceServices.getTable() ?? 0;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                return Padding(
                  padding: const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 18),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: size.width <= 790
                        ? 4
                        : size.width <= 940
                            ? 5
                            : 6,
                    crossAxisSpacing: 17,
                    mainAxisSpacing: 18,
                    childAspectRatio: 1.5,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          controller.index.value = 0;
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
                                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                                  child: Obx(() {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "MODIFY TABLE",
                                          style: GoogleFonts.roboto(color: const Color(0xff831529), fontWeight: FontWeight.w700, fontSize: 20.sp),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            AddDeleteTable(
                                              textColor: controller.index.value == 0 ? Colors.white : const Color(0xff831529),
                                              color: controller.index.value == 0 ? const Color(0xff831529) : Colors.white,
                                              addDelete: "ADD TABLE",
                                              onTap: () {
                                                controller.index.value = 0;
                                              },
                                            ),
                                            AddDeleteTable(
                                              textColor: controller.index.value == 1 ? Colors.white : const Color(0xff831529),
                                              onTap: () {
                                                controller.index.value = 1;
                                              },
                                              addDelete: "DELETE TABLE",
                                              color: controller.index.value == 1 ? const Color(0xff831529) : Colors.white,
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
                                                style: GoogleFonts.roboto(color: const Color(0xff831529), fontWeight: FontWeight.w400, fontSize: 18.sp),
                                              ),
                                              const SizedBox(
                                                height: 36,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Additional",
                                                    style: GoogleFonts.roboto(color: const Color(0xff831529), fontWeight: FontWeight.w500, fontSize: 20.sp),
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    width: 136,
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                      color: const Color(0xff831529).withOpacity(0.5),
                                                    ))),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: controller.addTableController,
                                                            decoration: const InputDecoration(
                                                              border: OutlineInputBorder(borderSide: BorderSide.none),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          "Tables",
                                                          style: GoogleFonts.roboto(
                                                              color: const Color(0xff831529).withOpacity(0.7), fontWeight: FontWeight.w400, fontSize: 18.sp),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const Spacer(),
                                              CancelConfirm(
                                                onPressed: () async {
                                                  controller.tableNum.value = controller.tableNum.value + int.parse(controller.addTableController.text);
                                                  Navigator.pop(context);
                                                  await SharedPreferenceServices.setTable(controller.tableNum.value);
                                                  controller.addTableController.clear();
                                                },
                                              ),
                                            ],
                                          )),
                                        if (controller.index.value == 1)
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Enter the number of tables you want  to delete!",
                                                  style: GoogleFonts.roboto(color: const Color(0xff831529), fontWeight: FontWeight.w400, fontSize: 18.sp),
                                                ),
                                                const SizedBox(
                                                  height: 36,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Remove(Maximum ${controller.tableNum.value - 1})",
                                                      style: GoogleFonts.roboto(color: const Color(0xff831529), fontWeight: FontWeight.w500, fontSize: 20.sp),
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      width: 136,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                        color: const Color(0xff831529).withOpacity(0.5),
                                                      ))),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: TextFormField(
                                                              controller: controller.deleteTableController,
                                                              decoration: const InputDecoration(
                                                                border: OutlineInputBorder(borderSide: BorderSide.none),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Tables",
                                                            style: GoogleFonts.roboto(
                                                                color: const Color(0xff831529).withOpacity(0.7), fontWeight: FontWeight.w400, fontSize: 18.sp),
                                                          )
                                                        ],


                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Spacer(),
                                                CancelConfirm(
                                                  onPressed: () async {
                                                    //excess number delete nahuney
                                                    controller.tableNum.value = controller.tableNum.value - int.parse(controller.deleteTableController.text);
                                                    await SharedPreferenceServices.setTable(controller.tableNum.value);
                                                    Navigator.pop(context);
                                                    controller.deleteTableController.clear();
                                                  },
                                                ),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffF6921E),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      for (int i = 0; i < controller.tableNum.value; i++)
                        GestureDetector(
                          onTap: widget.onTap,
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
                                  "NO. ${i + 1}",
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
                );
              },
            ),
            Container(
              height: 270,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      "Kitchen Preview",
                      style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w500, color: const Color(0xff831529)),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        KitchenPreview(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const OrdersPage();
                                },
                              ),
                            );
                          },
                          color: const Color(0xffFFEEDB),
                          image: "assets/images/Order.svg",
                          status: "Orders",
                          rate: 909,
                        ),
                        KitchenPreview(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const CookingPage();
                                },
                              ),
                            );
                          },
                          color: const Color(0xffCFE8FF),
                          image: "assets/images/Cooking.svg",
                          status: "Cooking",
                          rate: 888,
                        ),
                        KitchenPreview(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const CookedPage();
                                },
                              ),
                            );
                          },
                          color: const Color(0xffFFDFE6),
                          image: "assets/images/Cooked.svg",
                          status: "Cooked",
                          rate: 900,
                        ),
                        KitchenPreview(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ServedPage();
                                },
                              ),
                            );
                          },
                          color: const Color(0xffF0D8FF),
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
  var tableNum = 0.obs;
  final addTableController = TextEditingController();
  final deleteTableController = TextEditingController();
}

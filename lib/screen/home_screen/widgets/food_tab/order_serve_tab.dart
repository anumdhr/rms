import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/screen/home_screen/home_screen.dart';
import 'package:rm_ui/screen/home_screen/widgets/ordered_tab/ordered_tab.dart';

import '../../../../controller/count_controller.dart';

class OrderServeTab extends StatefulWidget {
  const OrderServeTab({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;
  @override
  State<OrderServeTab> createState() => _OrderServeTabState();
}

class _OrderServeTabState extends State<OrderServeTab> {
  final cc = Get.find<CountController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff831529),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red,
                              ),
                              height: 79,
                              width: 107,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SvgPicture.asset(
                                  "assets/images/food_item.svg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dish Name",
                                  style: GoogleFonts.roboto(
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  "QTY.5",
                                  style: GoogleFonts.roboto(
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Serve"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              cc.increment2();
                                              print(cc.count2.value);
                                            },
                                            icon: Icon(Icons.add)),
                                        Text(cc.count2.toString()),
                                        IconButton(
                                          onPressed: () {
                                            cc.decrement2();
                                            print(cc.count2.value);
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Text("Packing"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              cc.increment2();
                                              print(cc.count2.value);
                                            },
                                            icon: Icon(Icons.add)),
                                        Obx(() {
                                          return Text(cc.count2.toString());
                                        }),
                                        IconButton(
                                          onPressed: () {
                                            cc.increment2();
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: 3),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: widget.onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xffF6921E),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(child: Text("CONFIRM ORDER")),
                        CircleAvatar(
                          backgroundColor: Color(0xffFCD9B0),
                          radius: 15,
                          child: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

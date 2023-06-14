import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common_widgets/floating_button.dart';
import '../../food_tab/field_form_text.dart';

class AddFoodMenu extends StatelessWidget {
  const AddFoodMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            padding:
            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FOOD MENU",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xff831529),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Stack(
                                // clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    // width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(top: 5),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFDFE6),
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                    child: Text('Momo'),
                                  ),
                                  Positioned(
                                    left: 10,
                                    bottom: -5,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 25,
                                      child: SvgPicture.asset(
                                          "assets/images/Order.svg"),
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 15,
                              );
                            },
                            itemCount: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  color: Color(0xffBCBCBC).withOpacity(0.5),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Create Food Menu",
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff831529),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor:
                                          const Color(
                                              0xff831529),
                                          radius: 90,
                                          child: Center(
                                            child: SvgPicture.asset(
                                              "assets/images/RM Logo_RM Logo 1.svg",
                                              height: 90,
                                              width: 90,
                                            ),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceAround,
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor:
                                            Colors.red,
                                            child: SvgPicture.asset(
                                              "assets/images/AboutIcon.svg",
                                            ),
                                          ),
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor:
                                            Colors.red,
                                            child: SvgPicture.asset(
                                              "assets/images/AboutIcon.svg",
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      FieldFormText(
                                        text: "Menu Name",
                                        hintText: "Type Here...",
                                        showPopupMenu: false,
                                      ),

                                      FieldFormText(
                                        text: "Priority",
                                        hintText: "Type Here...",
                                        showPopupMenu: false,
                                      ),
                                      FieldFormText(
                                        text: "Food Provider",
                                        hintText: "Select Provider",
                                        showPopupMenu: true,
                                      ),
                                      FieldFormText(
                                        text: "Description",
                                        hintText:
                                        "Less Than 36 Letters",
                                        showPopupMenu: false,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            right: 25,
            child: FloatingButton(text: "ADD MENU"),
          )
        ],
      ),
    );
  }
}

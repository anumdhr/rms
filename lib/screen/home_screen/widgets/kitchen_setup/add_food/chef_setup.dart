import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common_widgets/floating_button.dart';
import '../../../../../common_widgets/kitchen_setup_textfield.dart';
import '../../../../../controller/count_controller.dart';
import 'kitchen_list_setup.dart';

class ChefSetUp extends StatefulWidget {
  const ChefSetUp({
    super.key,
  });

  @override
  State<ChefSetUp> createState() => _ChefSetUpState();
}

class _ChefSetUpState extends State<ChefSetUp> {
  final cc = Get.find<CountController>();
  String text = '';
  final chefName = TextEditingController();
  final priority = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        cc.chefIndex.value = 0;
                      },
                      child: Text(
                        'Create Chef  ',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: cc.chefIndex.value == 0 ? const Color(0xff831529) : const Color(0xffFFDEE6),
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
                        cc.chefIndex.value = 1;
                      },
                      child: Text(
                        '  Chef list',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: cc.chefIndex.value == 1 ? const Color(0xff831529) : const Color(0xffFFDEE6),
                        ),
                      ),
                    ),
                  ],
                ),
                // CreateOrShowList(
                //     preText: "Create Chef  ",
                //     sufText: "  Chef List"),
                const SizedBox(
                  height: 10,
                ),
                if (cc.chefIndex.value == 0)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SetUpTextField(
                            controller: chefName,
                            text: "Chef Name",
                            hintText: "Type Here...",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SetUpTextField(
                            /*
                            yo text field haina so change it and tyo drop down chai pailai ko mildaina so again
                            banaunu
                             */
                            onChanged: (p0) {
                              setState(() {
                                p0 = text;
                              });
                            },
                            // controller: priority,
                            text: "Choose Kitchen",
                            hintText: "Select Kitchen",
                            suffixIcon: CustomPopupMenu(text: text),
                          ),
                          // Expanded(
                          //   child: SizedBox(
                          //     width: 60,
                          //     child: Column(
                          //       children: [
                          //         Text(
                          //           text??'kitchen',
                          //           style: GoogleFonts.roboto(
                          //             fontWeight: FontWeight.w400,
                          //             fontSize: 18,
                          //             color: const Color(0xff831529),
                          //           ),
                          //         ),
                          //         Row(
                          //           children: [
                          //             Text(
                          //               text,
                          //               style: GoogleFonts.roboto(
                          //                 fontWeight: FontWeight.w400,
                          //                 fontSize: 18,
                          //                 color: const Color(0xff831529),
                          //               ),
                          //             ),
                          //             CustomPopupMenu(text: text),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      Row(
                        children: [
                          SetUpTextField(
                            controller: priority,
                            text: "Priority",
                            hintText: "Type Here...",
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                if (cc.chefIndex.value == 1) const KitchenListSetup(),
              ],
            ),
          ),
          const Positioned(
            bottom: 15,
            right: 25,
            child: FloatingButton(
              text: "ADD CHEF",
            ),
          ),
        ],
      ),
    );
  }
}

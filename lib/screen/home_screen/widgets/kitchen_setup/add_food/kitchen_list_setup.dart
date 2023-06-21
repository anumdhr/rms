import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../models/kitchen_setup_model/kitchen_model.dart';
import '../../../../../models/ordered_model/ordered_model.dart';

class KitchenListSetup extends StatefulWidget {
  const KitchenListSetup({
    super.key,
  });

  @override
  State<KitchenListSetup> createState() => _KitchenListSetupState();
}

class _KitchenListSetupState extends State<KitchenListSetup> {
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xff831529),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Flex(
                      direction: Get.width < 900 ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            kitchenListModel[index].kitchenName,
                            style: GoogleFonts.roboto(
                              color: const Color(0xffFFFFFF),
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Address : ${kitchenListModel[index].address}",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              color: const Color(0xffFFFFFF).withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "No. of Chef:",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                    color: const Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  " ${kitchenListModel[index].chefNumber}  ",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                    color: const Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 1,
                              color: const Color(0xffFFFFFF).withOpacity(0.5),
                              height: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffFFB7C4),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  content: Container(
                                    width: 479,
                                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      // color: Color(0xffFFFFFF),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "DELETE",
                                          style: GoogleFonts.roboto(
                                            color: const Color(0xff831529),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Are you sure you want to remove the list?",
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: const Color(0xff831529).withOpacity(0.7),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {

                                                setState(() {
                                                  kitchenListModel.removeAt(index);
                                                  Navigator.pop(context);
                                                });
                                              },

                                              child: Container(
                                                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xffFFB7C4),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "OK",
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child:  Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: kitchenListModel.length),
    );
  }
}

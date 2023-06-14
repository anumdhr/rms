import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../models/ordered_model/ordered_model.dart';

class FoodProviderListSetUp extends StatelessWidget {
  const FoodProviderListSetUp({
    super.key,
  });

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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff831529),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Flex(
                      direction: Get.width < 900 ? Axis.vertical : Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: SvgPicture.asset(
                                "assets/images/food (1).svg",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      foodProviderListModel[index].providerName,
                                    ),
                                    SizedBox(width: 10,),
                                    Text(foodProviderListModel[index].shortName),
                                  ],
                                ),
                                Text("Phone No : ${foodProviderListModel[index].phoneNumber}")
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Address : ${foodProviderListModel[index].address}",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                color: Color(0xffFFFFFF).withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [

                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 1,
                                  color: Color(0xffFFFFFF).withOpacity(0.5),
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffFFB7C4),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Expanded(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: AlertDialog(
                                    backgroundColor: Colors.transparent,
                                    content: Container(
                                      width: 479,
                                      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
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
                                              color: Color(0xff831529),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Are you sure you want to remove the list?",
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                              color: Color(0xff831529).withOpacity(0.7),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffFFB7C4),
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
                                ),
                              );
                            },
                          );
                        },
                        child: Icon(
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
            return SizedBox(
              height: 10,
            );
          },
          itemCount: foodProviderListModel.length),
    );
  }
}

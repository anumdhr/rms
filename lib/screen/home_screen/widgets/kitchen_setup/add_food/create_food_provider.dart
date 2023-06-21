import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common_widgets/kitchen_setup_textfield.dart';

class CreateFoodProvider extends StatelessWidget {
  const CreateFoodProvider({
    super.key,
    required this.providerName,
    required this.shortName,
    required this.providerAddress,
    required this.phoneNumber,
    required this.description,
  });

  final TextEditingController providerName;
  final TextEditingController shortName;
  final TextEditingController providerAddress;
  final TextEditingController phoneNumber;
  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                            radius: 25,
                            backgroundColor: Color(0xffFCD9B0),
                            child: SvgPicture.asset(
                              "assets/images/cameraone.svg",
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xffFCD9B0),
                            child: SvgPicture.asset(
                              "assets/images/GalleryIcon.svg",
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
                      FoodProvTextField(text: "Description", hintText: "Less Than 36 Letters", controller: description,maxlength: 36,),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

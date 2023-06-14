import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/screen/home_screen/widgets/food_tab/field_form_text.dart';

import '../../../../common_widgets/kitchen_setup_textfield.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFECEC),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Icon(Icons.person),
        ),
        title: Text(
          "My Profile",
          style: GoogleFonts.roboto(
            color: const Color(0xff831529),
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Color(0xff831529),
                    radius: 15,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Edit Profile",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    color: const Color(0xff831529),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xff831529),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(Icons.sticky_note_2),
                )
              ],
            ),
          ),Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            child: SvgPicture.asset(
                              "assets/images/AboutIcon.svg",
                            ),
                          ),
                          CircleAvatar(
                            radius: 15,
                            child: SvgPicture.asset(
                              "assets/images/AboutIcon.svg",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 218),
                width: 2,
                // height: MediaQuery.of(context).size.height-120,
                color: const Color(0xffBCBCBC).withOpacity(0.5),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(child: ProfileTextField(
                            hintText: "Jhigu Momo New Restaurant",
                            text: "Company Name",
                            icon: Icons.snapchat,


                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(child: ProfileTextField(
                            icon: Icons.mail,
                            text: "Mail",
                            hintText: "example@mail.com",
                          )),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: const [
                          Expanded(child: ProfileTextField(
                            icon: Icons.location_on,
                            text: "Mobile Number",
                            hintText: "+977 9841******",
                          )),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(child: ProfileTextField(
                            icon: Icons.location_on,
                            text: "Address",
                            hintText: "Banepa, Kavre",
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Expanded(child: ProfileTextField(
                            icon: Icons.camera_rounded,
                            text: "Website",
                            hintText: "www.companyname.com.np",
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
//
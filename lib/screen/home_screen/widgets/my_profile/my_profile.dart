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
        leading:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child:SvgPicture.asset("assets/images/ProfileIcon.svg"),
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
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                  child: SvgPicture.asset("assets/images/Edit and save.svg"),
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
                            backgroundColor: Color(0xffFCD9B0),
                            radius: 25,
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/cameraone.svg",

                                fit: BoxFit.none,


                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Color(0xffFCD9B0),
                            radius: 25,
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/GalleryIcon.svg",
                              ),
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
                            image: "assets/images/iconProfile.svg",


                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(child: ProfileTextField(
                            image: "assets/images/MailIcon.svg",
                            text: "Mail",
                            hintText: "example@mail.com",
                          )),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: const [
                          Expanded(child: ProfileTextField(
                           image: "assets/images/ContactIcon.svg",
                            text: "Mobile Number",
                            hintText: "+977 9841******",
                          )),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(child: ProfileTextField(
                            image: "assets/images/LocationIcon.svg",
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
                            image: "assets/images/GlobeIcon.svg",
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
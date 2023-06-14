import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/common_widgets/login_signin_textFields.dart';
import 'package:rm_ui/screen/login_screen/login_screen.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);
  TextEditingController newpw = TextEditingController();
  TextEditingController confirmpw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff831529),
            Color(0xff280209),
          ]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/images/RM Logo_RM Logo 1.svg",
                  height: 138,
                  width: 138,
                ),
                const Text("RESTAURANT MANAGEMENT SYSTEM"),
                const SizedBox(
                  height: 48,
                ),
                Container(
                  width: 382,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 32),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(Icons.arrow_back_ios),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Text(
                                "CHANGE YOUR PASSWORD",
                                style: GoogleFonts.roboto(
                                  letterSpacing: 8,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                  color: Color(0xff831529),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Please create a new password !",
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff831529).withOpacity(
                                0.7,
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MailPasswordField(
                          prefixIcon: Icons.lock,
                          text: "New Password",
                          controller: newpw,
                          obscureText: true,
                          suffixIcon: Icon(Icons.remove_red_eye,)
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MailPasswordField(
                          prefixIcon: Icons.lock,
                          text: "Confirm Password",
                          controller: confirmpw,
                          obscureText: true,
                          suffixIcon: Icon(Icons.done),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffF6921E),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Change",
                              style: GoogleFonts.roboto(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

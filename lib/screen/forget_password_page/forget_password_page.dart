import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/common_widgets/login_signin_textFields.dart';
import 'package:rm_ui/screen/signin_page/Verification.dart';

import '../../common_widgets/timer.dart';
import '../change_password/change_password.dart';
import '../signin_page/signin_page.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({Key? key}) : super(key: key);
  TextEditingController mailController = TextEditingController();

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                return Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                "FORGET YOUR PASSWORD",
                                style: GoogleFonts.roboto(
                                  color: Color(0xff831529),
                                  letterSpacing: 8,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Please enter your registered email!",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color(0xff831529).withOpacity(0.7),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MailPasswordField(
                          prefixIcon: Icons.mail,
                          suffixIcon: Icon(Icons.done),
                          text: "Mail",
                          controller: mailController,
                          obscureText: false,
                          hintText: "example@mail.com",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              verificationCodeDialog(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 10),
                              decoration: BoxDecoration(
                                color: Color(0xffF6921E),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                "Get Code",
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void verificationCodeDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.white.withOpacity(0.7),
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 401,
            width: 422,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffFFFFFF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "VERIFICATION CODE",
                  style: GoogleFonts.roboto(
                    fontSize: 30,
                    letterSpacing: 5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff831529),
                  ),
                ),
                SizedBox(
                  height: 56,
                ),
                Text(
                  "Please check your email !",
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff831529).withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Verification(),
                    Verification(),
                    Verification(),
                    Verification(),
                  ],
                ),
                SizedBox(height: 10),
                CountdownTimer(),
                SizedBox(height: 10),
                SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("Didn't receive a code?"),
                //     TextButton(
                //       onPressed: () {},
                //       child: Text("Resend"),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("Eligible in "),
                //     Text("120s"),
                //   ],
                // ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChangePassword();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff831529),
                      ),
                      child: Text(
                        "Verify",
                        style: GoogleFonts.roboto(color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    },
  );
}

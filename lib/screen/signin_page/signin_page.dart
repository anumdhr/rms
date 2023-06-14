import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common_widgets/login_signin_textFields.dart';
import '../../common_widgets/timer.dart';
import 'Verification.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);
  TextEditingController companyController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: EdgeInsets.symmetric(vertical: 113),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff831529),
            Color(0xff280209),
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32),
              width: 382,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.9),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios_rounded),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        "SIGNUP",
                        style: GoogleFonts.roboto(
                          fontSize: 30,
                          letterSpacing: 8,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff831529),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 61,
                  ),
                  MailPasswordField(
                    prefixIcon: Icons.lock,
                    text: "Company Name",
                    hintText: "Type Here...",
                    obscureText: false,
                    controller: companyController, suffixIcon: SizedBox.shrink(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MailPasswordField(
                    controller: mailController,
                    text: "Mail",
                    hintText: "example@mail.com",
                    prefixIcon: Icons.mail,
                    suffixIcon: Icon(Icons.done),
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MailPasswordField(
                    prefixIcon: Icons.lock,
                    text: "Password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.remove_red_eye_rounded),
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MailPasswordField(
                    prefixIcon: Icons.lock,
                    text: "Confirm Password",
                    controller: confirmController,
                    suffixIcon: Icon(Icons.done),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: Color(0xff831529),
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Agree Terms & Conditions and Privacy Policies",
                        style: GoogleFonts.roboto(
                          color: Color(0xff831529),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      backgroundColor: Color(0xffF6921E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      verificationCodeDialog(context);
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void verificationCodeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: AlertDialog(

          backgroundColor: Colors.transparent,
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
                Text("VERIFICATION CODE",
                  style: GoogleFonts.roboto(
                    letterSpacing: 5,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff831529),

                  ),
                ),
                SizedBox(
                  height: 56,
                ),
                Text("Please check your email !",
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
                SizedBox(height:10),
                CountdownTimer(),
                SizedBox(height:10),
                SizedBox(height: 10,),
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

                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 70),
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


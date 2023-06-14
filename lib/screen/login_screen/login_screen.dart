import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/screen/home_screen/home_screen.dart';
import 'package:rm_ui/screen/login_screen/signup_login_button.dart';
import 'package:rm_ui/screen/splash_screen/widgets/logo.dart';

import '../../common_widgets/login_signin_textFields.dart';
import '../../controller/count_controller.dart';
import '../forget_password_page/forget_password_page.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final cc = Get.find<CountController>();

  bool isPressed = true;

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/images/RM Logo_RM Logo 1.svg",
                  height: 138,
                  width: 138,
                ),
                Text(
                  "RESTAURANT MANAGEMENT SYSTEM",
                  style: GoogleFonts.roboto(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: EdgeInsets.zero,
                  // padding: const EdgeInsets.symmetric(horizontal: 376),
                  child: Container(
                    width: 382,
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.roboto(
                                letterSpacing: 8,
                                color: const Color(0xff831529),
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 61,
                          ),
                          MailPasswordField(
                            controller: mailController,
                            text: "Mail",
                            hintText: "example@mail.com",
                            prefixIcon: Icons.mail,
                            suffixIcon:  CircleAvatar(
                              backgroundColor: Color(0xff831529),
                              radius: 15,
                              child: Icon(
                                Icons.done,
                                color: Color(0xffF6921E),
                                size:12,
                              ),
                            ),
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //using GET to obscure the text on clicking on the icon
                          Obx(() {
                            return MailPasswordField(
                              prefixIcon: Icons.lock,
                              text: "Password",
                              obscureText: cc.isObscureText.value,
                              suffixIcon: InkWell(
                                onTap: cc.onObscureTextPressed,
                                child: CircleAvatar(
                                 radius: 20 ,
                                  backgroundColor: Color(0xff831529),
                                  child: cc.isObscureText.value
                                      ? const Icon(Icons.remove_red_eye,
                                    color: Color(0xffF6921E),
                                    size:12,
                                  )
                                      : const Icon(
                                          Icons.visibility_off,
                                      color: Color(0xffF6921E),
                                    size:12,
                                        ),
                                ),
                              ),
                              controller: passwordController,
                            );
                          }),
                          //using setstate to obscure the text on clicking on the icon
                    MailPasswordField(
                      prefixIcon: Icons.lock,
                      text: "Password",
                      obscureText: isPressed,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                        child: CircleAvatar(
                          radius: 20 ,
                          backgroundColor: Color(0xff831529),

                          child: isPressed
                              ? const Icon(Icons.remove_red_eye,
                            color: Color(0xffF6921E),
                            size:12,
                          )
                              : const Icon(
                            Icons.visibility_off,
                            color: Color(0xffF6921E),
                            size:12,
                          ),
                        ),
                      ),
                      controller: passwordController,
                    ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ForgetPasswordPage();
                                  },
                                ));
                              },
                              child: Text(
                                "Forget Password?",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  color: const Color(0xffF6921E),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SignupLogin(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const MyHomePage();
                                      },
                                    ),
                                  );
                                },
                                text: "Signup",
                                color: const Color(0xffF6921E),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SignupLogin(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const MyHomePage();
                                      },
                                    ),
                                  );
                                },
                                text: "Login",
                                color: const Color(0xff831529),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
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

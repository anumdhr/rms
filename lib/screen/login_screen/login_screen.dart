import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/screen/splash_screen/widgets/logo.dart';

import '../../common_widgets/login_signin_textFields.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff831529),
              Color(0xff280209),
            ]),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 83),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 138,
                  width: 138,
                  child: SvgPicture.asset("assets/images/RM Logo_RM Logo 1.svg"),
                ),
                const Text("RESTAURANT MANGEMENT SYSTEM"),
                const SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 376),
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.roboto(
                                color: Color(0xff831529),
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
                            ),

                          ),
                          SizedBox(
                            height: 61,
                          ),
                          MailPasswordField(
                            controller: mailController,
                            text: "Mail",
                            hintText: "example@mail.com",
                            prefixIcon: Icons.mail,
                            suffixIcon: Icons.done,
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MailPasswordField(
                            prefixIcon: Icons.lock,
                            text: "Password",
                            obscureText: true,
                            suffixIcon: Icons.remove_red_eye_rounded,
                            controller: passwordController,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Forget Password?"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SignupLogin(
                                text: "Signup",
                                color: Color(0xffF6921E),
                              ),
                              SignupLogin(
                                text: "Login",
                                color: Color(0xff831529),
                              ),
                            ],
                          ),
                          SizedBox(
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

class SignupLogin extends StatelessWidget {
  const SignupLogin({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )),
      onPressed: () {},
      child: Text(text),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({Key? key}) : super(key: key);

  // final box=SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        // padding: EdgeInsets.symmetric(vertical: 10),

        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "RESTAURANT MANAGEMENT SYSTEM",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: const Color(0xff831529),
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        // height: 418,
                        width: 416,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 51),
                        decoration: BoxDecoration(
                          color: const Color(0xff831529),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "JHIGU RESTAURANT",
                              style: GoogleFonts.roboto(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF),
                                letterSpacing: 5,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "+977 1234567890",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Banepa, Kavre",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "example@mail.com",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Container(
                        width: 416,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 51),
                        decoration: BoxDecoration(
                          color: const Color(0xff652D90),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "DEVELOPED BY",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: const Color(0xffFFFFFF),
                                letterSpacing: 5,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Emerge Infosys Pvt.Ltd.",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "011-663099",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "+977 9801362962",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Chardobato, Banepa, Kavre",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "info@emergeInfosys.com",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "www.emergeInfosys.com",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Application Version RMS v2.0.1",
                style: GoogleFonts.roboto(
                  color: const Color(0xffFFB7C4),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(

          child: SvgPicture.asset("assets/images/RM Logo_RM Logo 1.svg",
            fit: BoxFit.fill,
          ),

        ),
        Text(" RESTAURANT MANAGEMENT SYSTEM",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

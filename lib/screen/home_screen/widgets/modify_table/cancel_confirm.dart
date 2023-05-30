import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelConfirm extends StatelessWidget {
  const CancelConfirm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
            onPressed: () {},
            child: Text(
              "Cancel",
              style: GoogleFonts.roboto(
                color: Color(0xff831529),
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
              Color(0xffF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20),
              ),
            )),
        SizedBox(
          width: 24,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Confirm",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffFF7C7C),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CancelConfirm extends StatelessWidget {
  const CancelConfirm({
    super.key, this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: GoogleFonts.roboto(
                color: const Color(0xff831529),
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
              const Color(0xffF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20),
              ),
            )),
        const SizedBox(
          width: 24,
        ),
        ElevatedButton(
          onPressed:onPressed ,
          child: Text(
            "Confirm",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF7C7C),
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
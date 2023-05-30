import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDeleteTable extends StatelessWidget {
  AddDeleteTable({
    super.key,
    required this.addDelete,
    required this.onTap,
    required this.color,
    required this.textColor,
  });
  final Color textColor;

  final String addDelete;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 207,
          height: 45,
          alignment: Alignment.center,

          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(18)

          ),
          child: Text(addDelete,
            style: GoogleFonts.roboto(
                color:textColor,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}
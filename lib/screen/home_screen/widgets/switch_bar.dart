import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchBar extends StatelessWidget {
  const SwitchBar({super.key, required this.text, required this.onTap, required this.color,required this.containerColor});

final void Function()? onTap;
  final String text;
  final Color color;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          // margin: const EdgeInsets.symmetric(vertical: 24),
          height: 44,
          width: 171,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            text,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: color,
            ),
          )),
    );
  }
}

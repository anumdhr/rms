import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchBar extends StatelessWidget {
  const SwitchBar({
    super.key, required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
    // margin: const EdgeInsets.symmetric(vertical: 24),
      height: 44,
      width: 171,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),

      ),
      child: Text(text,
        style:GoogleFonts.roboto(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xff831529),

        ),
      )
    );
  }
}

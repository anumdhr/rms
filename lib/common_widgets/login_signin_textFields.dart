import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MailPasswordField extends StatelessWidget {
  MailPasswordField({
    required this.prefixIcon,
    required this.text,
    this.hintText,
    required this.suffixIcon,
    required this.controller,
    required this.obscureText,

    super.key,
  });

  final IconData prefixIcon;
  final String text;
  String? hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              prefixIcon,
              color: Color(0xff831529),
              size: 18,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: GoogleFonts.roboto(
                color: Color(0xff831529),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color(0xff831529),
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 5,
                color: Color(0xff831529),
              ),
            ),
            suffixIcon:suffixIcon ,
            suffixIconConstraints: BoxConstraints(
              minHeight: 6,
              maxHeight: 18,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xff831529),
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
// InkWell(
// onTap: onTap,
// child: CircleAvatar(
// radius: 16,
// backgroundColor: Color(0xff831529),
// child: Icon(
// suffixIcon,
// size: 15,
// ),
// ),
// )
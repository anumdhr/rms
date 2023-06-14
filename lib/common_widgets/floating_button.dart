import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({ required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xffF6921E),
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
               text,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: Color(0xffFCD9B0),
                child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}

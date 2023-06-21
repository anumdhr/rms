import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldFormText extends StatelessWidget {
  const FieldFormText({
    required this.text,
    required this.hintText,
    required this.showPopupMenu,

    super.key,
  });

  final String text;
  final String hintText;
  final bool showPopupMenu;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color(0xff831529),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: showPopupMenu
                ? PopupMenuButton(

                    onSelected: (value) {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Color(0xffFFB7C4),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Color(0xff831529),
                      child: Icon(Icons.arrow_drop_down_outlined),
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text("Nepal Restaurant"),
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Banepa Restaurant And Khaja Ghar",
                            ),
                          ),
                          PopupMenuItem(
                            child: Text("Jhigu Restaurant"),
                          ),
                        ])
                : null,
            fillColor: Color(0xffFFDFE6),
            filled: true,
            hintText: hintText,
            hintStyle: GoogleFonts.roboto(
              color: Color(0xff831529).withOpacity(0.25),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffFFDFE6),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color(0xffFFDFE6),
                )),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffFFDFE6),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }
}

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    required this.text,
    required this.hintText,
    required this.image,
    super.key,
  });

  final String text;
  final String hintText;

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(width: 10,),
            Text(
              /*
              this can be done when we have made the text nullable,,,since
              text cannot be nullable..
              text ?? '',
               */
              text,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Color(0xff831529),
              ),
            ),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
            // fillColor: Color(0xffFFDFE6),
            // filled: true,
            hintText: hintText,
            hintStyle: GoogleFonts.roboto(
              color: Color(0xff831529).withOpacity(0.25),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            enabled: true,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xff831529).withOpacity(0.5),
            )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xff831529).withOpacity(0.5),
            )),
          ),
        )
      ],
    );
  }
}

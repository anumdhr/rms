import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SetUpTextField extends StatelessWidget {
  const SetUpTextField({
    super.key,
    required this.text,
    required this.hintText,
     this.controller,
    this.suffixIcon,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String text;
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Text(
            text,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: const Color(0xff831529),
            ),
          ),
          TextFormField(
            onChanged: onChanged,

            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              fillColor: const Color(0xffFFDFE6),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffFFDFE6),
                  style: BorderStyle.none,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffFFDFE6),
                  style: BorderStyle.none,
                ),
              ),
            ),
            style: GoogleFonts.roboto(
              color: const Color(0xff831529),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}

class CustomPopupMenu extends StatefulWidget {
  CustomPopupMenu({
    super.key,
    required this.text,
  });

  String text;

  @override
  State<CustomPopupMenu> createState() => _CustomPopupMenuState();
}

class _CustomPopupMenuState extends State<CustomPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: (value) {
          setState(() {
            widget.text = value;
          });
        },
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
                onTap: () {},
                value: 0,
                child: Text("Beeb Kitchen"),
              ),
              PopupMenuItem(
                child: Text(
                  "Yogi Kitchen",
                ),
              ),
              PopupMenuItem(
                child: Text("Alish Kitchen"),
              ),
            ]);
  }
}

class FoodProvTextField extends StatelessWidget {
  const FoodProvTextField({Key? key, required this.hintText, required this.text, required this.controller}) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: const Color(0xffFFDFE6),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffFFDFE6),
                style: BorderStyle.none,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xffFFDFE6),
                style: BorderStyle.none,
              ),
            ),
          ),
          style: GoogleFonts.roboto(
            color: const Color(0xff831529),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

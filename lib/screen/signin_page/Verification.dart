import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Verification extends StatelessWidget {
  const Verification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),

        // width: 69,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffFFDFE6),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          inputFormatters: [LengthLimitingTextInputFormatter(1)],
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "#",
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common_widgets/kitchen_setup_textfield.dart';

class CreateKitchen extends StatefulWidget {
   CreateKitchen({
    super.key,
    required this.kitchenName,
    required this.address,
    required this.value1,
  });

  final TextEditingController kitchenName;
  final TextEditingController address;
   bool value1;

  @override
  State<CreateKitchen> createState() => _CreateKitchenState();
}


class _CreateKitchenState extends State<CreateKitchen> {
  @override

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SetUpTextField(
              controller: widget.kitchenName,
              text: "Kitchen Name",
              hintText: "Type Here...",
            ),
            const SizedBox(
              width: 10,
            ),
            SetUpTextField(
              controller: widget.address,
              text: "Address",
              hintText: "Type Here...",
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                // width: 350,
                // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFFDFE6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Multi Chef",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff831529),
                      ),
                    ),
                    Expanded(
                      child: Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          activeColor: const Color(0xff831529),
                          trackColor: const Color(0xffFFB7C4),
                          thumbColor: const Color(0xffffffff),
                          value: widget.value1,
                          onChanged: (value) {
                            setState(
                              () {
                                widget.value1 = value;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

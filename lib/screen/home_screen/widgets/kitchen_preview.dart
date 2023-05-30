import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class KitchenPreview extends StatelessWidget {
  const KitchenPreview({
    super.key,required this.image, required this.status, required this.rate,
    required this.color,
  });
  final String image;
  final String status;
  final int rate;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),

      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      height: 150,
      width: 215,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:color,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 76,
                width: 83,
                child: SvgPicture.asset(image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(status,
                style: GoogleFonts.roboto(
                  color: Color(0xff831529),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),

            ],
          ),
          Spacer(),
          Text('$rate',
            style: GoogleFonts.roboto(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Color(0xffF6921E),
            ),
          )

        ],
      ),

    );
  }
}

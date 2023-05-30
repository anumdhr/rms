import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/screen/home_screen/widgets/kitchen_preview.dart';
import 'package:rm_ui/screen/home_screen/widgets/modify_table/modify_table.dart';
import 'package:rm_ui/screen/home_screen/widgets/switch_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, this.typeController}) : super(key: key);
  final TabController? typeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFECEC),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          // centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset("assets/images/MenuIcon.svg"),
          ),
          title: Text(
            "Restaurant Management System",
            style: GoogleFonts.roboto(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff831529),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Text(
                "Status Online",
                style: GoogleFonts.roboto(
                  color: const Color(0xff652D90),
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 714,
            margin: const EdgeInsets.symmetric(vertical: 18),
            padding: const EdgeInsets.only(top: 3, left: 2, right: 2, bottom: 1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xffF6921E),

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  const [

                SwitchBar(text: " TABLE"),
                SwitchBar(text: "FOOD"),
                SwitchBar(text: "SERVE/PACK"),
                SwitchBar(text: "ORDERED"),
              ],
            ),
          ),
          const ModifyTable(),
          Container(
            height: 318,
            width: MediaQuery.of(context).size.width,

            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
                  child: Text("Kitchen Preview",
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff831529)


                    ),
                  ),
                ),
                Row(
                  children: const [
                    KitchenPreview(
                      color: Color(0xffFFEEDB),
                      image: "assets/images/Order.svg",
                      status: "Orders",
                      rate: 909,
                    ),
                    KitchenPreview(
                      color: Color(0xffCFE8FF),
                      image: "assets/images/Cooking.svg",
                      status: "Cooking",
                      rate: 888,
                    ),
                    KitchenPreview(
                      color: Color(0xffFFDFE6),
                      image: "assets/images/Cooked.svg",
                      status: "Cooked",
                      rate: 900,
                    ),
                    KitchenPreview(
                      color: Color(0xffF0D8FF),
                      image: "assets/images/Served.svg",
                      status: "Served",
                      rate: 958,
                    ),
                  ],
                ),



              ],
            ),

          )

        ],
      ),
    );
  }
}



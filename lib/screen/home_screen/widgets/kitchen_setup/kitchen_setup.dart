import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/models/ordered_model/ordered_model.dart';
import '../../../../common_widgets/custom_app_bar.dart';
import '../../../../controller/count_controller.dart';

class KitchenSetUp extends StatefulWidget {
  const KitchenSetUp({Key? key}) : super(key: key);

  @override
  State<KitchenSetUp> createState() => _KitchenSetUpState();
}

class _KitchenSetUpState extends State<KitchenSetUp> {
  @override
  Widget build(BuildContext context) {
    final cc = Get.find<CountController>();
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          text: "Kitchen Setup",
          onTap: () {
            Navigator.pop(context);
          },
          colorChange: false,
        ),
        preferredSize: Size.fromHeight(50.h),
      ),
      body: Container(
        height: 300,
        padding: EdgeInsets.only(left: 24, right: 24, top: 48),
        color: Color(0xffF6921E),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: kitchenSetUpModel.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2,
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => gridOrderedModel[index].navPage,
                      ),
                    );
                    cc.tabIndex.value = index;
                  },
                  child: Container(
                    height: 72,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(kitchenSetUpModel[index].image),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            kitchenSetUpModel[index].text,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Color(0xff831529),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text("Copyright © Emerge Infosys | All Rights Reserved 2023. ",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color(0xffFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

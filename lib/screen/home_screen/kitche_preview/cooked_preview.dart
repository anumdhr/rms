import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../models/ordered_model/ordered_model.dart';

class CookedPage extends StatelessWidget {
  const CookedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        backgroundColor: Color(0xffFFFFFF),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: CircleAvatar(

              backgroundColor: Color(0xff831529),
              radius: 5,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 10,
              ),
            ),
          ),
        ),
        title: Text("Kitchen Name Preview",
          style: GoogleFonts.roboto(
            color: Color(0xff831529),
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        color: Color(0xffFFEEDB),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cooked History",
                    style: GoogleFonts.roboto(
                      color: Color(0xff831529),
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "900",
                    style: GoogleFonts.roboto(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffF6921E),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    // scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.84, mainAxisSpacing: 10, crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xffF29AAF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 17,
                                  width: 25,
                                  child: SvgPicture.asset("assets/images/TableIcon.svg"),
                                ),
                                Text(
                                  "Table 6",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color(0xff831529),
                                  ),
                                ),
                                Spacer(),
                                IconButton(onPressed: () {}, icon: Icon(Icons.lightbulb))
                              ],
                            ),
                            Expanded(
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 16),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    gridOrderedModel[index].dish_name,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w500,
                                                      color: Color(0xff831529),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "QTY. ${gridOrderedModel[index].quantity}",
                                                        style: GoogleFonts.roboto(
                                                          color: Color(0xff831529),
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      //for current date in the field
                                                      Text(
                                                        DateFormat.jm().format(DateTime.now()),
                                                        style: GoogleFonts.roboto(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(0xff831529).withOpacity(0.7),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Serve: ${gridOrderedModel[index].serve}",
                                                        style: GoogleFonts.roboto(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w400,
                                                          color: Color(0xff831529).withOpacity(0.7),
                                                        ),
                                                      ),
                                                      Text("Packing ${gridOrderedModel[index].packing}"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xffF6921E),
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(12),
                                                      bottomLeft: Radius.circular(12),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "RS.${gridOrderedModel[index].price}",
                                                    style: GoogleFonts.roboto(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 24,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider();
                                  },
                                  itemCount: gridOrderedModel.length),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}

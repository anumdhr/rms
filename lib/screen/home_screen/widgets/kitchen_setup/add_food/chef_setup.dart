import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/models/chef_model/chef_model.dart';

import '../../../../../common_widgets/floating_button.dart';
import '../../../../../common_widgets/kitchen_setup_textfield.dart';
import '../../../../../controller/count_controller.dart';
import '../../../../../shared_pref/chef_preference.dart';

class ChefSetUp extends StatefulWidget {
  const ChefSetUp({
    super.key,
  });

  @override
  State<ChefSetUp> createState() => _ChefSetUpState();
}

class _ChefSetUpState extends State<ChefSetUp> {
  final cc = Get.find<CountController>();
  String text = '';

  final chefName = TextEditingController();
  final priority = TextEditingController();

  // final pref = SharedPreferences.getInstance();

  @override
  void initState() {
    SharedPreferenceServices.init().then((value) {
      getName();
    });

    super.initState();
  }

  void getName() {
    setState(() {
      chefName.text = SharedPreferenceServices.getChefName() ?? 'no value';
      priority.text = SharedPreferenceServices.getPriority() ?? "";
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Expanded(
        flex: 4,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          cc.chefIndex.value = 0;
                        },
                        child: Text(
                          'Create Chef  ',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: cc.chefIndex.value == 0 ? const Color(0xff831529) : const Color(0xffFFDEE6),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: const Color(0xffBCBCBC).withOpacity(0.5),
                      ),
                      InkWell(
                        onTap: () {
                          cc.chefIndex.value = 1;
                        },
                        child: Text(
                          'Chef List',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: cc.chefIndex.value == 1 ? const Color(0xff831529) : const Color(0xffFFDEE6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // CreateOrShowList(
                  //     preText: "Create Chef  ",
                  //     sufText: "  Chef List"),
                  const SizedBox(
                    height: 10,
                  ),
                  if (cc.chefIndex.value == 0)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SetUpTextField(
                              controller: chefName,
                              text: "Chef Name",
                              hintText: "Type Here...",
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SetUpTextField(
                              /*
                                yo text field haina so change it and tyo drop down chai pailai ko mildaina so again
                                banaunu
                                 */
                              onChanged: (p0) {
                                setState(() {
                                  p0 = text;
                                });
                              },
                              // controller: priority,
                              text: "Choose Kitchen",
                              hintText: "Select Kitchen",
                              suffixIcon: CustomPopupMenu(text: text),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SetUpTextField(
                              controller: priority,
                              text: "Priority",
                              hintText: "Type Here...",
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.transparent,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  if (cc.chefIndex.value == 1)
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff831529),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Flex(
                                      direction: Get.width < 900 ? Axis.vertical : Axis.horizontal,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          Text(
                                            chefModel[index].chefName,
                                            style: GoogleFonts.roboto(
                                              color: const Color(0xffFFFFFF),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "Kitchen : Beeb Kitchen",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.roboto(
                                              color: const Color(0xffFFFFFF).withOpacity(0.5),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ]),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Priority",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                    color: const Color(0xffFFFFFF),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  " ${chefModel[index].priority}  ",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                    color: const Color(0xffFFFFFF),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 1,
                                              color: const Color(0xffFFFFFF).withOpacity(0.5),
                                              height: 20,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffFFB7C4),
                                    ),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return BackdropFilter(
                                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                                child: AlertDialog(
                                                  backgroundColor: Colors.transparent,
                                                  content: Container(
                                                    width: 479,
                                                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      // color: Color(0xffFFFFFF),
                                                      color: Colors.white,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "DELETE",
                                                          style: GoogleFonts.roboto(
                                                            color: const Color(0xff831529),
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "Are you sure you want to remove the list?",
                                                          style: GoogleFonts.roboto(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 18,
                                                            color: const Color(0xff831529).withOpacity(0.7),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  chefModel.removeAt(index);
                                                                  Navigator.pop(context);
                                                                });
                                                              },
                                                              child: Container(
                                                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                                                decoration: BoxDecoration(
                                                                  color: const Color(0xffFFB7C4),
                                                                  borderRadius: BorderRadius.circular(20),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "OK",
                                                                    style: GoogleFonts.roboto(
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight.w400,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: chefModel.length),
                    ),
                ],
              ),
            ),
            if (cc.chefIndex.value == 0)
              Positioned(
                bottom: 15,
                right: 25,
                child: FloatingButton(
                  text: "ADD CHEF",
                  onTap: () async {
                    await SharedPreferenceServices.setChefName(chefName.text);
                    await SharedPreferenceServices.setPriority(priority.text);
                    if (priority.text.isEmpty && chefName.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Empty Content. Please fill the form')));
                    } else {
                      chefModel.add(ChefModel(priority: priority.text, chefName: chefName.text));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Shown')));

                      priority.clear();
                      chefName.clear();
                    }
                  },
                ),
              ),
          ],
        ),
      );
    });
  }
}

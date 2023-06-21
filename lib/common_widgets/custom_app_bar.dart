import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rm_ui/screen/home_screen/widgets/my_profile/my_profile.dart';
import 'package:rm_ui/screen/login_screen/login_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text, required this.onTap, required this.colorChange});

  final String text;
  final void Function()? onTap;
  final bool colorChange;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: colorChange
              ? SvgPicture.asset(
                  "assets/images/MenuIcon.svg",
                  fit: BoxFit.contain,
                )
              : SvgPicture.asset("assets/images/MenuIcon(Color).svg"),
        ),
      ),
      title: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xff831529),
        ),
      ),
      actions: <Widget>[
        PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Color(0xffFFFFFF).withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: CircleAvatar(
              backgroundColor: Color(0xff832915),
              radius: 20,
              child: SvgPicture.asset(
                "assets/images/RM Logo_RM Logo 1.svg",
                height: 20,
                width: 20,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
                child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyProfile();
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Color(0xff831529),
                  ),
                  Text(
                    "My Profile",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff831529),
                    ),
                  ),
                ],
              ),
            )),
            PopupMenuItem(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.assignment_ind_outlined,
                      color: Color(0xff831529),
                    ),
                    Text(
                      "Sign Out",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff831529),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vooluntee/my_widgets/colors.dart';
import 'package:vooluntee/my_widgets/my_buttons.dart';
import 'package:vooluntee/view/login_sign_up_folder/login_Page.dart';
import 'package:vooluntee/view/login_sign_up_folder/sign_up_Page.dart';

class SelectSignupMode extends StatefulWidget {
  const SelectSignupMode({super.key});

  @override
  State<SelectSignupMode> createState() => _SelectSignupModeState();
}

class _SelectSignupModeState extends State<SelectSignupMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              'Discover volunteering opputunities close to you',
              style: GoogleFonts.raleway(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            // Image.asset('assets/images/splashimg.png'),
            // Image.asset('assets/images/splashimg.png'),
            Image.asset('assets/images/splashimg2.jpg'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            MyButtons(
              buttonText: 'Next',
              buttonBackgroundColor: AppColors.primary,
              buttonHeight: MediaQuery.of(context).size.height * 0.06,
              buttonWidth: MediaQuery.of(context).size.width * 0.6,
              buttonTextstyle:
                  GoogleFonts.inter(fontSize: 15, color: Colors.white),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
            ),
          ],
        ),
      )),
    );
  }
}

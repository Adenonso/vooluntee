import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vooluntee/my_widgets/colors.dart';
import 'package:vooluntee/my_widgets/my_buttons.dart';
import 'package:vooluntee/view/login_sign_up_folder/splash_screen_two.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Text(
              'Make  a difference through volunteering',
              style: GoogleFonts.raleway(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            // Image.asset('assets/images/splashimg.png'),
            // Image.asset('assets/images/splashimg.png'),
            Image.asset('assets/images/splashimg.png'),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectSignupMode()));
              },
            ),
          ],
        ),
      )),
    );
  }
}

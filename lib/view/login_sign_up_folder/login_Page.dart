// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vooluntee/my_widgets/colors.dart';
import 'package:vooluntee/my_widgets/my_buttons.dart';
import 'package:vooluntee/services/auth_service.dart';
import 'package:vooluntee/view/main_screens/select_screen.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordHiddden = true;

  //instantiate the auth service
  final AuthService _authService = AuthService();

  void _login() async {
    setState(() {
      isLoading = true;
    });

    //calll the login function from authservice class
    String? result = await _authService.login(
        email: emailController.text, password: passwordController.text);

    setState(() {
      isLoading = false;
    });

    //navigate to the select screen page
    if (result != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Welcome to Vooluntee")));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SelectScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Unsuccessful! $result")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              spacing: 15,
              children: [
                SizedBox(
                  height: 1,
                ),
                //header containing the signup button
                Row(
                  spacing: 5,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: AppColors.secondary,
                        )),
                    Spacer(),
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.raleway(fontSize: 14),
                    ),
                    MyButtons(
                      buttonWidth: 69,
                      buttonHeight: 36,
                      buttonText: "Sign up",
                      borderColor: AppColors.primary,
                      buttonTextstyle: GoogleFonts.raleway(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Text(
                  "Login to your account",
                  style: GoogleFonts.lora(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Start exploring the universe",
                  style: GoogleFonts.raleway(
                    fontSize: 15,
                  ),
                ),

                //email field
                Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    Text(
                      'Email',
                      style: GoogleFonts.raleway(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700),
                    ),
                    TextField(
                      controller: emailController,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: GoogleFonts.raleway(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500), //raleway font

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: AppColors
                                  .neutralLight), // Red border when not focused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: AppColors.secondary,
                              width: 2), // Red border when focused
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      ),
                    ),
                  ],
                ),

                //password field
                Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    Text(
                      'Create Password',
                      style: GoogleFonts.raleway(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: isPasswordHiddden,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Create your password',
                        hintStyle: GoogleFonts.raleway(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500), //raleway font
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordHiddden = !isPasswordHiddden;
                            });
                          },
                          icon: Icon(
                            isPasswordHiddden
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.neutralLight,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: AppColors
                                  .neutralLight), // Red border when not focused
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: AppColors.secondary,
                              width: 2), // Red border when focused
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      ),
                    ),
                  ],
                ),

                //forgot password text button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot password?",
                      style: GoogleFonts.raleway(
                          fontSize: 15, color: AppColors.primary),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),

                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    :
                    //login button
                    GestureDetector(
                        onTap: _login,
                        child: Container(
                          height: 56,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Text(
                              "Log in",
                              style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.background),
                            ),
                          ),
                        ),
                      ),

                //login wiht google button
                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //       height: 58,
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //           color: AppColors.transparent,
                //           borderRadius: BorderRadius.circular(8),
                //           border: Border.all(
                //               color: AppColors.neutralLight, width: 1)),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         spacing: 15,
                //         children: [
                //           SvgPicture.asset('assets/images/googleLogosvg.svg'),
                //           Text(
                //             "Sign up with Google",
                //             style: GoogleFonts.raleway(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.w500,
                //                 color: AppColors.black),
                //           ),
                //         ],
                //       )),
                // ),
                // SizedBox(
                //   height: 25,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

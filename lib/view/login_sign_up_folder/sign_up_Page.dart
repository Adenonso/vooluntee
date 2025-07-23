// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vooluntee/my_widgets/colors.dart';
import 'package:vooluntee/my_widgets/my_buttons.dart';
import 'package:vooluntee/services/auth_service.dart';
import 'package:vooluntee/view/login_sign_up_folder/login_Page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = true;

  @override
  void initState() {
    super.initState();
    isChecked = false;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedRole = "Volunteer";
  bool isLoading = false;
  bool isPasswordHiddden = true;

  //instancse for the auth service
  final AuthService _authService = AuthService();

  //sign up function
  void _signup() async {
    //while creating the user account, for spinner
    setState(() {
      isLoading = true;
    });

    //call signup function from authservice
    String? result = await _authService.signup(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        role: selectedRole);

    setState(() {
      isLoading = false;
    });

    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("SignUp Successful! Now Login Successfully")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyLoginPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("SignUp Unsuccessful! $result")));
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
                //header section with login button
                Row(
                  spacing: 5,
                  children: [
                    GestureDetector(
                        child: Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.secondary,
                    )),
                    Spacer(),
                    Text(
                      "Have an account?",
                      style: GoogleFonts.raleway(fontSize: 14),
                    ),
                    MyButtons(
                      buttonWidth: 69,
                      buttonHeight: 36,
                      buttonText: "Log in",
                      borderColor: AppColors.primary,
                      buttonTextstyle: GoogleFonts.raleway(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyLoginPage()));
                      },
                    )
                  ],
                ),
                Text(
                  "Create an account",
                  style: GoogleFonts.lora(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                //name field
                Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    Text(
                      'Name',
                      style: GoogleFonts.raleway(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700),
                    ),
                    TextField(
                      controller: nameController,
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
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

                //minimum lenght description
                Row(
                  children: [
                    Text(
                      "Must be at least 8 characters",
                      style: GoogleFonts.raleway(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),

                //select your role
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      'Select your role',
                      style: GoogleFonts.raleway(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700),
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedRole,
                      items: [
                        DropdownMenuItem(
                          value: 'Volunteer',
                          child: Text('Volunteer'),
                        ),
                        DropdownMenuItem(
                          value: 'Organizer',
                          child: Text('Organizer'),
                        ),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedRole = newValue!;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Select your role',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),

                //accept terms and conditions
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: Icon(
                          isChecked
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded,
                          color: isChecked
                              ? AppColors.secondary
                              : AppColors.neutralLight,
                        )),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Please accept our ",
                            style: GoogleFonts.lora(
                                fontSize: 12, color: Colors.black),
                          ),
                          TextSpan(
                            text: "Terms and Conditions",
                            style: GoogleFonts.lora(
                                fontSize: 12,
                                color: AppColors.primary,
                                decoration: TextDecoration.underline),
                          ),
                          TextSpan(
                            text: " before proceeding ",
                            style: GoogleFonts.lora(
                                fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //loading spinner widget
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    :
                    //signup button
                    GestureDetector(
                        onTap: _signup,
                        child: Container(
                          height: 56,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                              color: isChecked
                                  ? AppColors.secondary
                                  : AppColors.neutralLight,
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.background),
                            ),
                          ),
                        ),
                      ),

                //sign up with google button
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 58,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppColors.neutralLight, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 15,
                        children: [
                          SvgPicture.asset('assets/images/googleLogosvg.svg'),
                          Text(
                            "Sign up with Google",
                            style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

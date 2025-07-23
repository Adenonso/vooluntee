import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vooluntee/my_widgets/colors.dart';
import 'package:vooluntee/services/auth_service.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final AuthService _authService = AuthService();

  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _authService.getUserData().then((data) {
      setState(() {
        userData = data;
      });
    });
  }

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userData != null
          ? SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      AppBar(
                          centerTitle: true,
                          title: Text('P R O F I L E',
                              style: GoogleFonts.raleway(fontSize: 20)),
                          leading: Icon(
                            Icons.circle,
                            size: 20,
                          )),

                      GestureDetector(
                        onTap: () => _pickImage(ImageSource.gallery),
                        child: Stack(
                          children: [
                            _image != null
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.primary,
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                              22, 91, 78, 78),
                                          blurRadius: 3,
                                          offset: Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                    child: CircleAvatar(
                                        radius: 75,
                                        backgroundImage: FileImage(_image!)),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.black,
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                              22, 91, 78, 78),
                                          blurRadius: 3,
                                          offset: Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor:
                                          AppColors.neutralLightExtra,
                                      radius: 75,
                                      child: Icon(
                                        Icons.person,
                                        size: 75,
                                      ),
                                    ),
                                  ),
                            Positioned(
                              bottom: 10, // Position at the bottom
                              right: 10, // Position at the right
                              child: SvgPicture.asset(
                                  'assets/images/edit-photo.svg',
                                  width: 34,
                                  height: 34),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        userData!['name'],
                        style: GoogleFonts.raleway(fontSize: 20),
                      ),

                      //display events
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

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
      backgroundColor: AppColors.background,
      body: userData != null
          ? SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      AppBar(
                          backgroundColor: AppColors.background,
                          centerTitle: true,
                          title: Text('P R O F I L E',
                              style: GoogleFonts.raleway(fontSize: 20)),
                          leading: Icon(
                            Icons.circle,
                            size: 20,
                            color: userData!['role'] == 'Volunteer'
                                ? AppColors.primary
                                : AppColors.secondary,
                          )),

                      //profile picture
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
                      //profile name
                      Text(
                        userData!['name'],
                        style: GoogleFonts.raleway(fontSize: 20),
                      ),

                      SizedBox(height: 20),

                      //display user data
                      //this section will display based on the user sign up role

                      if (userData!['role'] == 'Volunteer')
                        VolunteerProfile()
                      else if (userData!['role'] == 'Organizer')
                        OrganizerProile()
                      else
                        Center(
                          child: Text(
                            'No profile data available',
                            style: GoogleFonts.raleway(fontSize: 16),
                          ),
                        ),
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

class OrganizerProile extends StatefulWidget {
  const OrganizerProile({super.key});

  @override
  State<OrganizerProile> createState() => _OrganizerProileState();
}

class _OrganizerProileState extends State<OrganizerProile> {
  bool isEditingLocation = false;
  bool isEditingPhone = false;
  bool isEditingEmail = false;
  bool isEditingInfo = false;

  late TextEditingController locationController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController infoController;

  @override
  void initState() {
    super.initState();
    locationController = TextEditingController(text: 'Lagos, Nigeria');
    phoneController = TextEditingController(text: ' +234 800 000 0000');
    emailController = TextEditingController(text: 'example@mail.com');
    infoController = TextEditingController(text: 'Describe yourself!');
  }

  @override
  void dispose() {
    locationController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void saveInfo() {
    setState(() {
      isEditingLocation = false;
      isEditingPhone = false;
      isEditingEmail = false;
      isEditingInfo = false;
    });
    // You can also save data to local storage or backend here
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Success!',
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Information saved',
            style:
                GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'OK',
                style: GoogleFonts.raleway(
                    fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final SizedBox autospace = SizedBox(height: 10);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //info text
          Text(
            'Info',
            style:
                GoogleFonts.raleway(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          // Subtitle
          isEditingInfo
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: infoController,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.raleway(color: Colors.black54),
                      onSubmitted: (_) => setState(() => isEditingInfo = false),
                      decoration: InputDecoration(
                          hintText: infoController.text,
                          hintStyle: GoogleFonts.raleway(fontSize: 20)),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                        onPressed: saveInfo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 161, 74, 74),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          'Save',
                          style: GoogleFonts.raleway(),
                        ),
                      ),
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: () => setState(() => isEditingInfo = true),
                  child: Text(
                    infoController.text,
                    style: GoogleFonts.raleway(
                        color: Colors.black54, fontSize: 17),
                  ),
                ),
          const SizedBox(height: 15),

          //completed events button
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(132, 211, 234, 225),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 15,
              children: [
                Text(
                  'Completed Events',
                  style: GoogleFonts.openSans(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
          autospace,
          autospace,

          //volunteering impact card
          Container(
            // height: 350,
            // width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/splashimg2.jpg',
                  fit: BoxFit.fitHeight,
                ),

                //texts aligned to the left
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      //volunteering impact text
                      Text(
                        'Volunteering\nImpact',
                        style: GoogleFonts.raleway(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      //number of events completed
                      Text(
                        '14',
                        style: GoogleFonts.raleway(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Events Completed',
                        style: GoogleFonts.raleway(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),

          //row of metrics
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 40,
            children: [
              Column(
                children: [
                  //number of volunteers
                  Text(
                    'Over 600',
                    style: GoogleFonts.raleway(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lives Impacted!',
                    style: GoogleFonts.raleway(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                children: [
                  //number of volunteers
                  Text(
                    '120',
                    style: GoogleFonts.raleway(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Volunteers',
                    style: GoogleFonts.raleway(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 25),

          //badges
          Row(
            spacing: 16,
            children: [
              // Badge card
              Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Badges',
                    style: GoogleFonts.raleway(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // Badge icon 2010
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.orange[200],
                child: const Icon(Icons.emoji_events, color: Colors.white),
              ),
              // Badge icon 0000
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.red[200],
                child: const Icon(Icons.local_fire_department,
                    color: Colors.white),
              ),
              const SizedBox(height: 4),
            ],
          ),
          const SizedBox(height: 15),

          Divider(
            color: const Color.fromARGB(255, 192, 62, 62),
          ),
          SizedBox(height: 15),

          // Contact information
          Text(
            'Contact Information',
            style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Editable Location
          isEditingLocation
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: locationController,
                      autofocus: true,
                      style: GoogleFonts.raleway(color: Colors.black54),
                      onSubmitted: (_) =>
                          setState(() => isEditingLocation = false),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                        onPressed: saveInfo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 161, 74, 74),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          'Save',
                          style: GoogleFonts.raleway(),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Location: ',
                      style: GoogleFonts.raleway(
                          color: Colors.black, fontSize: 17),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => setState(() => isEditingLocation = true),
                      child: Text(
                        locationController.text,
                        style: GoogleFonts.raleway(
                            color: Colors.black54, fontSize: 17),
                      ),
                    ),
                  ],
                ),

          // Editable Phone
          isEditingPhone
              ? TextField(
                  controller: phoneController,
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  style: GoogleFonts.raleway(color: Colors.black54),
                  onSubmitted: (_) => setState(() => isEditingPhone = false),
                )
              : GestureDetector(
                  onTap: () => setState(() => isEditingPhone = true),
                  child: Text(
                    phoneController.text,
                    style: GoogleFonts.raleway(
                        color: Colors.black54, fontSize: 17),
                  ),
                ),

          // Editable Email
          isEditingEmail
              ? TextField(
                  controller: emailController,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.raleway(color: Colors.black54),
                  onSubmitted: (_) => setState(() => isEditingEmail = false),
                )
              : GestureDetector(
                  onTap: () => setState(() => isEditingEmail = true),
                  child: Text(
                    emailController.text,
                    style: GoogleFonts.raleway(
                        color: Colors.black54, fontSize: 17),
                  ),
                ),
          const SizedBox(height: 24),
          autospace,
          autospace,
        ],
      ),
    );
  }
}

class VolunteerProfile extends StatefulWidget {
  const VolunteerProfile({super.key});

  @override
  State<VolunteerProfile> createState() => _VolunteerProfileState();
}

class _VolunteerProfileState extends State<VolunteerProfile> {
  bool isEditingLocation = false;
  bool isEditingPhone = false;
  bool isEditingEmail = false;
  bool isEditingInfo = false;

  late TextEditingController locationController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController infoController;

  @override
  void initState() {
    super.initState();
    locationController =
        TextEditingController(text: 'Location: Lagos, Nigeria');
    phoneController = TextEditingController(text: 'Phone: +234 800 000 0000');
    emailController = TextEditingController(text: 'Email: example@mail.com');
    infoController = TextEditingController(text: 'Describe yourself!');
  }

  @override
  void dispose() {
    locationController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void saveInfo() {
    setState(() {
      isEditingLocation = false;
      isEditingPhone = false;
      isEditingEmail = false;
      isEditingInfo = false;
    });
    // You can also save data to local storage or backend here
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Success!',
            style:
                GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Information saved',
            style:
                GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'OK',
                style: GoogleFonts.raleway(
                    fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //info text
          Text(
            'Info',
            style:
                GoogleFonts.raleway(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          // Subtitle
          isEditingInfo
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: infoController,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.raleway(color: Colors.black54),
                      onSubmitted: (_) => setState(() => isEditingInfo = false),
                      decoration: InputDecoration(
                          hintText: infoController.text,
                          hintStyle: GoogleFonts.raleway(fontSize: 20)),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                        onPressed: saveInfo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 161, 74, 74),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          'Save',
                          style: GoogleFonts.raleway(),
                        ),
                      ),
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: () => setState(() => isEditingInfo = true),
                  child: Text(
                    infoController.text,
                    style: GoogleFonts.raleway(
                        color: Colors.black54, fontSize: 17),
                  ),
                ),
          const SizedBox(height: 10),

          Divider(
            color: const Color.fromARGB(255, 192, 62, 62),
          ),

          // Hours volunteered title
          Text(
            'Hours Volunteered',
            style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('10',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w500, fontSize: 17)),
          const SizedBox(height: 10),

          //badges
          Row(
            spacing: 16,
            children: [
              // Badge card
              Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Badges',
                    style: GoogleFonts.raleway(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // Badge icon 2010
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.orange[200],
                child: const Icon(Icons.emoji_events, color: Colors.white),
              ),
              // Badge icon 0000
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.red[200],
                child: const Icon(Icons.local_fire_department,
                    color: Colors.white),
              ),
              const SizedBox(height: 4),
            ],
          ),
          const SizedBox(height: 15),

          Divider(
            color: const Color.fromARGB(255, 192, 62, 62),
          ),

          // Contact information
          Text(
            'Contact Information',
            style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Editable Location
          isEditingLocation
              ? TextField(
                  controller: locationController,
                  autofocus: true,
                  style: GoogleFonts.raleway(color: Colors.black54),
                  onSubmitted: (_) => setState(() => isEditingLocation = false),
                )
              : GestureDetector(
                  onTap: () => setState(() => isEditingLocation = true),
                  child: Text(
                    locationController.text,
                    style: GoogleFonts.raleway(
                        color: Colors.black54, fontSize: 17),
                  ),
                ),

          // Editable Phone
          isEditingPhone
              ? TextField(
                  controller: phoneController,
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  style: GoogleFonts.raleway(color: Colors.black54),
                  onSubmitted: (_) => setState(() => isEditingPhone = false),
                )
              : GestureDetector(
                  onTap: () => setState(() => isEditingPhone = true),
                  child: Text(
                    phoneController.text,
                    style: GoogleFonts.raleway(
                        color: Colors.black54, fontSize: 17),
                  ),
                ),

          // Editable Email
          isEditingEmail
              ? TextField(
                  controller: emailController,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.raleway(color: Colors.black54),
                  onSubmitted: (_) => setState(() => isEditingEmail = false),
                )
              : GestureDetector(
                  onTap: () => setState(() => isEditingEmail = true),
                  child: Text(
                    emailController.text,
                    style: GoogleFonts.raleway(
                        color: Colors.black54, fontSize: 17),
                  ),
                ),
          const SizedBox(height: 24),

          // Save Button
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.7,
          //       child: ElevatedButton(
          //         onPressed: saveInfo,
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: const Color.fromARGB(255, 161, 74, 74),
          //           foregroundColor: Colors.white,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           padding: const EdgeInsets.symmetric(vertical: 14),
          //         ),
          //         child: Text(
          //           'Save',
          //           style: GoogleFonts.raleway(),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 24),
        ],
      ),
    );
  }
}

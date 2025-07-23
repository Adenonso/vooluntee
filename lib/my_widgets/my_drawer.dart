import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vooluntee/services/auth_service.dart';
import 'package:vooluntee/view/login_sign_up_folder/sign_up_Page.dart';
// import 'package:pocket_tasks/view/my_settings.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final AuthService _auth = AuthService();

  void _logOut() async {
    setState(() {
      _auth.signOut();
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                title: Text(
                  'V O L U N T E A M',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                title: Text('H O M E', style: GoogleFonts.inter()),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                title: Text('Terms and Conditions', style: GoogleFonts.inter()),
                leading: Icon(Icons.home),
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => MyLoginPage()));
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                title: Text('S E T T I N G S', style: GoogleFonts.inter()),
                leading: Icon(Icons.settings),
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => MySettings()));
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(
                  title: Text('L O G O U T', style: GoogleFonts.inter()),
                  leading: Icon(Icons.settings),
                  onTap: _logOut),
            ),
          ],
        ),
      ),
    );
  }
}

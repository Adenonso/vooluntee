//usermail: dan111@gmail.com
//password: dan111

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vooluntee/my_widgets/colors.dart';
import 'package:vooluntee/my_widgets/my_drawer.dart';
import 'package:vooluntee/services/auth_service.dart';
import 'package:vooluntee/view/create_event_folder/create_event_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        scrolledUnderElevation: 20,
        title: Text(
          "Vooluntee",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            // color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: userData != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: SizedBox(
                width: double.infinity,
                child: Stack(children: [
                  Column(
                    children: [
                      Text(
                        'Hi ${userData!['name']}, Welcome to VolunTeam\nYour go to place to find volunteers',
                        style: GoogleFonts.raleway(fontSize: 15),
                      ),

                      //display events
                    ],
                  ),
                  if (userData!['role'] == 'Organizer')
                    Positioned(
                        right: 20,
                        // width: 10,
                        // left: 80,
                        bottom: 20,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateEventPage()));
                          },
                          icon: Icon(Icons.add),
                          label: Text('Create an event'),
                        ))
                ]),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

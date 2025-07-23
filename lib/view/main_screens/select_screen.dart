import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vooluntee/my_widgets/colors.dart';
import 'package:vooluntee/view/main_screens/events_page.dart';
import 'package:vooluntee/view/main_screens/home_page.dart';
import 'package:vooluntee/view/main_screens/my_profile.dart';
import 'package:vooluntee/view/main_screens/notifications_page.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;

  @override
  void initState() {
    page = [
      MyHomePage(),
      EventsPage(),
      NotificationsPage(),
      MyProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: page[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.neutralSecondary,
        backgroundColor: AppColors
            .background, // Set to transparent to use the Container's color
        selectedIconTheme: IconThemeData(size: 17),
        unselectedIconTheme: IconThemeData(size: 17),
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: selectedIndex == 0 ? Icon(Iconsax.home5) : Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.card),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.notification),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

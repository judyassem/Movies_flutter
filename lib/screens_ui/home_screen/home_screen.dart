import 'package:flutter/material.dart';

import 'package:movies_app/util/app_colors.dart';

import '../tabs/browes_screen/browese_screen.dart';
import '../tabs/home_tap/home_tab.dart';
import '../tabs/profile_screen/profile_screen.dart';
import '../tabs/search_screen/search_tap.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home_Screen";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("assets/home_icon.png")), label: "Home"),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("assets/search_vector.png")),
        label: "Search"),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("assets/browse_vector.png")),
        label: "Browse"),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("assets/Vector.png")), label: "Profile")
  ];

  final List<Widget> tabs = [
    HomeTab(),
    SearchTap(),
    BroweseScreen(),
    ProfileScreen()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: buildBottomNavigationBar()),
      ),
      body: tabs[currentIndex],
    );
  }

  buildBottomNavigationBar() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.grayishBlack),
      child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          unselectedItemColor: AppColors.white,
          selectedItemColor: AppColors.yellow,
          items: bottomNavigationItems),
    );
  }
}

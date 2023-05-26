import 'package:bottom_navigation/view/about_us_view.dart';
import 'package:bottom_navigation/view/home_view.dart';
import 'package:bottom_navigation/view/profile_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;
  List<Widget> lstBottomScreens = [
    const HomeView(),
    const ProfileView(),
    const AboutUsView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floating button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: lstBottomScreens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.deepPurple,
        // selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_neutral), label: 'About us'),
        ],
      ),
    );
  }
}

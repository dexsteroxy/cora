import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:currency_app/pages/home.dart';
import 'package:currency_app/pages/booking.dart';
import 'package:currency_app/pages/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  // Your screens must all have default constructors
  final List<Widget> appScreens = const [
    Home(),
    Booking(), // <-- Make sure Booking() has no required arguments
    Profile(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreens[_selectedIndex],

      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: const Color(0xFF1C1C1E),
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 300),

        onTap: onItemTapped,

        items: const [
          Icon(Icons.home_outlined, color: Colors.white, size: 30),
          Icon(Icons.add, color: Colors.white, size: 30),
          Icon(Icons.ac_unit_outlined, color: Colors.white, size: 30),
        ],
      ),
    );
  }
}

import 'package:bank_app/transactionsScreen.dart';
import 'package:bank_app/dashboard.dart';
import 'package:bank_app/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex, 
        children: [
          const Dashboard(),
          TransactionsScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: GNav(
        gap: 8,
        backgroundColor: Colors.grey.shade100,
        tabs: const [
          GButton(icon: Icons.home, text: "Dashboard"),
          GButton(icon: Icons.compare_arrows, text: "Transactions"),
          GButton(icon: Icons.person, text: "Profile"),
        ],
        selectedIndex:
            _currentIndex, 
        onTabChange: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import 'changePasswordScreen.dart';
import 'login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade200,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SafeArea(
              top: true,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade400,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 175,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Krenar Syla",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Krenar28@gmail.com",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangePasswordScreen()),
                );
                
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade400,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.lock_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title: const Text("Change Password"),
            ),
            ListTile(
              onTap: () {
          
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade400,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.notifications_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Manage Notifications"),
                  SizedBox(
                    width: 100,
                    child: LiteRollingSwitch(
                      value:
                          true, 
                      textOn: 'On', 
                      textOff: 'Off', 
                      colorOn: Colors.greenAccent, 
                      colorOff: Colors.redAccent, 
                      iconOn: Icons.check, 
                      iconOff: Icons.close, 
                      onChanged: (bool state) {
                      
                      },
                      onTap:
                          () {}, 
                      onSwipe: () {},
                      onDoubleTap:
                          () {}, 
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                _showInviteFriendsDialog(context);
                
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade400,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person_add_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title: const Text("Invite Friends"),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade400,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.privacy_tip_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title:const  Text("Privacy Policy"),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade400,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.library_books_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title:const  Text("Terms and Conditions"),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                
                _showLogoutConfirmationDialog(
                    context); 
              },
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.shade400,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.logout_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title:
                  Text("Logout", style: TextStyle(color: Colors.red.shade400)),
            ),
          ],
        ),
      ),
    );
  }

  void _showInviteFriendsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Invite Friends"),
          content: const Text(
              "You can invite your friends through email or social media."),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
          ],
        );
      },
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout Confirmation"),
          content: const Text("Are you sure you want to log out?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); 
              },
            ),
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                
                Navigator.of(context).pop(); 
                Navigator.pushReplacement(
                  
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

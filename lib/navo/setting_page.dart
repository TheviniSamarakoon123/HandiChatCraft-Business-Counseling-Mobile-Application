import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1986581/navo/notification.dart';

import 'language_page.dart';
import 'security_page.dart';
import 'theme/dark_mode_page.dart';

class AccountSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Go back to ProfilePage
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        leadingWidth: 100,
      ),
      bottomNavigationBar: BottomNavBar(
        callback: (p0) {},
        index: 4,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 50),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: const Color.fromARGB(223, 233, 105, 7),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecurityPage()));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.security),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    'Security',
                    style: TextStyle(fontSize: 16),
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 140),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: const Color.fromARGB(223, 233, 105, 7),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThemeChangePage()));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.dark_mode),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    'Dark Mode',
                    style: TextStyle(fontSize: 16),
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 230),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: const Color.fromARGB(223, 233, 105, 7),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LanguagePage()));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.language),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    'Language',
                    style: TextStyle(fontSize: 16),
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 320),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20),
                foregroundColor: const Color.fromARGB(223, 233, 105, 7),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationPage()));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.notifications),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                    'Notification',
                    style: TextStyle(fontSize: 16),
                  )),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 50, top: 510),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(280, 55),
                backgroundColor: const Color.fromARGB(255, 221, 127, 12),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              onPressed: () {
                signOut(context);
              },
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the sign-in screen after sign-out
      Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
    } catch (e) {
      print('Error signing out: $e');
      // Handle sign-out errors, if any
    }
  }
}
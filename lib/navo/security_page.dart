import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';

class SecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Security',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(154, 196, 70, 7),
            fontFamily: 'Calistoga',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        callback: (p0) {},
        index: 4,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App Security',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(154, 244, 86, 7),
                fontFamily: 'Calistoga',
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Our commitment to safeguarding your data extends to our app security measures. We employ industry-standard encryption protocols to protect sensitive information transmitted through our application. Regular security audits and updates ensure that our app remains resilient against emerging threats. Additionally, stringent access controls and authentication mechanisms are in place to prevent unauthorized access. Your privacy and security are paramount, and we continuously strive to maintain the highest standards of protection within our application environment.',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Calistoga',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
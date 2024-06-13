import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select your preferred language:',
              style: TextStyle(fontSize: 18.0, color: Colors.orange),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // You can add functionality here if needed
              },
              child: const Text('English'),
            ),
            const SizedBox(
                height: 10.0), // Added space between the buttons and message
            const Text(
              'This app is available only in English.',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
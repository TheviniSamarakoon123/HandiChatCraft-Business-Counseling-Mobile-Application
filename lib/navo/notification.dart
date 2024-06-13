import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Variables to track notification settings
  bool _notifications = false;

  @override
  void initState() {
    super.initState();
    _checkNotificationPermission();
  }

  void _checkNotificationPermission() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool notificationsEnabled = prefs.getBool('notifications_enabled') ?? false;
    setState(() {
      _notifications = notificationsEnabled;
    });
  }

  void _saveNotificationPermission(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notifications_enabled', value);
    setState(() {
      _notifications = value;
    });
  }

  void _showNotificationDisabledMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Please enable notifications to receive notifications.'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      bottomNavigationBar: BottomNavBar(
        callback: (p0) {},
        index: 4,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return ListView(
            children: [
              // Only display the switch if notification permission is granted
              SwitchListTile(
                title: const Text('Receive notifications'),
                value: _notifications,
                onChanged: (value) {
                  _saveNotificationPermission(value);
                  if (!value) {
                    _showNotificationDisabledMessage(context);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
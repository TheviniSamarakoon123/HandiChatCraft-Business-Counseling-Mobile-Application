import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// Message Route Arguments
class MessageArguments {
  // The remote Message
  final RemoteMessage message;

  // Whether this message caused the application to open.
  final bool openedApplication;

  MessageArguments(this.message, this.openedApplication);
}

/// Display information about a [RemoteMessage].
class MessageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MessageArguments args =
        ModalRoute.of(context)!.settings.arguments! as MessageArguments;
    RemoteMessage message = args.message;
    RemoteNotification? notification = message.notification;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (notification != null) ...[
              Text(
                '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  letterSpacing: 1.1,
                ),
              ),
              SizedBox(height: 40,),
              buildNotificationCard(
                title: 'Appointment Name',
                content: notification.title ?? 'N/A',
              ),
              SizedBox(height: 40),
              buildNotificationCard(
                title: 'Appointment Details',
                content: notification.body ?? 'N/A',
              ),
              SizedBox(height: 40),
              buildNotificationCard(
                title: 'Sent Time',
                content: message.sentTime?.toString() ?? 'N/A',
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildNotificationCard({required String title, required String content}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

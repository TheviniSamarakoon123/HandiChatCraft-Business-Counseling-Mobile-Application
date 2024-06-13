import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_details.dart';

///Listens for incoming foreground messages and displays them in a list,
class MessageList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessageList();
}
class _MessageList extends State<MessageList> {
  List<RemoteMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState((){
        _messages = [..._messages,message];

      });
    });
  }

@override
Widget build(BuildContext context) {
  if(_messages.isEmpty) {
    return const Text('No any Notifications received');
  }
  return SingleChildScrollView(
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: _messages.length,
      itemBuilder:(context,index) {
        RemoteMessage message = _messages[index];
        return ListTile(
          title: Text(
            message.notification?.title ?? 'N/D',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            message.sentTime?.toString() ?? DateTime.now().toString(),
          ),
          trailing: Icon(Icons.notifications_active, color: Colors.orange),
          onTap: () => Navigator.pushNamed(
            context,
            '/message',
            arguments: MessageArguments(message, false),
          ),
        );
      },
    ),
  );
}
}
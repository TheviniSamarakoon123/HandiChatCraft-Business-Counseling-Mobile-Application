// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:handichatcraft_w1986581/thevini/pages/messages.dart';


class Chatbotpage extends StatefulWidget {
  const Chatbotpage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatbotpageState createState() => _ChatbotpageState();
}

class _ChatbotpageState extends State<Chatbotpage> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              'assets/chat-bot.png',
              color: Color.fromARGB(255, 255, 153, 0),
              fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'HandiBot',
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(222, 222, 133, 24),
                fontWeight: FontWeight.bold,
                fontFamily: 'Calistoga',
              ),
            )
          ], 
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
              'HandiBot gives you answers to questions about handicrafts such as Batik, Masks, Handloom, Pottery, Jewelry, Resin Arts,and Basket.',
               textAlign: TextAlign.center,
               style: TextStyle(
                color: Color.fromARGB(255, 94, 58, 5),
                fontSize: 15,
                fontFamily: 'Lalezar',
               ),
            ),
          ),

            Expanded(child: MessagesScreen(messages: messages)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 231, 231, 231),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.black),
                      onSubmitted: (String text) {
                        sendMessage(text);
                        _controller.clear();
                      },
                    )),
                    IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                        },
                        icon: Icon(Icons.send)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      // ignore: avoid_print
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
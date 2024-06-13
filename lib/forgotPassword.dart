import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/client.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {

    try {
      print("Test");
      await FirebaseAuth.instance
      .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context, 
        builder: (context) {
          return const AlertDialog(
            content: Text('Password reset link sent! check your email'),
          );
        },
      );
    } on FirebaseException catch (e) {
      print("e");
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        });
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(225, 223, 223, 1),
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(217, 145, 63, 8),
            fontWeight: FontWeight.bold,
            fontFamily: 'Calistoga',
          ),
        ),
        leading: BackButton(
          color: const Color.fromARGB(154, 83, 28, 1),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Client()));
          },
        ),
      ),
      body: Container(
        color: const Color.fromRGBO(225, 223, 223, 1),
        child: Center(
          child: Stack(
            children: [
              const Positioned(
                bottom: 390,
                left: 45,
                right: 45,
                child: Text(
                  'Please Enter Your Email Address To Recieve a Verification Cord.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(154, 83, 28, 1),
                    fontFamily: 'Lalezar',
                  ),
                ),
              ),
              Positioned(
                bottom: 480,
                left: 20,
                right: 0,
                child: Column(
                  children: [
                    Image.asset('assets/forgot.png', width: 150, height: 180),
                  ],
                ),
              ),
              Positioned(
                bottom: 70,
                right: 50,
                left: 50,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: (){
                      passwordReset();
                    },
                    child: Container(
                      height: 59,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(231, 211, 118, 3),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text('Send', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Lalezar',
                        ),),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 250,
                left: 20,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email Address'
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
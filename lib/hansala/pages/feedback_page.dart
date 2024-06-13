import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:handichatcraft_w1986581/hansala/model/feedback_model.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1986581/hansala/widget/constant.dart';

class FeedbackPage extends StatefulWidget {
  final FeedbackModel? feedback;
  final double? rating;
  String fname;
  FeedbackPage(
      {Key? key, this.rating, this.feedback, required this.fname})
      : super(key: key); // Corrected super constructor

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  double _rating = 0;
  final _feedback = TextEditingController();
  late FirebaseFirestore db;

  void submit() {
    db.collection("Feedbacks").doc(widget.feedback?.feedbackId).set({
      "clientName": widget.fname, // Using widget.fname
      "rating": _rating,
      "feedback": _feedback.text,
    }).then(
      (value) => print("submitted successfully"),
      onError: (e) => print("Error completing: $e"),
    );
  }

  void getUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userDoc = await FirebaseFirestore.instance
          .collection('Clients')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        final fName = userDoc.data()?['FirstName'];
        setState(() {
          widget.fname = fName ?? ''; // Updating widget.fname
        });
      }
    }
  }

  @override
  void initState() {
    db = FirebaseFirestore.instance;
    _rating = widget.rating ?? widget.feedback!.rating;
    if (widget.feedback != null) _feedback.text = widget.feedback!.feedback;
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.orange,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        callback: (p0) {},
        index: 1,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: CircleAvatar(
                  radius: 30, // Adjust the radius as needed
                  backgroundColor:
                      Colors.grey, // Set your desired background color
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.orange,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.fname, // Using widget.fname
                  style: calistogaRegular36TextDark,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          RatingBar.builder(
            minRating: 1,
            initialRating: _rating,
            allowHalfRating: true,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.orange,
            ),
            updateOnDrag: true,
            onRatingUpdate: (rating) => setState(
              () {
                _rating = rating;
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 50),
            child: Text(
              "Share more about Your Experience",
              style: TextStyle(
                  fontFamily: "Calistoga", color: textDark24, fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: SizedBox(
              height: 200,
              width: 400,
              child: TextField(
                controller: _feedback,
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                    hintText: "type something...",
                    filled: true,
                    fillColor: Color.fromARGB(255, 234, 234, 234)),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            margin: const EdgeInsets.only(right: 120, left: 120, top: 0.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.orange,
            ),
            child: InkWell(
              onTap: () {
                submit();
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 30, right: 20),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontFamily: "Lalezar",
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
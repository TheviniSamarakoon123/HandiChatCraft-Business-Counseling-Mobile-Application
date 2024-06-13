import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:handichatcraft_w1986581/hansala/model/feedback_model.dart';
import 'package:handichatcraft_w1986581/hansala/pages/feedback_page.dart';
import 'package:handichatcraft_w1986581/hansala/widget/constant.dart';
import 'package:handichatcraft_w1986581/hansala/widget/rating_card.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  String fname = "";
  final Stream<QuerySnapshot> _feedbackStream =
      FirebaseFirestore.instance.collection('Feedbacks').snapshots();
  double rating = 0;
  bool onHold = false;
  List<FeedbackModel> feedbacks = [];
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
          fname = fName ?? '';
        });
      }
    }
  }

  void getFeedbacks() {
    // while (fname.isEmpty) {
      
    // }
    FirebaseFirestore.instance
        .collection('Feedbacks')
        .where('clientName', isEqualTo: fname)
        .get()
        .then(
      (querySnapshot) {
        setState(() {
          feedbacks = querySnapshot.docs
              .map((doc) => FeedbackModel.fromFirestore(doc))
              .toList();
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  void deleteFeedback(String id) {
    FirebaseFirestore.instance.collection('Feedbacks').doc(id).delete().then(
        (value) => getFeedbacks(),
        onError: (e) => print("Error completing: $e"));
  }

  void nextPage(BuildContext context) {
    if (!onHold) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FeedbackPage(
                rating: rating,
                fname: fname,
              ),
            ));

        onHold = false;
      });
    }

    onHold = true; // Navigate to the feedback page
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserName();
    getFeedbacks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40, // Adjust the radius as needed
                  backgroundColor:
                      Colors.grey, // Set your desired background color
                  child: Text(rating.toStringAsFixed(1),
                      style: calistogaRegular36TextDark),
                ),
                RatingBar.builder(
                  minRating: 1,
                  initialRating: 0,
                  allowHalfRating: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  updateOnDrag: true,
                  onRatingUpdate: (newRating) {
                    setState(() {
                      rating = newRating;
                    });

                    nextPage(context);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.only(left: 40, right: 50),
                child: Text(
                  "Rate your experience and make a feedback",
                  style: TextStyle(
                      fontFamily: "Calistoga", color: textDark24, fontSize: 24),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
              stream: _feedbackStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("error");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView(
                  children: snapshot.data!.docs
                      .map(
                        (e) => RatingCard(
                          feedback: FeedbackModel.fromFirestore(
                              e as DocumentSnapshot<Map<String, dynamic>>),
                          callback: deleteFeedback,
                        ),
                      )
                      .toList(),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

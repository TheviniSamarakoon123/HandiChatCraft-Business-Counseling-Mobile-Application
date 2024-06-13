import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:handichatcraft_w1986581/hansala/model/feedback_model.dart';
import 'package:handichatcraft_w1986581/hansala/pages/feedback_page.dart';
import 'package:handichatcraft_w1986581/hansala/widget/constant.dart';


class RatingCard extends StatelessWidget {

  final FeedbackModel feedback;
  final Function(String) callback;
  const RatingCard({super.key, required this.feedback, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
          child: Container(
        width: 300.0, // Set the desired width
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 234, 234, 234)
        ),
        // Set the desired height
      
        child: ListTile(
          leading: const Icon(Icons.account_circle_rounded,
              size: 40.0, color: textDark),
          title: Text(
            feedback.clientName,
            style: const TextStyle(
              color: dark1, // Text color
              fontFamily: "Calistoga", // Font family
              fontSize: 16, // Font size
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit,color: textDark),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedbackPage(
                      feedback: feedback,
                      fname: feedback.clientName,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete,color: textDark),
                onPressed: () => callback(feedback.feedbackId),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              RatingBar.builder(
                initialRating: feedback.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20.0,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                onRatingUpdate: (rating) {
                  // Handle rating updates here
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Text(feedback.feedback)
            ],
          ),
      
          // Text and Rating Bar on the right
        ),
      )),
    );
  }
}

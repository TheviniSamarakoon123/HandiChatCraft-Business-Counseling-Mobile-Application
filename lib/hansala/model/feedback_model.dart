import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackModel {
  late String clientName;
  late double rating;
  late String feedback;
  late String feedbackId;

  FeedbackModel(this.clientName, this.rating, this.feedback, this.feedbackId);

  factory FeedbackModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return FeedbackModel(
        data?['clientName'], data?['rating'], data?['feedback'], snapshot.id);
  }
}

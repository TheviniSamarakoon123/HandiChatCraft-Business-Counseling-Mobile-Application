
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:handichatcraft_w1986581/hansala/model/counselor_model.dart';

class BookingModel {
  CounselorModel counselor;
  String userName;
  DateTime dateTime;

  BookingModel(this.counselor, this.userName, this.dateTime);

  factory BookingModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    final counselorData = data?['counselor'];
    final counselorModel = counselorData != null ? CounselorModel.fromFirestore(counselorData) : CounselorModel('', '', '', 0, '', '', true); // Initialize counselor with default values if data is null
    return BookingModel(
      counselorModel,
      data?['userName'] ?? '',
      (data?['dateTime'] as Timestamp).toDate(),
    );
  }
}

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handichatcraft_w1986581/hansala/model/booking_model.dart';
import 'package:handichatcraft_w1986581/hansala/model/counselor_model.dart';
import 'package:handichatcraft_w1986581/hansala/pages/booking_confirmed_page.dart';
import 'package:handichatcraft_w1986581/hansala/services/email_service.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1986581/hansala/widget/constant.dart';
import 'package:handichatcraft_w1986581/hansala/widget/time_button.dart';

class SchedulePage extends StatefulWidget {
  final CounselorModel counselor;
  const SchedulePage({super.key, required this.counselor});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String email = "";
  String mobileNumber = "";
  List<DateTime?> _dates = [];
  late BookingModel appointment =
      BookingModel(widget.counselor, "Anne Marie", DateTime.now());
  late FirebaseFirestore db;
  List<int> timeSlots = [];
  List<int> availableTimeSlots = [];

  void getUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userDoc = await FirebaseFirestore.instance
          .collection('Clients')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        final fName = userDoc.data()?['FirstName'];
        email = userDoc.data()?['email'];
        mobileNumber = userDoc.data()?['mobilenumber'];

        setState(() {
          appointment.userName = fName ?? 'Anne';
        });
      }
    }
  }

  void getTimeSlots() {
    availableTimeSlots = [10, 11, 12, 14, 15, 16];

    FirebaseFirestore.instance
        .collection('Appointments')
        .where('counselor_name', isEqualTo: appointment.counselor.name)
        .where('dateTime',
            isGreaterThanOrEqualTo:
                DateTime(_dates[0]!.year, _dates[0]!.month, _dates[0]!.day))
        .where('dateTime',
            isLessThanOrEqualTo: DateTime(
                _dates[0]!.year, _dates[0]!.month, _dates[0]!.day, 23, 59, 59))
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        timeSlots = [];
        querySnapshot.docs.forEach((doc) {
          timeSlots.add((doc["dateTime"] as Timestamp).toDate().hour);
          //print(doc["counselor_name"]);
        });

        setState(() {
          availableTimeSlots
              .removeWhere((element) => timeSlots.contains(element));
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    db = FirebaseFirestore.instance;
    // db.collection("Appointments").doc().set({
    //   "Client_name": "abc",
    //   "counselor_name": "counselor",
    //   "dateTime": DateTime.now(),
    // });
    _dates.add(DateTime.now().copyWith(
        hour: 0, minute: 0, second: 0, microsecond: 0, millisecond: 0));

    getTimeSlots();
    getUserName();

    super.initState();
  }

  void submit() {
    appointment.dateTime = appointment.dateTime.copyWith(
        day: _dates[0]!.day, month: _dates[0]!.month, year: _dates[0]!.year);
    db.collection("Appointments").doc().set({
      "Client_name": appointment.userName,
      "counselor_name": appointment.counselor.name,
      "dateTime": appointment.dateTime,
    }).then((value) {
     EmailService emailService = EmailService();
     emailService.sendEmail(appointment, widget.counselor, email,mobileNumber);
    });
    print("Appointment successfully");
  }

  void setAppointment(int hour) {
    appointment.dateTime = appointment.dateTime.copyWith(
        hour: hour, minute: 0, second: 0, microsecond: 0, millisecond: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor50,
      appBar: AppBar(
        backgroundColor: primaryColor50,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: white,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        callback: (p0) {},
        index: 4,
      ),
      body: Column(
        children: [
          CircleAvatar(
            backgroundImage:
                AssetImage(widget.counselor.isMale ? maleUser : femaleUser),
            radius: 60,
          ),
          Text(widget.counselor.name,
              textAlign: TextAlign.center,
              style: calistogaRegular20PrimaryDark),
          Text(widget.counselor.specialize,
              textAlign: TextAlign.center, style: calistogaRegular10TextDark),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Select date and time",
                  style: calistogaRegular16TextDark),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 255, 237, 214),
                      ),
                      child: CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                            firstDate:
                                DateTime.now().add(const Duration(days: 1))),
                        value: _dates,
                        onValueChanged: (dates) {
                          _dates = dates;
                          getTimeSlots();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TimeButton(
                    callBack: setAppointment,
                    hours: availableTimeSlots,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primaryColor),
                    child: InkWell(
                      onTap: () {
                        submit();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingConfirmedpage(
                                appointmentDetails: appointment,
                              ),
                            ));
                      },
                      child: const Text(
                        'Book now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
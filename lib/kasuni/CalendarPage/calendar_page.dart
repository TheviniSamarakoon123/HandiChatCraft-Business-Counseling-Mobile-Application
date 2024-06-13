import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart' as TableCalendar;

class BookingModel {
  late String userName;
  late DateTime dateTime;
  late CounselorModel counselor;
  late ClientModel client;

  BookingModel({
    required this.userName,
    required this.dateTime,
    required this.counselor,
    required this.client,
  });

  BookingModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    userName = data['userName'] ?? '';
    dateTime = (data['dateTime'] as Timestamp).toDate();
    counselor = CounselorModel.fromMap(data['counselor'] ?? {});
    client = ClientModel.fromMap(data['client'] ?? {});
  }
}

class CounselorModel {
  late String firstName;

  CounselorModel({
    required this.firstName,
  });

  CounselorModel.fromMap(Map<String, dynamic> map) {
    firstName = map['name'] ?? '';
  }
}

class ClientModel {
  late String firstName;

  ClientModel({
    required this.firstName,
  });

  ClientModel.fromMap(Map<String, dynamic> map) {
    firstName = map['firstName'] ?? '';
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late String clientFirstName = ''; // Initialize with an empty string
  late String counselorFirstName = ''; // Initialize with an empty string

  late TableCalendar.CalendarFormat _calendarFormat;
  late List<DateTime> _selectedDates = [];
  late List<BookingModel> _appointments = [];
  late FirebaseFirestore _db;
  late DateTime _selectedDate; // Define _selectedDate variable here

  @override
  void initState() {
    super.initState();
    _calendarFormat = TableCalendar.CalendarFormat.week;
    _appointments = [];
    _db = FirebaseFirestore.instance;
    _selectedDate = DateTime.now(); // Initialize with current date
    getClientFirstName(); // Fetch client's first name
    getCounselorFirstName(); // Fetch counselor's first name
    _loadAppointments();
  }

  void getClientFirstName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userDoc = await FirebaseFirestore.instance
          .collection('Clients')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        final firstName = userDoc.data()?['FirstName'];
        setState(() {
          clientFirstName = firstName ?? '';
        });
      }
    }
  }

  void getCounselorFirstName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userDoc = await FirebaseFirestore.instance
          .collection('Appointments')
          .doc(user.uid) // Assuming user UID corresponds to counselor ID
          .get();
      if (userDoc.exists) {
        final firstName = userDoc.data()?['counselor_name'];
        setState(() {
          counselorFirstName = firstName ?? '';
        });
      }
    }
  }

  void _loadAppointments() {
    _db.collection('Appointments').get().then((querySnapshot) {
      setState(() {
        _appointments = querySnapshot.docs
            .map((doc) => BookingModel.fromSnapshot(doc))
            .toList();
      });
    });
  }

  List<dynamic> _getEvents(DateTime date) {
    // Filter appointments for the selected date
    List<BookingModel> eventsForDate = _appointments
        .where((appointment) =>
            appointment.dateTime.year == date.year &&
            appointment.dateTime.month == date.month &&
            appointment.dateTime.day == date.day &&
            appointment.dateTime.isAfter(DateTime.now()))
        .toList();

    // Return a single event marker if there are multiple appointments, otherwise return the list of events
    return eventsForDate.isNotEmpty ? [eventsForDate.first] : [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar',
          style: TextStyle(
            fontFamily: 'Calistoga',
            color: Colors.orange[600],
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        /*leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        leadingWidth: 100,*/
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.orange[200],
                height: 400,
                child: TableCalendar.TableCalendar(
                  calendarFormat: TableCalendar.CalendarFormat.month,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  eventLoader: _getEvents,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  selectedDayPredicate: (date) => _selectedDates.contains(date),
                  onDaySelected: (selectedDate, focusedDate) {
                    setState(() {
                      _selectedDate = selectedDate;
                      _selectedDates = [selectedDate];
                      _loadAppointments();
                    });
                  },
                  calendarStyle: TableCalendar.CalendarStyle(
                    selectedDecoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.brown,
                    ),
                    todayDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.brown[300],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildUpcomingEventsList(_selectedDate),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingEventsList(DateTime selectedDate) {
    // Filter appointments for upcoming events on the selected date
    List<BookingModel> eventsForSelectedDate = _appointments
        .where((appointment) =>
            appointment.dateTime.year == selectedDate.year &&
            appointment.dateTime.month == selectedDate.month &&
            appointment.dateTime.day == selectedDate.day &&
            appointment.dateTime.isAfter(DateTime.now()))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Text(
              'Upcoming Events',
              style: TextStyle(
                color: Colors.orange[600],
              
                fontSize: 20,
                fontFamily: 'Lalezar',
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: eventsForSelectedDate.length,
          itemBuilder: (context, index) {
            BookingModel event = eventsForSelectedDate[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Counselor: $counselorFirstName',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  // SizedBox(height: 5),
                  // Text(
                  //   'User: $clientFirstName',
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //   ),
                  // ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 5),
                      Text(
                        DateFormat.yMMMd().format(event.dateTime),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(width: 5),
                      Text(
                        DateFormat.jm().format(event.dateTime),
                        style: const TextStyle(
                        fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
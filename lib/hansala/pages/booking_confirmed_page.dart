import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/model/booking_model.dart';
import 'package:handichatcraft_w1986581/hansala/widget/booking_card.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1986581/hansala/widget/constant.dart';


class BookingConfirmedpage extends StatelessWidget {
  final BookingModel appointmentDetails;
  const BookingConfirmedpage({super.key, required this.appointmentDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: primaryColor50,
      body: Expanded(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            background(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                BookingCard(bookingModel: appointmentDetails),
                const SizedBox(
                  height: 80,
                ),
                Botton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget background(BuildContext context) => Column(
      children: [
        const Icon(
          Icons.check_circle, // Change to your preferred icon
          color: Colors.white,
          size: 60.0,
        ),
        const SizedBox(height: 8.0),
        const Text('Booking Confirmed', style: calistogaRegular24white),
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
          ),
        ),
      ],
    );

Widget Botton(BuildContext context) => Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: primaryColor),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .popUntil((route)=>route.isFirst);
        },
        child: const Text(
          'Done',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

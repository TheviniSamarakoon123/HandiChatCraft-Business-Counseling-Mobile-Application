import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/model/booking_model.dart';
import 'package:handichatcraft_w1986581/hansala/model/counselor_model.dart';
import 'package:handichatcraft_w1986581/hansala/widget/constant.dart';

import 'package:intl/intl.dart';

class BookingCard extends StatelessWidget {
  final BookingModel bookingModel;
  const BookingCard({super.key, required this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              userDetails(bookingModel.counselor, context),
              //SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              const Divider(),
              Expanded(child: bookingDetails(bookingModel)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget userDetails(CounselorModel counselor, BuildContext context) {
  return Row(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Image.asset(userIcon),
      ),
      const SizedBox(width: 10),
      Column(
        children: [
          Text(
            counselor.name,
            style: calistogaRegular20PrimaryDark,
            overflow: TextOverflow.fade,
          ),
          Text(
            counselor.specialize,
            style: calistogaRegular16TextDark,
            overflow: TextOverflow.fade,
          )
        ],
      )
    ],
  );
}

Widget bookingDetails(BookingModel bookingModel) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...styledText("Client Name"),
            ...styledText("Date"),
            ...styledText("Time"),
          ],
        ),
        const SizedBox(width: 15),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...styledText(bookingModel.userName),
            ...styledText(
                DateFormat('yyyy-MM-dd').format(bookingModel.dateTime)),
            ...styledText(DateFormat('h:mm a').format(bookingModel.dateTime))
          ],
        )
      ],
    ),
  );
}

List<Widget> styledText(String text) => [
      Text(
        text,
        style: calistogaRegular16TextDark,
      ),
      const SizedBox(height: 10),
    ];

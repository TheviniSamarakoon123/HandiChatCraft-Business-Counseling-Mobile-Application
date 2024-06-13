import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/widget/constant.dart';

import 'package:intl/intl.dart';

class TimeButton extends StatefulWidget {
  final List<int> hours;
  final Function(int) callBack;
  const TimeButton({super.key, required this.hours, required this.callBack});

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  int selectedtime = -1;
  List<DateTime> timeSlots = [];

  @override
  void didUpdateWidget(TimeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    timeSlots = widget.hours.map((hour) => DateTime(2000, 1, 1, hour)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //padding: const EdgeInsets.all(10),
      
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 2.5),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedtime = index;
              });
              widget.callBack(timeSlots[index].hour);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedtime == index
                  ? Color.fromARGB(255, 148, 82, 1)
                  : const Color.fromARGB(255, 255, 237, 214),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Adjust radius
              ),
            ),
            child: Text(
              "${DateFormat('HH a').format(timeSlots[index]).toString()} - ${DateFormat('HH a').format(timeSlots[index].add(Duration(hours: 1))).toString()}",
              style: TextStyle(fontSize: 12,color: selectedtime == index? white:Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

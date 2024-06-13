import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/widget/constant.dart';

import 'package:intl/intl.dart';

class TimeSelector extends StatefulWidget {
  final DateTime startTime;
  final Function(DateTime) callback;
  const TimeSelector(
      {super.key, required this.startTime, required this.callback});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  int selected = -1;
  int row = -1;
  void _update(DateTime dateTime, int rw, int sl) {
    widget.callback(dateTime);
    setState(() {
      row = rw;
      selected = sl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonRow(
          startTime: widget.startTime,
          callback: _update,
          row: 0,
          selected: selected,
          active: row,
        ),
        ButtonRow(
          startTime: widget.startTime.add(const Duration(hours: 4)),
          callback: _update,
          row: 1,
          selected: selected,
          active: row,
        )
      ],
    );
  }
}

class ButtonRow extends StatelessWidget {
  final int selected;
  final int row;
  final int active;
  final DateTime startTime;
  final Function(DateTime, int, int) callback;
  const ButtonRow(
      {super.key,
      required this.startTime,
      required this.callback,
      required this.row,
      required this.selected,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(3, (int index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              onPressed: () {
                callback(
                  startTime.add(
                    Duration(hours: index),
                  ),
                  row,
                  index,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selected == index && row == active
                    ? primaryColor
                    : const Color.fromARGB(255, 231, 201, 162),
              ),
              child: Text(
                  "${DateFormat('HH a').format(startTime.add(Duration(hours: index))).toString()} - ${DateFormat('HH a').format(startTime.add(Duration(hours: 1 * (index + 1)))).toString()}"),
            ),
          ),
        );
      }),
    );
  }
}

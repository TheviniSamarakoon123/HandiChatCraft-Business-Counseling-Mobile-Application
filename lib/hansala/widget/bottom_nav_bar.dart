import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int? index;
  final Function(int) callback;
  const BottomNavBar({super.key, required this.callback, this.index});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    _currentIndex = widget.index ?? 0;
    // TODO: implement initState
    super.initState();
  }

  late int _currentIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 62,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 237, 236, 236),
      ),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.width * .024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
            widget.callback(_currentIndex);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: const EdgeInsets.only(
                  right: 12,
                  left: 12,
                ),
                width: size.width * .128,
                height: index == _currentIndex ? size.width * .014 : 0,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                ),
              ),
              Icon(
                listOfIcons[index],
                size: size.width * .080,
                color: Colors.orange,
              ),
              SizedBox(height: size.width * .03),
            ],
          ),
        ),
      ),
    );
  }
}

List<IconData> listOfIcons = [
  Icons.home,
  Icons.rate_review,
  Icons.adb,
  Icons.calendar_month,
  Icons.person,
];

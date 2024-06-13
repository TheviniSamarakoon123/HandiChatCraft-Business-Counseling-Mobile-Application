import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/pages/rating_page.dart';
import 'package:handichatcraft_w1986581/homeBody.dart';
import 'package:handichatcraft_w1986581/kasuni/CalendarPage/calendar_page.dart';
import 'package:handichatcraft_w1986581/navo/profile_page.dart';
import 'package:handichatcraft_w1986581/thevini/pages/chatbotpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex  = 0;

  List pages = [
    const HomeBody(),
    const RatingPage(),
    const Chatbotpage(),
    CalendarPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 237, 236, 236),
        ),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width*.024),
          itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
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
                width: size.width*.128,
                height: index == _currentIndex ? size.width*.014:0,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                ),
              ),
              Icon(
                listOfIcons[index],
                size: size.width*.080,
                color:Colors.orange,
              ),
              SizedBox(height: size.width*.03),
           ],
          ),
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
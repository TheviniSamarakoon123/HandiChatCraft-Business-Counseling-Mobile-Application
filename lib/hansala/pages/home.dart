import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/pages/counselor_page.dart';
import 'package:handichatcraft_w1986581/hansala/pages/rating_page.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';


class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late int _selectedPage;

  @override
  void initState() {
    _selectedPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('The app')),
      bottomNavigationBar: BottomNavBar(
        callback: (int a) {
          setState(() {
            _selectedPage = a;
          });
        },
      ),
      body: [
        const Placeholder(),
        const RatingPage(),
        const Placeholder(),
        const Placeholder(),
        const CounselorPage(),
      ][_selectedPage],
    );
  }
}

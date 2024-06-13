import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/model/counselor_model.dart';
import 'package:handichatcraft_w1986581/hansala/pages/schedule_page.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1986581/hansala/widget/constant.dart';


class CounselorProfile extends StatelessWidget {
  final CounselorModel counselorModel;
  const CounselorProfile(
      {super.key,
      required this.counselorModel,
      required CounselorModel counselor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor50,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        callback: (p0) {},
        index: 4,
      ),
      backgroundColor: primaryColor50,
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage:
                  AssetImage(counselorModel.isMale ? maleUser : femaleUser),
              radius: 60,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 80,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(counselorModel.name,
                            style: const TextStyle(
                                color: primaryDark,
                                fontSize: 20,
                                fontFamily: "Calistoga")),
                        Text(
                          counselorModel.specialize,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: textDark,
                              fontSize: 15,
                              fontFamily: "Calistoga"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 25, left: 25),
                    child: const Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "About",
                            style: TextStyle(
                                fontFamily: "Calistoga",
                                fontSize: 20,
                                color: textDark36),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 150,
                    width: 350,
                    child: ListView(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(counselorModel.about),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(14.0),
                    width: double.infinity,
                    margin:
                        const EdgeInsets.only(right: 120, left: 120, top: 0.1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: primaryColor,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SchedulePage(
                                counselor: counselorModel,
                              ),
                            ));
                      },
                      child: const Text(
                        "Appointment",
                        style: TextStyle(
                          fontFamily: "Lalezar",
                          fontSize: 20,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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

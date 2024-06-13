import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/articles_details.dart';
import 'package:handichatcraft_w1986581/images_details.dart';
import 'package:handichatcraft_w1986581/main.dart';
import 'package:handichatcraft_w1986581/workshop_detail.dart';
import 'package:lottie/lottie.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 206, 152),
        title: const Text('Hello',
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Color.fromARGB(154, 196, 70, 7), 
          fontFamily: 'Calistoga', 
          fontWeight: FontWeight.bold, 
          fontSize: 24,
        ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              color:  const Color(0x9AC44607),
              icon: const Icon(Icons.notifications_active),
              onPressed:() {
                Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  Application()));
              },
            ),
          ),
        ],     
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Center(
                  child: LottieBuilder.asset(
                    'assets/Animation - 1710863465634.json',
                    height: 250,
                    reverse: true,
                    repeat: true,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 0, bottom: 30.0, right: 190.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 26,
                    fontFamily: 'Lalezar',
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Workshops()));
                },
                child: Ink(
                  height: height * .15,
                  width: width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(1.5, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image:AssetImage('assets/dashboard.png'),
                      fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xFFF25831).withOpacity(0.7),
                        const Color.fromRGBO(255, 168, 61, 1).withOpacity(0.7),
                      ]),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width*.03, vertical: height*.02),
                          child: SizedBox(
                            width: width*.4,
                            child: const ListTile(
                              title: Text(
                                'Workshops',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Lalezar',
                                ),
                              ),
                              subtitle: Text(
                                "Upcoming workshops details",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: width*.03),
                          child: SizedBox(
                            height: height*.10,
                            width: width*.3,
                            child: Image.asset(
                              "assets/work.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: width*.06),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Articles()));
                  },
                  child: Ink(
                    height: height * .15,
                    width: width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(1.5, 3),
                        ),
                      ],
                      image: const DecorationImage(
                        image:AssetImage('assets/dashboard.png'),
                        fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                           const Color.fromARGB(255, 150, 92, 0).withOpacity(0.7),
                           const Color.fromARGB(255, 224, 165, 45).withOpacity(0.7),
                        ]),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width*.03, vertical: height*.02),
                            child: SizedBox(
                              width: width*.4,
                              child: const ListTile(
                                title: Text(
                                  'Articles',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'Lalezar',
                                  ),
                                ),
                                subtitle: Text(
                                  "Articles related to handicraft",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: width*.03),
                            child: SizedBox(
                              height: height*.10,
                              width: width*.3,
                              child: Image.asset(
                                "assets/articles.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: width*.06),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Images()));
                  },
                  child: Ink(
                    height: height * .15,
                  width: width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(1.5, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image:AssetImage('assets/dashboard.png'),
                      fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color.fromARGB(234, 235, 160, 0).withOpacity(0.7),
                        const Color.fromARGB(255, 255, 137, 1).withOpacity(0.7),
                      ]),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width*.03, vertical: height*.02),
                          child: SizedBox(
                            width: width*.4,
                            child: const ListTile(
                              title: Text(
                                'Images',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Lalezar',
                                ),
                              ),
                              subtitle: Text(
                                "Colorful images collection",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: width*.03),
                          child: SizedBox(
                            height: height*.15,
                            width: width*.3,
                            child: Image.asset(
                              "assets/lamp.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
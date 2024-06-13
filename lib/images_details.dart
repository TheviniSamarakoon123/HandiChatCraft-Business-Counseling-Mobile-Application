import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1986581/home.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class Images extends StatefulWidget {
  const Images({super.key});

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> with TickerProviderStateMixin {

  final List<String> batik = [
    'assets/B1.png',
    'assets/B2.png',
    'assets/B3.png',
    'assets/B4.png',
    'assets/B5.png',
    'assets/B6.png',
    'assets/B7.png',
    'assets/B8.png',
    'assets/B9.png',
    'assets/B10.png',
    'assets/B11.png',
    'assets/B12.png',
    'assets/B13.png',
  ];

  final List<String> handloom = [
    'assets/H1.png',
    'assets/H2.png',
    'assets/H3.png',
    'assets/H4.png',
    'assets/H5.png',
    'assets/H6.png',
    'assets/H7.png',
    'assets/H8.png',
    'assets/H9.png',
    'assets/H10.png',
    'assets/H11.png',
    'assets/H12.png',
    'assets/H13.png',
    'assets/H14.png',
    'assets/H15.png',
    'assets/H16.png',
    'assets/H17.png',
    'assets/H18.png',
    'assets/H19.jpg',
    'assets/H20.jpg',
  ];

  final List<String> resin = [
    'assets/R1.png',
    'assets/R2.png',
    'assets/R3.png',
    'assets/R4.png',
    'assets/R5.png',
    'assets/R6.png',
    'assets/R7.png',
    'assets/R8.png',
    'assets/R9.png',
    'assets/R10.png',
    'assets/R11.png',
    'assets/R12.png',
    'assets/R13.png',
    'assets/R14.png',
    'assets/R15.png',
    'assets/R16.png',
    'assets/R17.png',
    'assets/R18.jpg',
    'assets/R19.jpg',
    'assets/R20.jpg',
  ];

  final List<String> masks = [
    'assets/M1.jpg',
    'assets/M2.jpg',
    'assets/M3.jpg',
    'assets/M4.jpg',
    'assets/M5.jpg',
    'assets/M6.jpg',
    'assets/M7.jpg',
    'assets/M8.jpg',
    'assets/M9.jpg',
    'assets/M10.jpg',
    'assets/M11.jpg',
    'assets/M12.jpg',
    'assets/M13.jpg',
    'assets/M14.jpg',
    'assets/M15.jpg',
    'assets/M16.jpg',
    'assets/M17.jpg',
    'assets/M18.jpg',
    'assets/M19.jpg',
    'assets/M20.jpg',
    'assets/M21.jpg',
    'assets/M22.jpg',
    'assets/M23.jpg',
    'assets/M24.jpg',
  ];

  final List<String> jewelry = [
    'assets/J1.jpg',
    'assets/J2.jpg',
    'assets/J3.jpg',
    'assets/J4.jpg',
    'assets/J5.jpg',
    'assets/J6.jpg',
    'assets/J7.jpg',
    'assets/J8.jpg',
    'assets/J9.jpg',
    'assets/J10.jpg',
    'assets/J11.jpg',
    'assets/J12.jpg',
    'assets/J13.jpg',
    'assets/J14.jpg',
    'assets/J15.jpg',
    'assets/J16.jpg',
    'assets/J17.jpg',
    'assets/J18.jpg',
    'assets/J19.jpg',
    'assets/J20.jpg',
    'assets/J21.jpg',
    'assets/J22.jpg',
    'assets/J23.jpg',
    'assets/J24.jpg',
    'assets/J25.jpg',
    'assets/J26.jpg',
    'assets/J27.jpg',
  ];

  final List<String> basket = [
    'assets/S1.jpg',
    'assets/S2.jpg',
    'assets/S3.jpg',
    'assets/S4.jpg',
    'assets/S5.jpg',
    'assets/S6.jpg',
    'assets/S7.jpg',
    'assets/S8.jpg',
    'assets/S9.jpg',
    'assets/S10.jpg',
    'assets/S11.jpg',
    'assets/S12.jpg',
    'assets/S13.jpg',
    'assets/S14.jpg',
    'assets/S15.jpg',
    'assets/S16.jpg',
    'assets/S17.jpg',
    'assets/S24.jpg',
    'assets/S18.jpg',
    'assets/S19.jpg',
    'assets/S20.jpg',
    'assets/S21.jpg',
    'assets/S22.jpg',
    'assets/S23.jpg',
  ]; 

  final List<String> pottery = [
    'assets/P1.jpg',
    'assets/P2.jpg',
    'assets/P3.jpg',
    'assets/P4.jpg',
    'assets/P5.jpg',
    'assets/P6.jpg',
    'assets/P7.jpg',
    'assets/P8.jpg',
    'assets/P9.jpg',
    'assets/P10.jpg',
    'assets/P11.jpg',
    'assets/P12.jpg',
    'assets/P13.jpg',
    'assets/P14.jpg',
    'assets/P15.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 7, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: const Text('You can find different types of designs here',
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Color.fromARGB(154, 196, 70, 7), 
          fontFamily: 'Calistoga', 
          fontWeight: FontWeight.bold, 
          fontSize: 15,
        ),
        ),
        leading: BackButton(
          color: const Color.fromARGB(154, 83, 28, 1),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Home()));
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        callback: (p0) {},
        index: 0,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: tabController,
                labelStyle: const TextStyle(
                  fontFamily: 'Calistoga',
                ),
                labelPadding: const EdgeInsets.only(right: 16.0),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.only(bottom: 6),
                indicatorColor: Colors.white,
                tabs: const [
                  Tab(text: "Batik"),
                  Tab(text: "Handloom"),
                  Tab(text: "Resin"),
                  Tab(text: "Masks"),
                  Tab(text: "Jewelry"),
                  Tab(text: "Basket"),
                  Tab(text: "Pottery"),
                ]
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
              height: 660,
              width: double.maxFinite,
              child: TabBarView(
                controller: tabController,
                children: [
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                          itemCount: batik.length, 
                    itemBuilder: (context, index) {
                      return InstaImageViewer(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(batik[index]),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    }
                  ),
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                          itemCount: handloom.length, 
                    itemBuilder: (context, index) {
                      return InstaImageViewer(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(handloom[index]),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    }
                  ),
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                          itemCount: resin.length, 
                    itemBuilder: (context, index) {
                      return InstaImageViewer(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(resin[index]),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    }
                  ),
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                          itemCount: masks.length, 
                    itemBuilder: (context, index) {
                      return InstaImageViewer(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(masks[index]),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    }
                  ),
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                          itemCount: jewelry.length, 
                    itemBuilder: (context, index) {
                      return InstaImageViewer(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(jewelry[index]),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    }
                  ),
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                          itemCount: basket.length, 
                    itemBuilder: (context, index) {
                      return InstaImageViewer(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(basket[index]),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    }
                  ),
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
                          itemCount: pottery.length, 
                    itemBuilder: (context, index) {
                      return InstaImageViewer(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(pottery[index]),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    }
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
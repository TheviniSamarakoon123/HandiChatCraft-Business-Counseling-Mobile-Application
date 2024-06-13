import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1986581/home.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _WorkshopsState();
}

class _WorkshopsState extends State<Articles> with TickerProviderStateMixin {

  // final FirebaseFirestore = _firebaseFirestore = FirebaseFirestore.instance;

  final List<String> images = [
    'assets/articles/Batik1.jpg',
    'assets/articles/Batik2.jpg',
    'assets/articles/Batik3.jpg',
    'assets/articles/Batik4.jpg',
    'assets/articles/Batik5.jpg',
    'assets/articles/Batik6.jpg',
  ];

  final List<String> handloom = [
    'assets/articles/Hand1.jpg',
    'assets/articles/Hand2.jpg',
    'assets/articles/Hand3.jpg',
    'assets/articles/Hand4.jpg',
    'assets/articles/Hand5.jpg',
    'assets/articles/Hand6.jpg',
    'assets/articles/Hand7.jpg',
  ];

  final List<String> resin = [
    'assets/articles/Resin1.jpg',
    'assets/articles/Resin2.jpg',
    'assets/articles/Resin3.jpg',
    'assets/articles/Resin4.jpg',
    'assets/articles/Resin5.jpg',
    'assets/articles/Resin6.jpg',
  ];

  final List<String> masks = [
    'assets/articles/Masks1.jpg',
    'assets/articles/Masks2.jpg',
    'assets/articles/Masks3.jpg',
    'assets/articles/Masks4.jpg',
    'assets/articles/Masks5.jpg',
  ];

  final List<String> jewelry = [
    'assets/articles/Jewe1.jpg',
    'assets/articles/Jewe2.jpg',
    'assets/articles/Jewe3.jpg',
    'assets/articles/Jewe4.jpg',
    'assets/articles/Jewe5.jpg',
    'assets/articles/Jewe6.jpg',
    'assets/articles/Jewe7.jpg',
  ];

  final List<String> basket = [
    'assets/articles/Hand5.jpg',
    'assets/articles/Hand6.jpg',
    'assets/articles/Hand7.jpg',
  ];

  final List<String> pottery = [
    'assets/articles/Hand5.jpg',
    'assets/articles/Hand6.jpg',
    'assets/articles/Hand7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 7, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: const Text('You can find Articles here',
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
    //   bottomNavigationBar: BottomNavBar(
    //   callback: (index) {
    //     // Navigate to different pages based on index
    //     switch (index) {
    //       case 0:
    //         // Navigate to the first page
    //         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RatingPage()));
    //         break;
    //       case 1:
    //         // Navigate to the second page
    //         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RatingPage()));
    //         break;
    //       // Add cases for other indexes as needed
    //       default:
    //         break;
    //     }
    //   },
    //   index: 0,
    // ),
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
                          itemCount: images.length, 
                    itemBuilder: (context, index) {
                      return InstaImageViewer(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.fill,
                            ),             
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
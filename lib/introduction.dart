import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/client.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  final LinearGradient _gradient = const LinearGradient(
    colors: <Color> [
      Color.fromARGB(255, 255, 171, 46),
      Color.fromARGB(217, 145, 63, 8),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/masks.png"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(231, 161, 161, 161),
              Color.fromARGB(255, 233, 185, 124),
            ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
          )
        ),
        child: Center(
          child: Stack(
            children: [
               Positioned(
                top: 90,
                left: 50,
                right: 20,
                child: ShaderMask(
                  shaderCallback: (Rect rect) {
                    return _gradient.createShader(rect);
                  },
                  child: Text(
                    'Supporting handicraft industries in Sri Lanka',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 28,
                      color: const Color.fromARGB(217, 177, 105, 54),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Calistoga',
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 380,
                left: 50,
                right: 50,
                child: Text(
                  'This application provides services only for Sri Lankan Handicrafts Industry such as Batik, Handloom, Resin, Masks, Jewelry, Baskets and Pottery.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(163, 72, 40, 0),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Almendra',
                  ),
                ),
              ),
              Positioned(
                bottom: 130,
                right: 10,
                left: 120,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40.0, left: 55.0, right: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Client()));
                    },
                    child: Container(
                      height: 59,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(231, 211, 118, 3),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text(
                          'Next', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Lalezar',
                          ),
                        ),
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
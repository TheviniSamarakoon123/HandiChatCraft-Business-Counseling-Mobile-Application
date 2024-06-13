
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/introduction.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final LinearGradient _gradient = const LinearGradient(
    colors: <Color> [
      Color.fromARGB(255, 255, 171, 46),
      Color.fromARGB(217, 145, 63, 8),
    ],
  );
  
  ValueNotifier<ImageInfo?> imageInfoNotifier = ValueNotifier<ImageInfo?>(null);

  getImage() {
    AssetImage assetImage = const AssetImage(
      'assets/handi.png');
      ImageStream imageStream = assetImage.resolve(ImageConfiguration.empty);
      ImageStreamListener imageStreamListener =
      ImageStreamListener((image, synchronousCall) {
        imageInfoNotifier.value = image;
      });
      imageStream.addListener(imageStreamListener);
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
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
                top: 75,
                left: 85,
                right: 30,
                child: ShaderMask(
                  shaderCallback: (Rect rect) {
                    return _gradient.createShader(rect);
                  },
                  child: Text(
                    'Welcome !',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 48,
                      color: const Color.fromARGB(217, 176, 75, 7),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Calistoga',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 240,
                left: 50,
                right: 0,
                child: ValueListenableBuilder(valueListenable: imageInfoNotifier, builder: (context,value,child){
                  ImageInfo? imageInfo = value;
                  if(imageInfo != null) {
                    ui.Image image = imageInfo.image;
                    Matrix4 matrix4 = Matrix4.identity()..scale(MediaQuery.sizeOf(context).width/image.width);
                    Float64List float64list = matrix4.storage;
                    TileMode titleModeX = TileMode.repeated;
                    TileMode titleModeY = TileMode.repeated;
                      return Text(
                      'HandiChatCraft',
                      style: TextStyle(
                        fontSize: 55,
                
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Aladin',
                        foreground: Paint()..shader = ImageShader(image, titleModeX, titleModeY, float64list)
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
              ),
              Positioned(
                bottom: 390,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset('assets/logo.png', width: 250, height: 230),
                  ],
                ),
              ),
              Positioned(
                bottom: 70,
                right: 50,
                left: 50,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Introduction()));
                    },
                    child: Container(
                      height: 59,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(231, 211, 118, 3),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Text(
                          'Get Started',
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
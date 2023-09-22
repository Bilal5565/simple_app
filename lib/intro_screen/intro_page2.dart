// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/const.dart';

// ignore: camel_case_types
class IntroPage2 extends StatelessWidget {
  IntroPage2({super.key});
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ConstantObject.primaryColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.01),
            Image.asset(
              'images/logo.png',
              height: height * 0.30,
            ),
            SizedBox(height: height * 0.02),
            Lottie.asset(
              'animations/page2.json',
              height: height * 0.30,
            ),
            SizedBox(height: height * 0.02),
            Lottie.asset(
              'animations/book2.json',
              height: height * 0.25,
            ),
          ],
        ),
      ),
    );
  }
}

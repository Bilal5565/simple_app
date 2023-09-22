// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/const.dart';

// ignore: camel_case_types
class IntroPage1 extends StatelessWidget {
  IntroPage1({super.key});
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
            SizedBox(height: height * 0.02),
            Image.asset(
              'images/logo.png',
              height: height * 0.30,
            ),
            SizedBox(height: height * 0.04),
            Text(
              'Welcome to Tony Trooper',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Lottie.asset(
              'animations/page1.json',
              height: height * 0.30,
            ),
          ],
        ),
      ),
    );
  }
}

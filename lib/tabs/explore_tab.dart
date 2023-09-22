// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tony_shop/Disco/Diso_page.dart';
import 'package:tony_shop/Park/park_page.dart';
import 'package:tony_shop/booking/booking_page.dart';
import 'package:tony_shop/constant/const.dart';
import 'package:tony_shop/food/food_page.dart';

import '../widget/reusable_container.dart';

class ExploreTab extends StatelessWidget {
  ExploreTab({super.key});
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantObject.primaryColor,
        title: Text(
          'Explore',
        ),
      ),
      body: Container(
        //margin: EdgeInsets.only(bottom: height * 0.05),
        height: height,
        width: width,
        child: ListView(
          padding: EdgeInsets.only(
            bottom: height * 0.05,
            top: height * 0.01,
            left: width * 0.03,
            right: width * 0.03,
          ),
          children: [
            ReusableContainer(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BookingPage(),
                  ),
                );
              },
              imgHeight: height * 0.13,
              imageUrl: 'images/kpk.png',
              height1: height * 0.22,
              width1: width,
              color: Colors.redAccent,
              title: 'Soft play',
              subTitle: 'Center',
            ),
            ReusableContainer(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ParkPage()));
              },
              imageUrl: 'images/ride3.png',
              imgHeight: height * 0.22,
              height1: height * 0.22,
              width1: width,
              color: Colors.blue,
              title: 'Trampoline',
              subTitle: 'Park',
            ),
            ReusableContainer(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DiscoDomePage(),
                  ),
                );
              },
              imageUrl: 'images/gift2.png',
              height1: height * 0.22,
              imgHeight: height * 0.20,
              width1: width,
              color: Colors.pinkAccent,
              title: 'Disco',
              subTitle: 'Dome',
            ),
            ReusableContainer(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FoodPage(),
                  ),
                );
              },
              imageUrl: 'images/food1.png',
              height1: height * 0.22,
              imgHeight: height * 0.17,
              width1: width,
              color: Colors.orange,
              title: 'Delicious',
              subTitle: 'Food',
            ),
          ],
        ),
      ),
    );
  }
}

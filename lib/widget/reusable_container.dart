// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer({
    super.key,
    required this.imageUrl,
    required this.height1,
    required this.width1,
    required this.color,
    required this.title,
    required this.subTitle,
    required this.imgHeight,
    this.onTap,
  });
  final String imageUrl;

  final double height1;
  final double width1;
  final void Function()? onTap;
  final color;
  final String title;
  final String subTitle;
  final double imgHeight;
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: height * 0.01,
          top: height * 0.01,
        ),
        height: height1,
        width: width1,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height * 0.03),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.06,
                horizontal: width * 0.06,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0018,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(imageUrl, height: imgHeight)
          ],
        ),
      ),
    );
  }
}

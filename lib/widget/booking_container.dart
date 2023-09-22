// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BookingContainer extends StatelessWidget {
  BookingContainer({
    super.key,
    this.color,
    this.title,
    this.subtitle,
    this.child,
    this.imgUrl,
    this.imgHeight,
    this.onTap,
    this.rightMargin,
    this.leftMargin,
  });
  final color;
  final title;
  final subtitle;
  final child;
  final imgUrl;
  final imgHeight;
  final rightMargin;
  final leftMargin;
  final void Function()? onTap;
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          top: height * 0.02,
          left: leftMargin,
          right: rightMargin,
        ),
        height: height * 0.22,
        width: width * 0.55,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            height * 0.03,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.06, horizontal: width * 0.03),
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
                    subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(imgUrl, height: imgHeight)
          ],
        ),
      ),
    );
  }
}

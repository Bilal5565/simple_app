import 'package:flutter/material.dart';
import 'package:tony_shop/widget/booking_container.dart';

import '../constant/const.dart';

class DiscoDomePage extends StatefulWidget {
  const DiscoDomePage({super.key});

  @override
  State<DiscoDomePage> createState() => _BookingPageState();
}

class _BookingPageState extends State<DiscoDomePage> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantObject.primaryColor,
        title: Text('Disco Dome'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, left: width * 0.02),
                child: Text(
                  'Booking Hall',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BookingContainer(
                        color: Colors.red,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        title: 'Main',
                        rightMargin: 0.0,
                        leftMargin: width * 0.05,
                        subtitle: 'Hall',
                      ),
                      BookingContainer(
                        color: Colors.red,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        title: 'Main',
                        rightMargin: 0.0,
                        leftMargin: width * 0.02,
                        subtitle: 'Hall',
                      ),
                      BookingContainer(
                        color: Colors.red,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        title: 'Main',
                        rightMargin: 0.0,
                        leftMargin: width * 0.02,
                        subtitle: 'Hall',
                      ),
                      BookingContainer(
                        color: Colors.red,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        title: 'Main',
                        leftMargin: width * 0.02,
                        subtitle: 'Hall',
                        rightMargin: 0.0,
                      ),
                      BookingContainer(
                        color: Colors.red,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        title: 'Main',
                        subtitle: 'Hall',
                        leftMargin: width * 0.02,
                        rightMargin: width * 0.03,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, left: width * 0.02),
                child: Text(
                  'Booking Event',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BookingContainer(
                        color: Colors.blue,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        rightMargin: 0.0,
                        leftMargin: width * 0.05,
                        title: 'Choose',
                        subtitle: 'Event',
                      ),
                      BookingContainer(
                        color: Colors.blue,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        title: 'Choose',
                        subtitle: 'Event',
                        rightMargin: 0.0,
                        leftMargin: width * 0.02,
                      ),
                      BookingContainer(
                        color: Colors.blue,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        rightMargin: 0.0,
                        leftMargin: width * 0.02,
                        title: 'Choose',
                        subtitle: 'Event',
                      ),
                      BookingContainer(
                        color: Colors.blue,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        title: 'Choose',
                        subtitle: 'Event',
                        leftMargin: width * 0.02,
                        rightMargin: 0.0,
                      ),
                      BookingContainer(
                        color: Colors.blue,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        title: 'Choose',
                        subtitle: 'Event',
                        leftMargin: width * 0.02,
                        rightMargin: width * 0.03,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, left: width * 0.02),
                child: Text(
                  'Booking Set',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: height * 0.03),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BookingContainer(
                        color: Colors.amber,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        rightMargin: 0.0,
                        leftMargin: width * 0.05,
                        title: 'Choose',
                        subtitle: 'Event',
                      ),
                      BookingContainer(
                        color: Colors.amber,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        title: 'Choose',
                        subtitle: 'Event',
                        rightMargin: 0.0,
                        leftMargin: width * 0.02,
                      ),
                      BookingContainer(
                        color: Colors.amber,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        rightMargin: 0.0,
                        leftMargin: width * 0.02,
                        title: 'Choose',
                        subtitle: 'Event',
                      ),
                      BookingContainer(
                        color: Colors.amber,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        title: 'Choose',
                        subtitle: 'Event',
                        leftMargin: width * 0.02,
                        rightMargin: 0.0,
                      ),
                      BookingContainer(
                        color: Colors.amber,
                        imgUrl: 'images/logo.png',
                        imgHeight: height * 0.11,
                        title: 'Choose',
                        subtitle: 'Event',
                        leftMargin: width * 0.02,
                        rightMargin: width * 0.03,
                      )
                    ],
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

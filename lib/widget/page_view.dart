import 'package:flutter/material.dart';


class MyPageView extends StatefulWidget {
  const MyPageView({super.key, this.imgUrl, this.color});
  final imgUrl;
  final color;

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        left: width * 0.03,
        right: width * 0.03,
      ),
      decoration: BoxDecoration(
          color: widget.color,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                widget.imgUrl,
              )),
          borderRadius: BorderRadius.circular(
            height * 0.04,
          ),
          border: Border.all(
            color: Colors.orange,
            width: 3,
          )),
    );
  }
}

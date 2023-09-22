import 'package:flutter/material.dart';
import 'package:tony_shop/constant/const.dart';
import 'package:tony_shop/utils/drawer.dart';
import 'package:tony_shop/utils/search_page.dart';
import 'package:tony_shop/widget/page_view.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPageValue = 0.0;

  List<String> imageUrls = [
    'images/january1.jpg',
    'images/january1.jpg',
    'images/january1.jpg',
    'images/january1.jpg',
    'images/january1.jpg',
    'images/january1.jpg',
    'images/january1.jpg',
    'images/january1.jpg',
    'images/january1.jpg',
    'images/january1.jpg',
    'images/january1.jpg',
    'images/january1.jpg',
    // Add more image URLs as needed
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.09,
        backgroundColor: ConstantObject.primaryColor,
        // automaticallyImplyLeading: false,
        title: Image.asset(
          'images/logo.png',
          height: height * 0.15,
        ),
      ),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            child: Image.asset(
              'images/park.jpeg',
              repeat: ImageRepeat.repeat,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: height * 0.03,
              horizontal: width * 0.03,
            ),
            padding: EdgeInsets.only(top: height * 0.01),
            height: height * 0.08,
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(height * 0.01),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  focusColor: ConstantObject.primaryColor,
                  prefixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SearchPage()));
                      },
                      icon: Icon(Icons.search))),
            ),
          ),
          // Container(
          //   height: height * 0.28,
          //   width: width,
          //   margin: EdgeInsets.only(
          //       top: height * 0.15, left: width * 0.03, right: width * 0.03),
          //   decoration: BoxDecoration(
          //     color: Colors.green,
          //     borderRadius: BorderRadius.circular(
          //       height * 0.02,
          //     ),
          //   ),
          // ),
          Container(
            height: height * 0.30,
            margin: EdgeInsets.only(top: height * 0.15),
            child: Container(
                child: PageView(
                    scrollBehavior: MaterialScrollBehavior(),
                    children: [
                  MyPageView(
                    // color: Colors.red,
                    imgUrl: 'images/january1.jpg',
                  ),
                  MyPageView(
                    // color: Colors.red,
                    imgUrl: 'images/cris.jpeg',
                  ),
                  MyPageView(
                    // color: Colors.red,
                    imgUrl: 'images/cris.jpeg',
                  ),
                  MyPageView(
                    // color: Colors.red,
                    imgUrl: 'images/cris.jpeg',
                  ),
                  MyPageView(
                    // color: Colors.red,
                    imgUrl: 'images/cris.jpeg',
                  ),
                  MyPageView(
                    // color: Colors.red,
                    imgUrl: 'images/cris.jpeg',
                  ),
                  MyPageView(
                    // color: Colors.red,
                    imgUrl: 'images/cris.jpeg',
                  ),
                  MyPageView(
                    // color: Colors.red,
                    imgUrl: 'images/cris.jpeg',
                  ),
                  MyPageView(
                    // color: Colors.red,
                    imgUrl: 'images/cris.jpeg',
                  ),
                  MyPageView(
                    // color: Colors.red,
                    imgUrl: 'images/cris.jpeg',
                  ),
                  MyPageView(
                    // color: Colors.red,
                    imgUrl: 'images/cris.jpeg',
                  ),
                ])),
          ),
        ],
      ),
    );
  }
}

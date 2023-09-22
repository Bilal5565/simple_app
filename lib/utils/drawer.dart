import 'package:flutter/material.dart';
import 'package:tony_shop/constant/const.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: width,
                height: height * 0.30,
                color: ConstantObject.primaryColor,
                padding: EdgeInsets.only(
                  top: height * 0.05,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: height * 0.02),
                      height: height * 0.13,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'images/logo.png',
                            ),
                          )),
                    ),
                    Text(
                      'Tony shop',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'tony123@gmail.com',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.dashboard),
                      title: Text('Dashboard'),
                    ),
                    ListTile(
                      leading: Icon(Icons.dashboard),
                      title: Text('Dashboard'),
                    ),
                    ListTile(
                      leading: Icon(Icons.dashboard),
                      title: Text('Dashboard'),
                    ),
                    ListTile(
                      leading: Icon(Icons.dashboard),
                      title: Text('Dashboard'),
                    ),
                    ListTile(
                      leading: Icon(Icons.dashboard),
                      title: Text('Dashboard'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

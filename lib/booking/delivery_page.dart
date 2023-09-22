import 'package:flutter/material.dart';
import 'package:tony_shop/booking/delivery/home_delivery.dart';
import 'package:tony_shop/booking/delivery/table_page.dart';
import 'package:tony_shop/constant/const.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ConstantObject.primaryColor,
          title: Text('Delivery'),
          bottom: TabBar(
              indicator: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(
                width: 5,
                style: BorderStyle.solid,
                color: Colors.amber,
              ))),
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.delivery_dining_sharp,
                  ),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(
                    Icons.table_bar,
                  ),
                  text: 'Table',
                )
              ]),
        ),
        body: TabBarView(
          children: [
           HomeDeliveryPage(),
           TablePage(),
          ],
        ),
      ),
    );
  }
}

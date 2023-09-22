// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/const.dart';
import '../../main_page.dart';

class HomeDeliveryPage extends StatefulWidget {
  HomeDeliveryPage({super.key});

  @override
  State<HomeDeliveryPage> createState() => _HomeDeliveryPageState();
}

class _HomeDeliveryPageState extends State<HomeDeliveryPage> {
  late double height, width;
  final _formKey = GlobalKey<FormState>();

  final addController = TextEditingController();

  final quantityController = TextEditingController();

  final amountController = TextEditingController();

  String address = '';

  String quantity = '';

  String amount = '';

  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      currentDate: DateTime.now(),
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.05,
        horizontal: width * 0.03,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home Delivery ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Address';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        address = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ConstantObject.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            height * 0.03,
                          ),
                        ),
                        label: Text('Address',
                            style: TextStyle(
                              color: ConstantObject.primaryColor,
                            )),
                        prefixIcon: Icon(
                          CupertinoIcons.location_fill,
                          color: ConstantObject.primaryColor,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            height * 0.03,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        quantity = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ConstantObject.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            height * 0.03,
                          ),
                        ),
                        label: Text('Quantity',
                            style: TextStyle(
                              color: ConstantObject.primaryColor,
                            )),
                        prefixIcon: Icon(
                          Icons.onetwothree,
                          color: ConstantObject.primaryColor,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            height * 0.03,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        amount = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ConstantObject.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            height * 0.03,
                          ),
                        ),
                        label: Text('Amount',
                            style: TextStyle(
                              color: ConstantObject.primaryColor,
                            )),
                        prefixIcon: Icon(
                          Icons.money,
                          color: ConstantObject.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    TextFormField(
                      controller: _dateController,
                      readOnly: true,
                     decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ConstantObject.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            height * 0.03,
                          ),
                        ),
                        
                       label: Text('Select Date',
                            style: TextStyle(
                              color: ConstantObject.primaryColor,
                            )),
                        suffixIcon: InkWell(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Icon(Icons.calendar_today,color: ConstantObject.primaryColor,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    MyButton(
                      text: 'Deliver',
                      color: ConstantObject.primaryColor,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MainPage(),
                              ),
                            );
                          });
                        }
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  MyButton(
      {required String text, required color, required Null Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.085,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.03),
          color: color,
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}

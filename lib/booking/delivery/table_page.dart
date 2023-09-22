// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/const.dart';
import '../../main_page.dart';

class TablePage extends StatefulWidget {
  TablePage({super.key});

  @override
  State<TablePage> createState() => _HomeDeliveryPageState();
}

class _HomeDeliveryPageState extends State<TablePage> {
  late double height, width;
  final _formKey = GlobalKey<FormState>();

  final rowController = TextEditingController();

  final numberController = TextEditingController();

  

  String row = '';

  String number = '';


  

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.05,
        horizontal: width * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Table Delivery ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: height * 0.05,),

          Form(
            key: _formKey,
            child: Column(
            children: [
              TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Table Row';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            row = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(height * 0.03),
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
                            label: Text('Table Row',
                                style: TextStyle(
                                  color: ConstantObject.primaryColor,
                                )),
                            prefixIcon: Icon(
                              Icons.dining,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Table Number';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            number = value;
                          },
                          
                        
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(height * 0.03),
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
                            label: Text('Table Number',
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


 
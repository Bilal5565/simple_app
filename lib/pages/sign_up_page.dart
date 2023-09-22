// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tony_shop/main_page.dart';
import 'package:tony_shop/pages/login_page.dart';

import '../constant/const.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late double height, width;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  String name = '';
  String email = '';
  String password = '';

  bool _obsecureText = true;

  void _toggleObsecureText() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  validatePassword(String _password) {
    // Password validation rules (you can customize them)
    return _password.length >= 8; // Minimum length of 8 characters
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.10,
              ),
              Image.asset(
                'images/logo.png',
                height: height * 0.25,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
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
                            label: Text('Name',
                                style: TextStyle(
                                  color: ConstantObject.primaryColor,
                                )),
                            prefixIcon: Icon(
                              Icons.person,
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
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
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
                            label: Text('Email',
                                style: TextStyle(
                                  color: ConstantObject.primaryColor,
                                )),
                            prefixIcon: Icon(
                              Icons.mail,
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
                            RegExp regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            } else {
                              if (!regex.hasMatch(value)) {
                                return 'Enter valid password';
                              } else {
                                return null;
                              }
                            }
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: _obsecureText,
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
                           
                          
                            label: Text('Password',
                                style: TextStyle(
                                  color: ConstantObject.primaryColor,
                                )),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: ConstantObject.primaryColor,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obsecureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: ConstantObject.primaryColor,
                              ),
                              onPressed: _toggleObsecureText,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        MyButton(
                          text: 'SIGN UP',
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
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: ConstantObject.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LoginPage(),
                                  ),
                                );
                              },
                              child: Text('Sign In',
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ],
                        )
                      ],
                    )),
              )
            ],
          ),
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

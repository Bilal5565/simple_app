// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tony_shop/constant/const.dart';
import 'package:tony_shop/main_page.dart';
import 'package:tony_shop/pages/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<LoginPage> {
  late double height, width;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

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
                height: height * 0.12,
              ),
              Image.asset(
                'images/logo.png',
                height: height * 0.27,
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
                        controller: emailController,
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
                            borderRadius: BorderRadius.circular(height * 0.03),
                          ),
                          label: Text(
                            'Email',
                            style: TextStyle(
                              color: ConstantObject.primaryColor,
                            ),
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
                          prefixIcon: Icon(
                            Icons.mail,
                            color: ConstantObject.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      TextFormField(
                        controller: passController,
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
                            borderRadius: BorderRadius.circular(height * 0.03),
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
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ConstantObject.primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(
                              height * 0.03,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text('Forgot Password?',
                            style: TextStyle(
                              color: ConstantObject.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      SizedBox(
                        height: height * 0.07,
                      ),
                      MyButton(
                        text: 'LOGIN',
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
                            "Create an account?",
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
                                  builder: (_) => SignUpPage(),
                                ),
                              );
                            },
                            child: Text('Sign Up',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ],
                      ),
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

  MyButton({
    required String text,
    required color,
    required Null Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.080,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.03),
          color: color,
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}

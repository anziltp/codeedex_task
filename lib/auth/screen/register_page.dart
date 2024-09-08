

import 'package:flutter/material.dart';

import '../../main.dart';
import '../../services/api_services_page.dart';

import 'otp_page.dart';

class RegisterScreenPage extends StatefulWidget {
  const RegisterScreenPage({super.key});

  @override
  State<RegisterScreenPage> createState() => _RegisterScreenPageState();
}

class _RegisterScreenPageState extends State<RegisterScreenPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final validatePassword =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final validateEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String? passwordValidation(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    } else if (!validatePassword.hasMatch(value)) {
      return 'Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, a number, and a special character.';
    }
    return null;
  }
  String? ConfirmPasswordValidation(String value) {
    if (value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If form is valid, proceed with registration
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Registration successful!'),
      ));
      ApiServices().registerUser(nameController.text,emailController.text,passwordController.text,);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpScreenPage(),));

      // You can also navigate to the next screen here
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: Colors.white,)),
          backgroundColor: Colors.indigo,
          toolbarHeight: h * 0.17,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(w * 0.3),
                bottomRight: Radius.circular(w * 0.3)),
          ),
          title:Padding(
            padding:  EdgeInsets.all(w*0.15),
            child: Text("Register",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white,fontSize: w*0.09),),
          )
      ),
      body: SingleChildScrollView(
        child: Form(
          key:_formKey,
          child: Padding(
            padding:  EdgeInsets.only(top: w*0.1),
            child: Column(
              children: [
                // Center(
                //     child: Text(
                //       "Register",
                //       style: TextStyle(fontWeight: FontWeight.w700, fontSize: w * 0.06),
                //     )),
                Center(
                  child: Container(
                    width: w * 0.9,
                    height: h*0.65,
                    child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            // Row(
                            //   children: [
                            //     Text(
                            //       "Full Name",
                            //       style: TextStyle(fontWeight: FontWeight.w400),
                            //     ),
                            //   ],
                            // ),
                            // TextFormField(
                            //   keyboardType: TextInputType.emailAddress,
                            //   controller: nameController,
                            //
                            //   style: const TextStyle(color: Colors.black),
                            //   decoration: InputDecoration(
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(w * 0.02),
                            //       borderSide: const BorderSide(color: Colors.grey),
                            //     ),
                            //
                            //
                            //     hintText: ("Enter your email"),
                            //     label: const Text(""),
                            //     labelStyle: const TextStyle(color: Colors.grey),
                            //     border: const OutlineInputBorder(),
                            //     enabledBorder: OutlineInputBorder(
                            //         borderSide: const BorderSide(color: Colors.grey),
                            //         borderRadius: BorderRadius.circular(w * 0.02)),
                            //     hintStyle: const TextStyle(
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            // ),
                            Container(
                              height: h * 0.07,
                              width: w * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(w * 0.01),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: w * 0.01,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                controller: nameController,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: "Enter your Name",
                                  label: Padding(
                                    padding: EdgeInsets.all(w * 0.03),
                                    child: Text("Full Name"),
                                  ),
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: InputBorder.none, // Removes underline
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            // Row(
                            //   children: [
                            //     Text(
                            //       "E-mail",
                            //       style: TextStyle(fontWeight: FontWeight.w400),
                            //     ),
                            //   ],
                            // ),
                            // TextFormField(
                            //   keyboardType: TextInputType.emailAddress,
                            //   controller: emailController,
                            //   validator: (value) {
                            //     if (validateEmail.hasMatch(value!)){
                            //       return null;
                            //
                            //     }
                            //     else{
                            //       return "Enter a valid Email";
                            //     }
                            //   },
                            //   style: const TextStyle(color: Colors.black),
                            //   decoration: InputDecoration(
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(w * 0.02),
                            //       borderSide: const BorderSide(color: Colors.grey),
                            //     ),
                            //     hintText: ("Enter your email"),
                            //     label: const Text(""),
                            //     labelStyle: const TextStyle(color: Colors.grey),
                            //     border: const OutlineInputBorder(),
                            //     enabledBorder: OutlineInputBorder(
                            //         borderSide: const BorderSide(color: Colors.grey),
                            //         borderRadius: BorderRadius.circular(w * 0.02)),
                            //     hintStyle: const TextStyle(
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            // ),
                            Container(
                              height: h * 0.07,
                              width: w * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(w * 0.01),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: w * 0.01,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                validator: (value) {
                                  if (validateEmail.hasMatch(value!)) {
                                    return null;
                                  } else {
                                    return "Enter a Valid Email";
                                  }
                                },
                                style: const TextStyle(color: Colors.black),
                                 decoration: InputDecoration(
                                //   focusedBorder: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(w * 0.02),
                                //     borderSide: const BorderSide(color: Colors.grey),
                                  //),
                                  hintText: "Enter your Email",
                                  label: Padding(
                                    padding: EdgeInsets.all(w * 0.03),
                                    child: Text("Email"),
                                  ),
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: InputBorder.none, // Removes underline
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            // Row(
                            //   children: [
                            //     Text(
                            //       "Password",
                            //       style: TextStyle(fontWeight: FontWeight.w400),
                            //     ),
                            //   ],
                            // ),
                            // Container(
                            //   height: h * 0.07,
                            //   width: w * 0.9,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(w * 0.01),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey,
                            //         blurRadius: w * 0.01,
                            //       ),
                            //     ],
                            //   ),
                            //   child: TextFormField(
                            //     keyboardType: TextInputType.emailAddress,
                            //     controller: passwordController,
                            //     validator: (value) => passwordValidation(value!),
                            //     style: const TextStyle(color: Colors.black),
                            //     decoration: InputDecoration(
                            //       // focusedBorder: OutlineInputBorder(
                            //       //   borderRadius: BorderRadius.circular(w * 0.02),
                            //       //   borderSide: const BorderSide(color: Colors.grey
                            //       //   ),
                            //       //),
                            //       hintText: ("Enter your password"),
                            //       label: Padding(
                            //         padding:  EdgeInsets.all(w*0.03),
                            //         child: const Text("Password"),
                            //       ),
                            //       labelStyle: const TextStyle(color: Colors.black),
                            //      // border: const OutlineInputBorder(),
                            //       // enabledBorder: OutlineInputBorder(
                            //       //     borderSide: const BorderSide(color: Colors.grey),
                            //       //     borderRadius: BorderRadius.circular(w * 0.02)),
                            //       hintStyle: const TextStyle(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //       border: InputBorder.none,
                            //     ),
                            //   ),
                            // ),
                            Container(
                              height: h * 0.07,
                              width: w * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(w * 0.01),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: w * 0.01,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: passwordController,
                                validator: (value) => passwordValidation(value!),

                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  //   focusedBorder: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(w * 0.02),
                                  //     borderSide: const BorderSide(color: Colors.grey),
                                  //),
                                  hintText: "Enter your password",
                                  label: Padding(
                                    padding: EdgeInsets.all(w * 0.03),
                                    child: Text("Password"),
                                  ),
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: InputBorder.none, // Removes underline
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Must contain 8 char.",
                                  style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            // Row(
                            //   children: [
                            //     Text(
                            //       "Confirm Password",
                            //       style: TextStyle(fontWeight: FontWeight.w400),
                            //     ),
                            //   ],
                            // ),
                            // Container(
                            //   height: h * 0.07,
                            //   width: w * 0.9,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(w * 0.01),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey,
                            //         blurRadius: w * 0.02,
                            //       ),
                            //     ],
                            //   ),
                            //   child: TextFormField(
                            //     keyboardType: TextInputType.emailAddress,
                            //     controller: confirmpasswordController,
                            //     validator: (value) => ConfirmPasswordValidation(value!),
                            //     style: const TextStyle(color: Colors.black),
                            //     decoration: const InputDecoration(
                            //       // focusedBorder: OutlineInputBorder(
                            //       //   borderRadius: BorderRadius.circular(w * 0.02),
                            //       //   borderSide: const BorderSide(color: Colors.grey),
                            //       // ),
                            //       hintText: ("Confirm your password"),
                            //       label: Text("ConfirmPassword"),
                            //       labelStyle: TextStyle(color: Colors.black),
                            //      // border: const OutlineInputBorder(),
                            //       // enabledBorder: OutlineInputBorder(
                            //       //     borderSide: const BorderSide(color: Colors.grey),
                            //       //     borderRadius: BorderRadius.circular(w * 0.02)),
                            //       hintStyle: TextStyle(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //       border: InputBorder.none,
                            //     ),
                            //   ),
                            // ),
                            Container(
                              height: h * 0.07,
                              width: w * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(w * 0.01),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: w * 0.01,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: confirmpasswordController,
                                validator: (value) => ConfirmPasswordValidation(value!),
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  //   focusedBorder: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(w * 0.02),
                                  //     borderSide: const BorderSide(color: Colors.grey),
                                  //),
                                  hintText: "Confirm your password",
                                  label: Padding(
                                    padding: EdgeInsets.all(w * 0.03),
                                    child: Text("ConfirmPassword"),
                                  ),
                                  hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: InputBorder.none, // Removes underline
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: h*0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            _submitForm();

                          },
                          child: Container(
                            height: h*0.07,
                            width: w*0.8,

                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(w*0.03),color: Colors.indigo,),


                            child: Center(
                              child: Text("Create Account",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

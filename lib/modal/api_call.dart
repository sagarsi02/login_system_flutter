// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:login_system/Screen/login.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';

// post_data(TextEditingController nameController, TextEditingController emailController, TextEditingController userController, TextEditingController cityController, TextEditingController passwordController, TextEditingController cPasswordController) async{
//     var response = await http.post(Uri.parse("http://127.0.0.1:8000/api/createuser").replace(host: '10.0.2.2'),
//         body: {
//           "name" : nameController.text,
//           "username" : userController.text,
//           "email" : emailController.text,
//           "city" : cityController.text,
//           "password" : passwordController.text,
//           "c_password" : cPasswordController.text
//         });
//   }
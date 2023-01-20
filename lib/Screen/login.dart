// ignore_for_file: camel_case_types, non_constant_identifier_names, use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_system/Screen/authPage.dart';
import 'dart:convert';

import 'package:login_system/app/home.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xFF17D9AD),
                    foregroundColor: Colors.black,
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const authPage()),
                      // );
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17D9AD)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/login.png', width: 400),
                  const SizedBox(
                    height: 50,
                  ),
                  const formSection(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class formSection extends StatefulWidget {
  const formSection({super.key});

  @override
  State<formSection> createState() => _formSectionState();
}

class _formSectionState extends State<formSection> {
  post_data(TextEditingController userController,
      TextEditingController passwordController) async {
    var response = await http
        .post(Uri.parse("http://192.168.43.43:8000/api/login"), body: {
      "username": userController.text,
      "password": passwordController.text
    });
    if (response.statusCode == 200) {
      final cookies = response.headers['set-cookie'];
      if (cookies!.isNotEmpty && cookies.length > 2) {
        final authToken = cookies.split(';')[0].split('=')[1];
        pageRoute(authToken, userController.text);
        var message = jsonDecode(response.body)['Success'];
        var snackBar = SnackBar(content: Text(message));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      var message = jsonDecode(response.body)['Error'];
      var snackBar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String val = pref.getString("login");
    if (val != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              controller: userController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF17D9AD), width: 0.9),
                ),
                icon: Icon(Icons.admin_panel_settings),
                hintText: 'Please Enter Username',
                labelText: 'Username *',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Username';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF17D9AD), width: 0.8),
                ),
                icon: Icon(Icons.lock),
                hintText: 'Please Enter Password',
                labelText: 'Password *',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Password';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              post_data(userController, passwordController);
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF17D9AD)),
                elevation: MaterialStateProperty.all(10),
                overlayColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 31, 201, 172)),
                minimumSize: MaterialStateProperty.all(const Size(300, 40)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                textStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ))),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  void pageRoute(String token, username) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", token);
    await pref.setString("username", username);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MyHome()),
        (route) => false);
  }
}

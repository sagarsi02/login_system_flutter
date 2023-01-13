import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:login_system/Screen/login.dart';
import 'dart:convert';
// import '../modal/api_call.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
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
                      Navigator.pop(context);
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
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17D9AD)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/signup.png', width: 350),
                  const SizedBox(
                    height: 30,
                  ),
                  const formSection(),
                  const SizedBox(
                    height: 30,
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
  post_data(
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController userController,
      TextEditingController cityController,
      TextEditingController passwordController,
      TextEditingController cPasswordController) async {
    var response = await http.post(
        Uri.parse("http://127.0.0.1:8000/api/createuser")
            .replace(host: '10.0.2.2'),
        body: {
          "name": nameController.text,
          "username": userController.text,
          "email": emailController.text,
          "city": cityController.text,
          "password": passwordController.text,
          "c_password": cPasswordController.text
        });
    if (response.statusCode == 200 || response.statusCode == 202) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const login()),
      );
      var message = jsonDecode(response.body)['Success'];
      var snackBar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var message = jsonDecode(response.body)['Error'];
      var snackBar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF17D9AD), width: 0.8),
                ),
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Name *',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF17D9AD), width: 0.8),
                ),
                icon: Icon(Icons.mail),
                hintText: 'Please Enter Your Email',
                labelText: 'Email *',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Email';
                }
                return null;
              },
            ),
          ),
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
              controller: cityController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF17D9AD), width: 0.8),
                ),
                icon: Icon(Icons.location_city),
                hintText: 'Please Enter City',
                labelText: 'City *',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter City';
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
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextFormField(
              controller: cPasswordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF17D9AD), width: 0.8),
                ),
                icon: Icon(Icons.lock),
                hintText: 'Please ConfirmConfirm Password',
                labelText: 'Confirm Password *',
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
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              post_data(nameController, emailController, userController,
                  cityController, passwordController, cPasswordController);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 153, 219, 204)),
                elevation: MaterialStateProperty.all(10),
                overlayColor:
                    MaterialStateProperty.all(const Color(0xFF68D6CD)),
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
            child: const Text('SIGNUP'),
          ),
        ],
      ),
    );
  }
}

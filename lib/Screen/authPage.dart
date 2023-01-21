import 'package:flutter/material.dart';
import 'package:login_system/Screen/login.dart';
import 'package:login_system/Screen/signUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/home.dart';

class authPage extends StatefulWidget {
  const authPage({super.key});

  @override
  State<authPage> createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("login");
    if (val != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHome()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to TrackFit',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17D9AD)),
                ),
                Image.asset('assets/images/auth.jpg'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const login()),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF17D9AD)),
                      elevation: MaterialStateProperty.all(10),
                      overlayColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 31, 201, 172)),
                      minimumSize:
                          MaterialStateProperty.all(const Size(250, 40)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 15,
                      ))),
                  child: const Text('LOGIN'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const signUp()),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 153, 219, 204)),
                      elevation: MaterialStateProperty.all(10),
                      overlayColor:
                          MaterialStateProperty.all(const Color(0xFF68D6CD)),
                      minimumSize:
                          MaterialStateProperty.all(const Size(300, 40)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                      ))),
                  child: const Text('SIGNUP'),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    'Here you can track your location and track daily monitoring',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 135, 182, 182)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

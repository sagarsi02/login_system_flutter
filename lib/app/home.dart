import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_system/app/SideBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String token = '';
  late String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
    userCred();
  }

  void userCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("login")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrackFit'),
        backgroundColor: const Color(0xFF17D9AD),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 100),
                        shape: const CircleBorder(),
                        backgroundColor: const Color(0xFF17D9AD)),
                    child: const Text(
                      'Start',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    'Time',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _timeString,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17D9AD),
                    ),
                  ),
                  // Here i can add something
                  const SizedBox(height: 50),

                  Text('TODO \n     Map Implement'),

                  const SizedBox(height: 300),
                  Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                      child: FloatingActionButton.extended(
                        backgroundColor: const Color(0xFF17D9AD),
                        foregroundColor: const Color(0xFFffffff),
                        onPressed: () {
                          // Respond to button press
                        },
                        icon: const Icon(Icons.route),
                        label: const Text('My Activity'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: FloatingActionButton.extended(
                        backgroundColor: const Color(0xFF17D9AD),
                        foregroundColor: const Color(0xFFffffff),
                        onPressed: () {
                          // Respond to button press
                        },
                        icon: const Icon(Icons.location_history),
                        label: const Text('My Activity'),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: const SideBar(),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    // return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
    return DateFormat('hh:mm:ss').format(dateTime);
  }
}

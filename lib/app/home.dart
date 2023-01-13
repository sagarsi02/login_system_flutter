import 'package:flutter/material.dart';
import 'package:login_system/app/SideBar.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrackFit'),
        backgroundColor: Color(0xFF17D9AD),
      ),
      body: const Center(
        child: Text(
          "Welcome to Users Access Panel",
        ),
      ),
      drawer: const SideBar(),
    );
  }
}

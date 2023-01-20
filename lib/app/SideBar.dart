import 'package:flutter/material.dart';
import 'package:login_system/Screen/login.dart';
import 'package:login_system/app/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  post_data() async {
    var response =
        await http.get(Uri.parse("http://192.168.43.43:8000/api/logout"));
    if (response.statusCode == 200) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.clear();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const login()),
          (route) => false);
      var message = jsonDecode(response.body)['Success'];
      var snackBar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var message = jsonDecode(response.body)['Error'];
      var snackBar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  String token = '';
  String username = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userCred();
  }

  void userCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("login");
      username = pref.getString("username");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/69505695?v=4'),
            ),
            accountName: Text(username),
            accountEmail: Text('sagarsingh@grampower.com'),
            decoration: BoxDecoration(color: Color(0xFF17D9AD)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHome()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              post_data();
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text("Token : ${token}"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

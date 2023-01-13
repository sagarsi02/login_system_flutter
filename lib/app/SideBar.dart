import 'package:flutter/material.dart';
import 'package:login_system/app/home.dart';
// import 'package:user_access/Screen/location_page.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/69505695?v=4'),
            ),
            accountName: Text('Sagar Singh'),
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
            leading: const Icon(Icons.phone),
            title: const Text('Logout'),
            onTap: () {
              // Navigator.push(
              //   context,MaterialPageRoute(builder: (context) => const contact()),
              // );
              print('Logout');
            },
          ),
        ],
      ),
    );
  }
}

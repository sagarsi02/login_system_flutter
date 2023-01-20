import 'package:flutter/material.dart';
import 'package:login_system/app/SideBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class MyHome extends StatelessWidget {
//   const MyHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TrackFit'),
//         backgroundColor: Color(0xFF17D9AD),
//       ),
//       body: const Center(
//         child: Text(
//           "Welcome Users",
//         ),
//       ),
//       drawer: const SideBar(),
//     );
//   }
// }

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String token = '';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrackFit'),
        backgroundColor: Color(0xFF17D9AD),
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
                      backgroundColor: Color(0xFF17D9AD)
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: const SideBar(),
    );
  }
}

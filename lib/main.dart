import "package:flutter/material.dart";
import 'package:techacademy_flutter_project/landing_page.dart';
import 'package:techacademy_flutter_project/routes/routes.dart';
import 'package:techacademy_flutter_project/sign_in.dart';
import 'package:techacademy_flutter_project/ta_login_webview.dart';
import 'package:techacademy_flutter_project/ta_team_webview.dart';

// void main() => runApp(const MaterialApp(
//       title: 'Techacademy Mobile App',
//       home: FirstRoute(),
//     ));

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _bottomBarIndex = 0;
  static final List<Widget> _mainDisplayOptions = [
    LandingPage(),
    const Text("Notes"),
    const TATeamWebview(),
    const TALoginWebview(),
    SignIn()
  ];

  void _onItemTapped(int index) {
    setState(() => _bottomBarIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Techacademy Mobile App",
      initialRoute: '/',
      routes: {
        '/first': (context) => const FirstRoute(),
        '/second': (context) => const SecondRoute(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App Bar"),
        ),
        body: _mainDisplayOptions.elementAt(_bottomBarIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomBarIndex,
          onTap: _onItemTapped,
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          unselectedIconTheme: const IconThemeData(color: Colors.black26),
          selectedItemColor: Colors.black26,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notes),
              label: "Notes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: "Team",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: "Login",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
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
  /* var _questionIndex = 0;
  var _totalScore = 0;

  void _buttonHandler(int score) {
    print("Button pressed!: $_questionIndex");
    _totalScore += score;
    setState(() => _questionIndex++);
    print(_totalScore);
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  } */
  var _bottomBarIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _bottomBarIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        "text": "What's your favorite color?",
        "answers": [
          {"text": "Black", "score": 1},
          {"text": "Red", "score": 2},
          {"text": "Green", "score": 3},
          {"text": "White", "score": 4}
        ]
      },
      {
        "text": "What's your favorite animal?",
        "answers": [
          {"text": "Dog", "score": 1},
          {"text": "Cat", "score": 2},
          {"text": "Giraffe", "score": 3},
          {"text": "Anteater", "score": 4}
        ]
      },
    ];

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
        body: const TALoginWebview(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomBarIndex,
          onTap: _onItemTapped,
          selectedIconTheme: const IconThemeData(color: Colors.amber),
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
        // _questionIndex < _questions.length
        //     ? Quiz(
        //         questions: _questions,
        //         questionIndex: _questionIndex,
        //         buttonHandler: _buttonHandler,
        //       )
        //     : Result(_totalScore, resetQuiz),
      ),
    );
  }
}

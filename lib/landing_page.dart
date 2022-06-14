import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:techacademy_flutter_project/util.dart';

class LandingPage extends StatelessWidget {
  Future<String> getWelcomeMessage() async {
    String name = await readTextFile();
    return "Welcome $name";
  }

  static const textStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: getWelcomeMessage(),
        builder: (context, snapshot) {
          Text text;
          String welcomeMessage = snapshot.data!;

          if (snapshot.hasData) {
            text = Text(welcomeMessage, style: textStyle);
          } else if (snapshot.hasError) {
            print(snapshot.error);
            text = const Text(
              "Formbuilder Snapshot Error",
              style: textStyle,
            );
          } else {
            text = const Text("Awaiting result", style: textStyle);
          }
          return text;
        },
      ),
    );
  }
}

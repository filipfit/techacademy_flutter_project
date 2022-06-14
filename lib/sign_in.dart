import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:techacademy_flutter_project/util.dart';

class FormData {
  String? name;

  FormData({this.name});
}

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FormData formData = FormData();
  var inputFieldFill = Colors.white;

  void saveName(String? name) async {
    if (name == null || name == '') {
      setState(() => inputFieldFill = Colors.red[200]!);
      return;
    }
    if (inputFieldFill == Colors.red[200]) {
      setState(() => inputFieldFill = Colors.white);
    }
    await saveTextFile("name", name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              textInputAction: TextInputAction.done,
              onChanged: (String value) {
                formData.name = value;
              },
              decoration: InputDecoration(
                filled: true,
                labelText: "Name",
                hintText: "Your Name",
                fillColor: inputFieldFill,
              ),
            ),
          ),
          ElevatedButton(
            child: const Text("Save"),
            onPressed: () => saveName(formData.name),
          ),
          ElevatedButton(
            child: const Text("Debug Button"),
            onPressed: () async => print(await readTextFile(filename: "name")),
          )
        ],
      ),
    );
  }
}

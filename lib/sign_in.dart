import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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

  Future<File> _createFile() async {
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/name.txt");
    if (await file.exists()) return file;
    return await file.create();
  }

  void saveName(String? name) async {
    if (name == null || name == '') {
      setState(() => inputFieldFill = Colors.red[200]!);
      return;
    }
    if (inputFieldFill == Colors.red[200]) {
      setState(() => inputFieldFill = Colors.white);
    }
    File file = await _createFile();
    await file.writeAsString(name);
  }

  // void listFiles(Directory dir) async {
  //   await for (var entity in dir.list(recursive: true, followLinks: false)) {
  //     print(entity.path);
  //   }
  // }

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
            onPressed: () async {
              var file = await _createFile();
              var content = await file.readAsString();
              print(content);
            },
          )
        ],
      ),
    );
  }
}

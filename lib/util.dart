import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<File> createTextFile(String filename) async {
  var dir = await getApplicationDocumentsDirectory();
  var file = File("${dir.path}/$filename.txt");
  if (await file.exists()) return file;
  return await file.create();
}

Future<void> saveTextFile(String filename, String contents) async {
  var file = await createTextFile(filename);
  await file.writeAsString(contents);
}

Future<String> readTextFile({String filename = "name"}) async {
  var file = await createTextFile(filename);
  var content = await file.readAsString();
  return content;
}

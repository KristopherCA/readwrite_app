import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path; //home/directory/
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/data.txt'); //home/directory/data.txt
}

Future<File> writeData(String message) async {
  final file = await _localFile;
  return file.writeAsString('$message'); //write to file
}

Future<String> readData() async {
  try {
    final file = await _localFile;

    String data = await file.readAsString(); //read file
    return data;
  } catch (e) {
    return "";
  }
}

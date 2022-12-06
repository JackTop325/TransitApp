import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class Profile {
  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get localFile async {
    final path = await localPath;
    return File('$path/profile.json');
  }

  static Future<File> write(String profile) async {
    final file = await localFile;
    return file.writeAsString(profile);
  }

  static Future<String> read() async {
    try {
      final file = await localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      await write(jsonEncode({
        'init': false,
        'firstName': '',
        'lastName': '',
        'group': '',
        'lang': 'en',
        'avatar': '',
      }));
      return 'Creating file';
    }
  }
}

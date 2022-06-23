import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'storage_interface.dart';

class PathProviderStorege implements IStorage {
  @override
  Future<File> getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/dbtask.json');
  }

  @override
  Future<String> readData() async {
    String result = '[]';
    final arquivo = await getFile();
    try {
      result = await arquivo.readAsString();
    } catch (e) {
      debugPrint('ERROR readData :@: $e');
    }
    return result;
  }

  @override
  Future<File> saveData({required dynamic data}) async {
    final arquivo = await getFile();
    return arquivo.writeAsString(data);
  }
}

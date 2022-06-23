import 'dart:io';

abstract class IStorage {
  Future<File> getFile();
  Future<String> readData();
  Future<File> saveData({required dynamic data});
}

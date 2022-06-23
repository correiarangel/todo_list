// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';

import '../../../core/services/local_storege/storage_interface.dart';

abstract class ITaskRepository {
  Future<File> save({required List listTask});
  Future<File> get();
  Future<List> read();
}

class TaskRepositoriry implements ITaskRepository {
  final IStorage _pathProvidre;

  TaskRepositoriry(this._pathProvidre);

  @override
  Future<File> get() async {
    final file = await _pathProvidre.getFile();

    if (file == null) return throw Exception('Erro arquivo nulo');
    return file;
  }

  @override
  Future<List> read() async {
    var result = await 
    _pathProvidre.readData();

    if (result == null) return throw Exception('Erro retorno nulo');
    List data = json.decode(result);
    return data;
  }

  @override
  Future<File> save({required List listTask}) {
    final data = json.encode(listTask);
    return _pathProvidre.saveData(data: data);
  }
}

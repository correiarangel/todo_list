import 'dart:io';

import 'package:flutter/material.dart';
import '../components/snakbar_custom.dart';
import '../model/task_model.dart';
import '../repositories/task_repository.dart';

class TaskController extends ChangeNotifier {
  final ITaskRepository _repository;
  TaskController(this._repository);

  List _listTask = [];
  Map<String, dynamic> _taskRemoved = {};

  List get listTask => _listTask;

  addListTask(Map<String, dynamic> valueMap) {
    _listTask.add(valueMap);
    notifyListeners();
  }

  Future<void> removeTask(int index) async {
    _taskRemoved = _listTask[index];
    _listTask.removeAt(index);
    await _repository.save(listTask: _listTask);
    notifyListeners();
  }

  Future<void> undo(int index) async {
    _listTask.insert(index, _taskRemoved);

    await _repository.save(listTask: _listTask);
  }

  Future<bool> saveTask({required TaskModel taskModel}) async {
    final tasks = taskModel.toMap(taskModel);
    _listTask.add(tasks);
    notifyListeners();
    var file = await _repository.save(listTask: _listTask);
    // ignore: unnecessary_null_comparison
    if (file == null) return false;
    return true;
  }

  Future<File> getFile() async {
    final file = await _repository.get();
    return file;
  }

  Future readData() async {
    var data = await _repository.read();
    _listTask = data;
    notifyListeners();
  }

  Future<bool> edit({required TaskModel model}) async {
    bool result = false;
    for (var i = 0; i < _listTask.length; i++) {
      if (model.id == _listTask[i]['id']) {
        await saveEdit(index: i, model: model);
        return result = true;
      }
    }
    await readData();
    return result;
  }

  Future<void> saveEdit({
    required int index,
    required TaskModel model,
  }) async {
    _listTask[index]['id'] = model.id;
    _listTask[index]['title'] = model.title;
    _listTask[index]['deta'] = model.deta;
    _listTask[index]['isRealized'] = model.isRealized;
    await _repository.save(listTask: _listTask);
    notifyListeners();
  }

  Future<void> chageRealized(
      {required TaskModel model, required bool changeValue}) async {
    for (var i = 0; i < _listTask.length; i++) {
      if (model.id == _listTask[i]['id']) {
        await saveChageRealized(index: i, value: changeValue);
      }
    }
    await readData();
  }

  Future<void> saveChageRealized(
      {required int index, required bool value}) async {
    _listTask[index]['isRealized'] = value;
    await _repository.save(listTask: _listTask);
    notifyListeners();
  }

  bool valid({
    required TextEditingController editTitle,
    required TextEditingController editingDate,
  }) {
    if (editTitle.text.isEmpty) return false;
    if (editingDate.text.isEmpty) return false;
    return true;
  }

  message({
    required BuildContext context,
    required String msg,
    required Color color,
  }) {
    final snakbar = SnakBarCustom(
      color: color,
      content: Text(
        msg,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snakbar);
  }
}

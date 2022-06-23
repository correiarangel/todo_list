
import 'package:flutter/material.dart';

@immutable
class TaskModel {
  final String id;
  final String title;
  final String deta;
  final bool isRealized;

  const TaskModel({
    required this.id,
    required this.title,
    required this.deta,
    required this.isRealized,
  });

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      deta: map['deta'],
      isRealized: map ['isRealized'],
    );
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? deta,
    bool? isRealized,
  }) {
    return TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        deta: deta ?? this.deta,
        isRealized: isRealized ?? this.isRealized,);
  }

  factory TaskModel.enpty() {
    return const TaskModel(
      id: '',
      title: '',
      deta: '',
      isRealized: false,
    );
  }

  Map<String, dynamic> toMap(TaskModel task) {
    return {
      'id': task.id,
      'title': task.title,
      'deta': task.deta,
      'isRealized': task.isRealized,
    };
  }
}

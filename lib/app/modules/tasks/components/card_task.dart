import 'package:flutter/material.dart';

import '../controller/task_controller.dart';
import '../model/task_model.dart';
import 'dailog_adit_task.dart';
import 'snakbar_custom.dart';

class CardTask extends StatelessWidget {
  final TaskModel taskModel;
  final int index;
  final TaskController controller;
  final double width;
  final double height;
  CardTask({
    required this.taskModel,
    required this.controller,
    required this.index,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);
  final itemKey = DateTime.now().microsecondsSinceEpoch.toString();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: Key(itemKey),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          //recuperar último item excluído
          controller.removeTask(index);
          //snackbar

          const snakbar = SnakBarCustom(
            color: Colors.red,
            content: Text("Tarefa removida!!"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snakbar);
        },
        background: Container(
          color: Colors.red[800],
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              Icon(
                Icons.delete,
                color: Colors.grey,
              )
            ],
          ),
        ),
        //listaView de tarefas
        child: CheckboxListTile(
          secondary: Column(children: [
            IconButton(
                onPressed: () {
                  initEdit(context);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.grey,
                )),
          ]),
          title: Text(
            taskModel.title,
            style: TextStyle(
              color: Colors.grey[100],
            ),
          ),
          subtitle: Text(
            taskModel.deta,
            style: TextStyle(
              color: Colors.grey[100],
            ),
          ),
          value: taskModel.isRealized,
          onChanged: (value) {
            controller.chageRealized(
                model: taskModel, changeValue: value ?? false);
          },
        ),
      ),
    );
  }

  void initEdit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DailogEditTask(
        width: width,
        controller: controller,
        height: height,
        taskModel: taskModel,
      ),
    );
  }
}

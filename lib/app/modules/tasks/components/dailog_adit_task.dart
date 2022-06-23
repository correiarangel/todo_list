import 'package:flutter/material.dart';
import '../controller/task_controller.dart';
import '../model/task_model.dart';


class DailogEditTask extends StatelessWidget {
  final double width;
  final double height;
  final TaskController controller;
  final TaskModel taskModel;

  DailogEditTask({
    Key? key,
    required this.width,
    required this.controller,
    required this.height,
    required this.taskModel,
  }) : super(key: key);

  final _editTitle = TextEditingController();
  final _editingDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _setEditController();
     TaskModel _task  = _setParams();

    return AlertDialog(
      title: const Text('Editar tarefa'),
      content: SizedBox(
        width: width * 0.9,
        height: height * 0.15,
        child: Column(
          children: [
            TextFormField(
              controller: _editTitle,
              decoration: const InputDecoration(
                labelText: 'Descrição:',
                hintText: 'Digite uma tarefa',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
              ),
              autofocus: true,
              onChanged: (value) {
                
                _task = _task.copyWith(title: value);
              },
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _editingDate,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                hintText: 'Digite a data',
                labelText: 'Data:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
              ),
              onChanged: (value) {
                 
                _task = _task.copyWith(deta: value);
              },
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton.icon(
          icon: const Icon(Icons.cancel_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
          label: const Text(
            'CANCELAR',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        TextButton.icon(
          icon: const Icon(Icons.save_as_outlined),
          onPressed: () async {
            FocusScope.of(context).requestFocus(FocusNode());
           
            bool result = await _saveTaskEdit(_task);
            if (result) {
              controller.message(
                color: Colors.green,
                context: context,
                msg: "Tarefa Editada...",
              );
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            }
          },
          label: const Text(
            'SALVAR',
            style: TextStyle(fontSize: 18.0),
          ),
        )
      ],
    );
  }

  Future<bool> _saveTaskEdit(TaskModel task) async {
    bool result = false;
    bool valid = controller.valid(
      editingDate: _editingDate,
      editTitle: _editTitle,
    );
    if (valid) {
      result = await controller.edit(model: task);
    }

    return result;
  }

  void _setEditController() {
    _editTitle.text = taskModel.title;
    _editingDate.text = taskModel.deta;
  }

  TaskModel _setParams() {
    TaskModel task = TaskModel.enpty();
    task = task.copyWith(id: taskModel.id);
    task = task.copyWith(title: taskModel.title);
    task = task.copyWith(deta: taskModel.deta);
    task = task.copyWith(isRealized: taskModel.isRealized);
    return task;
  }
}

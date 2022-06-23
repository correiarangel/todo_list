import 'package:flutter/material.dart';
import '../controller/task_controller.dart';
import '../model/task_model.dart';
import '../value_object/deta_value.dart';

class DailogAddTask extends StatelessWidget {
  final double width;
  final double height;
  final TaskController controller;

  DailogAddTask({
    Key? key,
    // required this.editController,
    required this.width,
    required this.controller,
    required this.height,
  }) : super(key: key);

  final _editTitle = TextEditingController();
  final _editingHour = TextEditingController();
  final _editingDate = TextEditingController();
  final itemKey = DateTime.now().microsecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) {
    TaskModel task = TaskModel.enpty();
    return AlertDialog(
      title: const Text('Nova tarefa'),
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
                task = task.copyWith(title: value, id: itemKey);
              },
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onTap: () {
                _editingDate.text = DetaValue.setDate();
                task = task.copyWith(deta: _editingDate.text);
              },
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
                task = task.copyWith(deta: value);
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

            bool result = await _saveTask(task);
            if (result) {
              controller.message(
                color: Colors.green,
                context: context,
                msg: "Tarefa salva...",
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

  Future<bool> _saveTask(TaskModel task) async {
    bool result = false;
    bool valid = controller.valid(
      editingDate: _editingDate,
      editTitle: _editTitle,
    );
    if (valid) {
      result = await controller.saveTask(taskModel: task);
    }
    if (result) {
      _editTitle.clear();
      _editingHour.clear();
      _editingDate.clear();
    }

    return result;
  }
}

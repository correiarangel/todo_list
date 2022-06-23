import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


import '../components/card_task.dart';
import '../components/dailog_add_task.dart';
import '../controller/task_controller.dart';
import '../model/task_model.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final _controller = Modular.get<TaskController>();

  @override
  void initState() {
    super.initState();
    _controller.readData();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: AnimatedBuilder(
          animation: _controller,
          builder: (context, chaid) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: _controller.listTask.isEmpty ? true : false,
                    child: const Center(
                      child: Text(
                        'Não há Tarefas',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _controller.listTask.isNotEmpty ? true : false,
                    child: SizedBox(
                      height: height * .9,
                      child: ListView.builder(
                        itemCount: _controller.listTask.length,
                        itemBuilder: (context, index) {
                          final tasK = _controller.listTask[index];
                          final tastModel = TaskModel.fromJson(tasK);
               
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CardTask(
                              height: height,
                              width: width,
                              taskModel: tastModel,
                              controller: _controller,
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => DailogAddTask(
              // editController: _editingDescription,
              height: height,
              width: width,
              controller: _controller,
            ),
          );
        },
        tooltip: 'Adicionar tarefa',
        child: const Icon(Icons.add),
      ),
    );
  }
}

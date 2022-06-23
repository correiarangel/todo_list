import 'package:flutter_modular/flutter_modular.dart';
import 'controller/task_controller.dart';
import 'package:todo_list/app/modules/tasks/page/tasks_page.dart';
import 'repositories/task_repository.dart';

class TaskModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind> binds = [
    Bind<ITaskRepository>(((i) => TaskRepositoriry(i()))),
    Bind(((i) => TaskController(i()))),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: ((context, args) => const TasksPage())),
  ];
}

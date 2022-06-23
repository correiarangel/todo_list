import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/app/core/core_module.dart';
import 'package:todo_list/app/modules/tasks/task_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    TaskModule(),
  ];

  @override
  final List<Bind> binds = [
    
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: TaskModule()),
  ];
}

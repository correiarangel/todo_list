import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:todo_list/app/core/todo_ui/thema_dark.dart';
import 'package:todo_list/app/core/todo_ui/thema_ligth.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'To do',
      theme: ThemeLigth.theme,
      darkTheme: ThemeDark.theme,
      themeMode: ThemeMode.light,
    );
  }
}

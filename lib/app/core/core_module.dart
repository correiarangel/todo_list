import 'package:flutter_modular/flutter_modular.dart';
import 'services/local_storege/path_provider_storege.dart';
import 'services/local_storege/storage_interface.dart';


class CoreModule extends Module {
  @override
  final List<Bind> binds = [

    Bind<IStorage>(((i) => PathProviderStorege()),export: true) 
  ];

  @override
  final List<ModularRoute> routes = [];
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ratracks/presenter/pages/start/start_page.dart';

class StartModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const StartPage()),
  ];
}

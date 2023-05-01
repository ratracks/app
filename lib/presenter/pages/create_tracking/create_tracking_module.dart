import 'package:flutter_modular/flutter_modular.dart';

import 'create_tracking_page.dart';

class CreateTrackingModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => CreateTrackingPage()),
  ];
}

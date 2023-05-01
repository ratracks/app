import 'package:flutter_modular/flutter_modular.dart';
import 'package:ratracks/presenter/pages/create_tracking/create_tracking_module.dart';
import 'package:ratracks/presenter/pages/start/start_module.dart';

import 'presenter/pages/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: StartModule()),
    ModuleRoute(
      '/home', 
      module: HomeModule(),
      transition: TransitionType.rightToLeftWithFade
    ),
    ModuleRoute(
      '/create_tracking', 
      module: CreateTrackingModule(),
      transition: TransitionType.rightToLeftWithFade,
    ),
  ];
}
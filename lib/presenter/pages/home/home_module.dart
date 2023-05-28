import 'package:flutter_modular/flutter_modular.dart';
import 'package:ratracks/presenter/pages/home/home_page.dart';
import 'package:ratracks/presenter/pages/home/tracking_details/tracking_details_page.dart';

class HomeModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/tracking_details/:trackingId', child: (_, args) => TrackingDetailsPage(trackingId: args.params['trackingId'])),
  ];
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:ratracks/core/http/http_client_implementation.dart';
import 'package:ratracks/domain/usecases/tracking/create_tracking_usecase.dart';
import 'package:ratracks/external/datasources/http_tracking_datasource.dart';
import 'package:ratracks/infra/repositories/tracking_repository_implementation.dart';

import 'create_tracking_page.dart';

class CreateTrackingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CreateTrackingUsecase(repository: i())),
    Bind.lazySingleton(
        (i) => TrackingRepositoryImplementation(datasource: i())),
    Bind.lazySingleton((i) => HttpTrackingDatasource(httpClient: i())),
    Bind.lazySingleton((i) => HttpClientImplementation()),
  ];
  
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const CreateTrackingPage()),
  ];
}
